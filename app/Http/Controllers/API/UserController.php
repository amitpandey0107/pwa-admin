<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\BaseAPIController;
use Illuminate\Support\Facades\Input;
use Maatwebsite\Excel\Facades\Excel;
use App\Http\Requests;
use Exception;
use DateTime;
use Mail;
use Auth;
use Config;
use Validator;
use JWTAuth;
use JWTAuthException;
use Hash;
use App\Password_reset;
use App\Role;
use App\RoleUser;
use App\User;
use App\Exports\PostExport;


class UserController extends Controller
{

  public function __construct(User $User) {
      $this->User = $User;
  }


  /* ==================================
    LOGIN API
    =================================== */
    public function login(Request $request){
        $data = $request->all();
        $validator = Validator::make($request->all(), [
          'email' => 'required|string|email|max:255',      
          'password' => 'required|min:6',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status_code' => 500,
                'response' => 'Error',
                'message' => implode(",",$validator->messages()->all()),
            ]);
        }
        $credentials = array( 'email' => $data['email'],'password' => $data['password']);
        try{
            
            if (!$token = JWTAuth::attempt($credentials)) {
                return response()->json([
                    'status_code' => 500,
                    'response' => 'error',
                    'message' => 'invalid email or password',
                ]);
            }else{
                // $UpdateData = ['device_token'=>$data['device_token']];
                // User::where('email',$data['email'])->update($UpdateData);
                $UserData =  User::where('email',$data['email']) -> first()->toArray();
                $userRole=0;
                if ($UserData) {
                    $role = RoleUser::where('user_id', $UserData['id'])->first()->toArray();
                    $userRole = $role['role_id']; 
                }
                foreach ($UserData as $key => $value) {
                    if($value == null){
                        $UserData[$key] = ""; 
                    }
                }
                $UserData['token'] = $token;            
                $UserData['role'] = $userRole;            
                return response()->json([
                    'status_code' => 200,
                    'response' => 'success',
                    'message'   => 'successfully login',
                    'data' => $UserData
                ]);
            }
        } catch (JWTAuthException $e) {
            return response()->json([
                'status_code' => 400,
                'response' => 'Error',
                'message' => 'failed to create token',
            ]);
        }
        return response()->json(compact('token', 'data'));
    }

    
    /* ==================================
    SEND RESET PASSWORD EMAIL
    =================================== */
    public function send_mail_reset_password(Request $request) {
        $data = $request->all();
        $validator = Validator::make($data, [
            'email' => 'required|email',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status_code' => 500,
                'response' => 'error',
                'message' => implode(",",$validator->messages()->all()),
            ]);
        } 
        try{
            $chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            $code = "";
            for ($i = 0; $i < 4; $i++) {
                $code .= $chars[mt_rand(0, strlen($chars)-1)];
            }

            if($userExists = User::where('email', $data['email'])->count()){
                $body = [
                    'title' => "your verification code: ",
                    'content' => $code,
                ];
                Mail::send('emails.email_send_password', $body, function ($message) use ($data)
                {        
                    $message->from(env('MAIL_FROM_ADDRESS'), 'Farmer Application');
                    $message->to($data['email']);
                    $message->subject('Farmer-App Account reset password verify code.');        
                });


                $userExists_1 = Password_reset::where('email', $data['email'])->count();

                if($userExists_1>0){                   
                    Password_reset::where('email', $data['email'])->update(array('token' => $code));                    
                }else{
                   
                    $insertData = [
                        'email' => $data['email'],
                        'token' => $code,
                    ];

                    Password_reset::create($insertData);
                }
                return response()->json([
                    'status_code' => 200,
                    'response' => "success",
                    'message' => 'Verification code has been sent to your email address, please check your inbox',
                ]);

            }else{               
                return response()->json([
                    'status_code' => 500,
                    'response' => 'error',
                    'message' => "Email address not found!",
                ]);
            }  
        } catch(Exception $e){
            return response()->json([
                'status_code' => 500,
                'response' => 'error',
                'message' => "Technical error, please contact to admin",
            ]); 
        }       
        
       
    }

    /* ==================================
    CHECK RESET PASSWORD OTP
    =================================== */
    public function check_reset_password_otp(Request $request) {
        $data = $request->all();
        $validator = Validator::make($data, [
            'email' => 'required|email',
            'verify_code' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status_code' => 500,
                'response' => 'error',
                'message' => implode(",",$validator->messages()->all()),
            ]);
        }
        try{
            $CheckToken = Password_reset::where('email', $data['email'])
                    ->where('token', $data['verify_code'])
                    ->count();
            if(!$CheckToken){
                return response()->json([
                    'status_code' => 500,
                    'response' => "error",
                    'message' => 'Wrong verification code',
                 ]); 
            }else{
                Password_reset::where('email', $data['email'])->delete();
                return response()->json([
                    'status_code' => 200,
                    'response' => "success",
                    'message' => 'Successfully OTP verified ',
                ]); 
            }
        }   
        catch(Exaption $e){
            return response()->json([
                'status_code' => 500,
                'response' => "error",
                'message' => 'Technical error, please contact to admin.',
            ]);  
        } 
    }


    /* ==================================
    RESET PASSWORD API
    =================================== */
    public function reset_password(Request $request) {
        $data = $request->all();
        $validator = Validator::make($data, [
            'email' => 'required|email',
            'password' => 'required|min:6'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status_code' => 500,
                'response' => 'error',
                'message' => implode(",",$validator->messages()->all()),
            ]);
        }
        try{
            $update = [
                'password' => Hash::make($data['password'])
            ];
            $ResetPassword = User::where('email', $data['email'])->update($update);
            if(!$ResetPassword){
                return response()->json([
                    'status_code' => 500,
                    'response' => "error",
                    'message' => 'Unsuccess reset password',
                ]);
            }else{
                return response()->json([
                    'status_code' => 200,
                    'response' => "success",
                    'message' => 'Password changed successfully!',
                ]); 
            }
            
        } catch(Exaption $e){
            return response()->json([
                'status_code' => 500,
                'response' => "error",
                'message' => 'Technical error, please contact to admin',
            ]);  
        }
    }


    /* ==================================
    REGISTER USER
    =================================== */
    public function user_registration(Request $request) {
        $validator = Validator::make($request->all(), [
            'firstname' => 'required|string|max:255',
            'lastname' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'gender' => 'required|string',
            'date_of_birth' => 'required|string',
            'password' => 'required|min:6',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status_code' => 500,
                'response' => 'Error',
                'message' => implode(",",$validator->messages()->all()),
            ]);
        }
        try{
            $data = $request->all();
            $fullname = trim($data['firstname']) .' '.trim($data['lastname']);
            unset($data['password_confirmation']);
            $data['password'] = Hash::make($data['password']);
            $data['gender'] = ucwords($data['gender']);
            $data['name'] = $fullname;
            $data['mobile_number'] = '';
            $result = User::create($data);
            $roleData = [
                'user_id' => $result->id,
                'role_id' => 1
            ];
            RoleUser::insert($roleData);
            // $body = [
            //     'name' => $fullname,
            //     'email' => $request->email,
            //     'password' => $request->password
            // ];

            // Mail::send('emails.email_verification', $body, function ($message) use ($request) {
            //     $message->from(env('MAIL_FROM_ADDRESS'), 'PWA');
            //     $message->to($request->email);
            //     $message->subject('PWA : ' . $request->name . ' welcome to PWA');
            // });
            if ($result) {
                return response()->json([ 
                    'status_code' => 200,
                    'response' => 'Success',
                    'message' => 'User registration successfully!',
                ]);
            } else {
                return response()->json([ 
                    'status_code' => 400,
                    'response' => 'Error',
                    'message' => 'User registration failed!',
                ]);
            }
        } catch (JWTAuthException $e) {
            return response()->json([
                'status_code' => 400,
                'response' => 'Error',
                'message' => 'failed to create token',
            ]);
        }
        return response()->json(compact('token', 'data'));
    }


}
// Class ends