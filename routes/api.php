<?php

use Illuminate\Http\Request;
use Illuminate\Foundation\Http\FormRequest;

$api = app('Dingo\Api\Routing\Router');

$api->version('v1', [
    'namespace' => 'App\Http\Controllers',
    'middleware' => ['api'],
    'protected' => false
], 
function ($api) {
    $api->post('signup', '\App\Http\Controllers\API\UserController@signup');
    $api->post('login', '\App\Http\Controllers\API\UserController@login');  
    $api->post('sendmailresetpassword', '\App\Http\Controllers\API\UserController@send_mail_reset_password');  
    $api->post('checkresetpasswordotp', '\App\Http\Controllers\API\UserController@check_reset_password_otp');  
    $api->post('resetpassword', '\App\Http\Controllers\API\UserController@reset_password');  
    $api->post('userregistration', '\App\Http\Controllers\API\UserController@user_registration');  
});


$api->version('v1', [
    'namespace' => 'App\Http\Controllers',
    'middleware' => ['jwt.verify'],
    'protected' => false
        ], function ($api) {

    $api->post('getpostbyuser', '\App\Http\Controllers\API\UserController@get_post_by_user');
    $api->get('getallpost', '\App\Http\Controllers\API\UserController@get_all_post');
    $api->post('addevent', '\App\Http\Controllers\API\UserController@add_event');
   
   
});

?>