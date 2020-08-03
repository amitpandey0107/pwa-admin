<?php

namespace Modules\Admin\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
//use Illuminate\Support\Facades\Validator;
//use Illuminate\Support\Facades\Auth;
use App\Role;
use App\User;
use App\RoleUser;
use Hash;
use App\Package;
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
        return view('admin::users/consultants/create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Response
     */
    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
                    'name' => 'required|string|max:20',
                    'email' => 'required|email|unique:users',
                    'mobile_number' => 'required|integer|unique:users',
                    'date_of_birth' => 'required',
                    'gender' => 'required|string|max:10'
                        ], [
                    'name.required' => 'Please enter first name',
                    'email.required' => 'Please enter email address',
                    'email.unique' => 'Please enter unique email address',
                    'mobile_number.required' => 'Please enter phone number',
                    'date_of_birth.required' => 'Please select date of birth',
                    'gender.required' => 'Please select city'
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withInput($request->all())->withErrors($validator->errors());
        } else {
            try {
                $data = $request->all();

                

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
        $user = User::where('slug', $slug)->first();
        return view('admin::users/consultants/edit', compact('user'));
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
                    'name' => 'required|string|max:20',
                    'email' => 'required|email|unique:users,email,' . $userData->id,
                    'mobile_number' => 'required|integer',
                    'date_of_birth' => 'required',
                    'gender' => 'required|string|max:10'
                        ], [
                    'name.required' => 'Please enter first name',
                    'email.required' => 'Please enter email address',
                    'email.unique' => 'Please enter unique email address',
                    'mobile_number.required' => 'Please enter phone number',
                    'date_of_birth.required' => 'Please select date of birth',
                    'gender.required' => 'Please select city'
        ]);


        if ($validator->fails()) {
            return redirect()->back()->withInput($request->all())->withErrors($validator->errors());
        } else {
            try {
                $data = $request->all();
                unset($data['_token']);

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

}
