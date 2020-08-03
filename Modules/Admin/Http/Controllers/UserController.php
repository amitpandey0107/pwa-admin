<?php

namespace Modules\Admin\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
// use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use App\Role;
use App\User;
use App\RoleUser;
use Hash;
use Validator;
use Mail;

class UserController extends Controller {

    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function consultantList() {
        $result = User::whereHas('roles', function ($query) {
                    $query->where('role_id', '=', 3);
                })->get();
        return view('admin::users/consultants/index', compact('result'));
    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create() {
        $emanager = User::whereHas('roles', function ($query) {
            $query->where('role_id', '=', 2);
        })->get();
        return view('admin::users/consultants/create', compact('emanager'));
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Response
     */
    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'firstname' => 'required|string|max:45',
            'surname' => 'required|string|max:45',
            'email' => 'required|email|unique:users',
            'mobile_number' => 'required|numeric|min:0|not_in:0|unique:users',
            'date_of_birth' => 'required',
            'extension_manager' => 'required',
            'gender' => 'required|string|max:10'
                ], [
            'firstname.required' => 'Please enter first name',
            'surname.required' => 'Please enter surname',
            'email.required' => 'Please enter email address',
            'email.unique' => 'Please enter unique email address',
            'mobile_number.required' => 'Please enter phone number',
            'date_of_birth.required' => 'Please select date of birth',
            'gender.required' => 'Please select city',
            'extension_manager.required' => 'please select extension manager'
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withInput($request->all())->withErrors($validator->errors());
        } else {
            try {
                $data = $request->all();

                $data['extension_manager'] = json_encode($data['extension_manager']);

                $data['name'] = trim($data['firstname']).' '.trim($data['surname']);

                

                // Generate Password
                $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' . '0123456789!@#$%^&*()';
                $str = '';
                $max = strlen($chars) - 1;
                for ($i = 0; $i < 10; $i++) {
                    $str .= $chars[random_int(0, $max)];
                }
                $data['password'] = Hash::make($str);
                //unset($data['role_id']);

                
                $userId = User::create($data);
                
                $roleData = [
                    'user_id' => $userId->id,
                    'role_id' => 3
                ];
                RoleUser::insert($roleData);
                $body = [
                    'name' => $request->name,
                    'email' => $request->email,
                    'password' => $str
                ];

                

                Mail::send('emails.email_verification', $body, function ($message) use ($request) {
                    $message->from(env('MAIL_FROM_ADDRESS'), 'Farmer');
                    $message->to($request->email);
                    $message->subject('Farmer : ' . $request->name . ' welcome to Farmer');
                });
                

                
                return \Redirect::route('consultants')->with('success', "Consultant Added Successfully.");
            } catch (\Exception $e) {
                // dd($e);
                return false;
            }
        }
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Response
     */
    
    public function show($slug) {
        $user = User::where('slug', $slug)->first();        
        return view('admin::users/consultants/show',compact('user'));
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */
    public function edit($slug) {
        $emanager = User::whereHas('roles', function ($query) {
            $query->where('role_id', '=', 2);
        })->get();
        $user = User::where('slug', $slug)->first();
        $em = json_decode($user->extension_manager);
        $em_array = array();
        foreach ($em as $e) {
            $em_array[] = $e;
        }
        // dd($em_array);

        return view('admin::users/consultants/edit', compact('user', 'emanager', 'em_array'));
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Response
     */
    public function update(Request $request) {
//         dd($request->all());
        $userData = User::findBySlug($request->slug);
        $validator = Validator::make($request->all(), [
            'firstname' => 'required|string|max:45',
            'surname' => 'required|string|max:45',
            'email' => 'required|email|unique:users,email,' . $userData->id,
            'mobile_number' => 'required|numeric|min:0|not_in:0|unique:users,mobile_number,' . $userData->id,
            'date_of_birth' => 'required',
            'extension_manager' => 'required',
            'gender' => 'required|string|max:10'
            ], [
            'firstname.required' => 'Please enter first name',
            'surname.required' => 'Please enter surname',
            'email.required' => 'Please enter email address',
            'email.unique' => 'Please enter unique email address',
            'mobile_number.required' => 'Please enter phone number',
            'date_of_birth.required' => 'Please select date of birth',
            'extension_manager.required' => 'Please select extension manager',
            'gender.required' => 'Please select city'
        ]);


        if ($validator->fails()) {
            return redirect()->back()->withInput($request->all())->withErrors($validator->errors());
        } else {
            try {
                $data = $request->all();
                unset($data['_token']);
                $data['name'] = trim($data['firstname']).' '.trim($data['surname']);

                User::where('slug', $request->slug)->update($data);
                return redirect()->back()->with('success', "Consultant Updated Successfully.");
            } catch (Exception $e) {
                return redirect()->back()->with('error', "Something went wrong!");
            }
        }
    }

    /**
     * Update the specified resource from storage.
     * @param int $slug
     * @return Response
     */
    public function userStatus($slug) {
        $explode = explode('_', $slug);
        if (trim($explode[1]) == 0 || trim($explode[1]) == 1) {
            try {
                User::where('slug', $explode[0])->update(['status' => $explode[1]]);
                User::where('slug', $explode[0])->update(['status' => $explode[1]]);
                return \Redirect::route('consultants')->withSuccess('Status Updated successfully.');
            } catch (\Exception $e) {
                return \Redirect::route('consultants')->withErrors('Either something went wrong or invalid access.');
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Response
     */
    public function destroy(Request $request) {
        try {
            if (!User::where('id', $request->id)->delete()) {
                throw new \Exception();
            }
            return json_encode(['status' => 200]);
        } catch (\Exception $e) {
            return json_encode(['status' => 500]);
        }
    }

    /**
     * Show email view screen
     * @param Request $request
     * @return Response
     */
    public function showemail($slug) {
        $user = User::where('slug', $slug)->first();
        return view('admin::users/consultants/email', compact('user'));
    }


     /**
     * Show email view screen
     * @param Request $request
     * @return Response
     */
    public function sendemail(Request $request) {      
        // $userData = User::findBySlug($request->slug);
        $notificationData = array();
        $validator = Validator::make($request->all(), [
            'subject' => 'required',
            'message' => 'required',
            ],[
            'subject.required' => 'Please enter email subject',
            'message.required' => 'Please enter your message',           
        ]);


        if ($validator->fails()) {
            return redirect()->back()->withInput($request->all())->withErrors($validator->errors());
        } else {
            try {
                $data = $request->all();

                
                $body = [
                    'name' => $data['name'],
                    'subject' => $data['subject'],
                    'description' => $data['message']
                ];
                Mail::send(['html'=>'emails.email_notification'], $body, function ($message) use ($request) {
                    $message->from(env('MAIL_FROM_ADDRESS'), 'Farmer');
                    $message->to($request->email);
                    $message->subject('Farmer : ' . $request->name . ' Email from admin');
                });
                
                $user = Auth::user();
                $sender_id = $user->id;

                $notificationData = [
                    'sender_id' => $sender_id,
                    'receiver_id' => (int)$data['id'],
                    'title' => 'Email Notification',
                    'message' => 'Administrator has sent an email',
                    'user_type' => 1,
                ];               

                // dd($notificationData);
                Notify::create($notificationData);
               
                return redirect()->back()->with('success', "Email Sent Successfully.");
            } catch (Exception $e) {
                return redirect()->back()->with('error', "Something went wrong!");
            }
        }
    }


    /**
     * Show the specified resource.
     * @param int $id
     * @return Response
     */
    
    public function services($slug) {
        $user = User::where('slug', $slug)->first();         
        $leads = Lead::where('consultant_id',$user->id)->get();
        $closed = count(Lead::where('consultant_id',$user->id)->where('status', '4')->get());
        $notclosed = count(Lead::where('consultant_id',$user->id)->where('status', '!=','4')->get());
        return view('admin::users/consultants/service',compact('user', 'leads', 'closed', 'notclosed'));
    }

    /**
     * Update the specified resource from storage.
     * @param int $slug
     * @return Response
     */
    public function closeRequest($id) {
        $explode = explode('_', $id);
        if (trim($explode[1]) == 4 || trim($explode[1]) == 5) {
            try {
                Lead::where('id', $explode[0])->update(['status' => $explode[1]]);
                Lead::where('id', $explode[0])->update(['status' => $explode[1]]);
                return \Redirect::route('consultant-services')->withSuccess('Reuqest Status Updated successfully.');
            } catch (\Exception $e) {
                return \Redirect::route('consultant-services')->withErrors('Either something went wrong or invalid access.');
            }
        }
    }


    public function showservices($id) {        
        $leads = Lead::where('id',$id)->first();        
        return view('admin::users/consultants/viewservice',compact('leads'));
    }
        


}
