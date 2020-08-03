<?php

use Illuminate\Http\Request;
use Illuminate\Foundation\Http\FormRequest;

$api = app('Dingo\Api\Routing\Router');


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// $api->version('v1', [
//     'namespace' => 'App\Http\Controllers',
//     'middleware' => ['api'],
//     'protected' => false
// ], 
// function ($api) {
//     $api->post('signup', '\App\Http\Controllers\API\UserController@signup');
//     $api->post('login', '\App\Http\Controllers\API\UserController@login');  
//     $api->post('customer-registration', '\App\Http\Controllers\API\CustomerController@customerRegistration');  
// });

// $api->version('v1', [
//     'namespace' => 'App\Http\Controllers',
//     'middleware' => ['jwt.verify'],
//     'protected' => false
//         ], function ($api) {

//     // $api->post('customer-registration', '\App\Http\Controllers\API\CustomerController@customerRegistration');
   
   
// });

// Route::middleware('auth:api')->get('/admin', function (Request $request) {
//     return $request->user();
// });