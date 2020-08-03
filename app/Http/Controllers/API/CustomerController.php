<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\BaseAPIController;
use Illuminate\Support\Facades\Input;
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
use App\Category;
use App\ExtensionManager;
use App\Farm;
use App\Lead;
use App\Notify;
use App\Page;
use App\Password_reset;
use App\Role;
use App\RoleUser;
use App\Service;
use App\Status;
use App\User;

class CustomerController extends Controller
{
    public function __construct(User $User) {
        $this->User = $User;
    }


    public function customerRegistration(Request $request) {
        $validator = Validator::make($request->all(), [
            'firstname' => 'required|string|max:255',
            'surname' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'mobile_number' => 'required|integer|min:6',
            'date_of_birth' => 'required|string',
            'gender' => 'required|string',
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
            $fullname = trim($data['firstname']) .' '.trim($data['surname']);
            unset($data['password_confirmation']);
            $data['password'] = Hash::make($data['password']);
            $data['gender'] = ucwords($data['gender']);
            $data['name'] = $fullname;
            $result = User::create($data);
            $roleData = [
                'user_id' => $result->id,
                'role_id' => 4
            ];
            RoleUser::insert($roleData);
            $body = [
                'name' => $fullname,
                'email' => $request->email,
                'password' => $request->password
            ];

            Mail::send('emails.email_verification', $body, function ($message) use ($request) {
                $message->from(env('MAIL_FROM_ADDRESS'), 'Farmer');
                $message->to($request->email);
                $message->subject('Farmer : ' . $request->name . ' welcome to Farmer');
            });
            if ($result) {
                return response()->json([ 
                    'status_code' => 200,
                    'response' => 'Success',
                    'message' => 'Customer registration successfully!',
                ]);
            } else {
                return response()->json([ 
                    'status_code' => 400,
                    'response' => 'Error',
                    'message' => 'Customer registration failed!',
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


    public function getNotifications(Request $request){
        $token = null; $data = $request->all(); 
        $validator = Validator::make($data, [            
            'userid'=> 'required',            
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status_code' => 500,
                'response' => 'Error',
                'message' => implode(",",$validator->messages()->all()),
            ]);
        }
        try{                        
            $notificationData = Notify::where('receiver_id', $data['userid'])->get();
            return response()->json([
                'status_code' => 200,
                'response' => 'success',
                'message'   => 'User Notification',
                'data' => $notificationData
            ]);
  
        } catch(Exception $e){
            return response()->json([
                'status_code' => 500,
                'response' => 'error',
                'message' => "Category unavailable",
            ]); 
        }
      }


    public function getAllCustomer(){
        try{
            $custarray = array();
            $getCustomer = RoleUser::where('role_id', 4)->get();
            foreach($getCustomer as $cust){
                $custarray[] = $cust->user_id;
            }
            $customerData =  User::whereIn('id', $custarray)->get();
            return response()->json([
                'status_code' => 200,
                'response' => 'success',
                'message'   => 'All Customer',
                'data' => $customerData
            ]);
  
        } catch(Exception $e){
            return response()->json([
                'status_code' => 500,
                'response' => 'error',
                'message' => "Technical error, please contact to admin",
            ]); 
        }
    }


    




}
