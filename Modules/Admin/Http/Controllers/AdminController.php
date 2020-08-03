<?php

namespace Modules\Admin\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Auth;
use Validator;
use Toastr;
use Exception;
use App\User;
use App\RoleUser;


class AdminController extends Controller {

    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index() {

        return view('admin::index');
    }

    public function login() {
        if (Auth::user() && Auth::user()->roles[0]->id == 1) {
            return redirect('admin/dashboard');
        }
        return view('admin::auth/login');
    }

    public function dashboard() {
        // \Artisan::call('storage:link');
        $user = RoleUser::count();   
        return view('admin::dashboard', compact('user'));
    }

    public function logout(Request $request) {
        Auth::guard('web')->logout();
        $request->session()->flush();
        $request->session()->regenerate();
        return redirect()->guest(route('admin-login'));
    }

    public function admin_profile() {
        return view('admin::admin_profile');
    }

    public function admin_edit_profile(Request $request) {
        $data = request()->all();
        $validator = Validator::make($data, [
                    'name' => 'required',
                    'email' => 'required|email|max:255|unique:users,email,' . Auth::user()->id,
                    'mobile_number' => 'integer|numeric',
                    //'mobile_number' => 'integer|numeric|min:8|max:12',
                    'mobile_code' => 'integer|numeric',
        ]);
        if ($validator->fails()) {
            //Toastr::error($validator->errors(), 'Error');
            return \Redirect::back()->withInput()->withErrors($validator->errors());
        }

        try {
            unset($data['_token']);
            User::where('id', 1)->update($data);
            Toastr::success('Successfully Update Profile', 'Success');
            return redirect()->back();
        } catch (Exception $e) {
            dd($e);
            Toastr::error('Profile Not Update', 'Error');
            return redirect()->back();
        }
    }

    public function changePassword(Request $request) {
        $data = $request->all();
        $validator = Validator::make($data, [
                    'password' => 'required|confirmed|min:6',
        ]);
        if ($validator->fails()) {
            return \Redirect::back()->withInput()->withErrors($validator->errors());
        }
        try {
            unset($data['_token']);
            User::where('id', 1)->update(['password' => \Hash::make($data['password_confirmation'])]);
            Toastr::success('Successfully Update Password', 'Success');
            return redirect()->back();
        } catch (\Exception $e) {
            dd($e);
            Toastr::error('Password Not Update', 'Error');
            return redirect()->back();
        }
    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create() {
        return view('admin::create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Response
     */
    public function store(Request $request) {
        //
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Response
     */
    public function show($id) {
        return view('admin::show');
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */
    public function edit($id) {
        return view('admin::edit');
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Response
     */
    public function update(Request $request, $id) {
        //
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Response
     */
    public function destroy($id) {
        //
    }


    

}
