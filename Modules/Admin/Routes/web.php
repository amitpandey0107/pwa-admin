<?php

/*
  |--------------------------------------------------------------------------
  | Web Routes
  |--------------------------------------------------------------------------
  |
  | Here is where you can register web routes for your application. These
  | routes are loaded by the RouteServiceProvider within a group which
  | contains the "web" middleware group. Now create something great!
  |
 */

Route::prefix('admin')->group(function() {
    Route::get('/', 'AdminController@login');
    Route::get('/login', 'AdminController@login')->name('admin-login');
});




Route::group(['middleware' => 'Isadmin'], function () {
    Route::prefix('admin')->group(function() {

        // ADMIN
        Route::post('/admin-logout', 'AdminController@logout')->name('admin-logout');
        Route::get('/dashboard', 'AdminController@dashboard')->name('dashboard');
        Route::get('/admin-profile', 'AdminController@admin_profile')->name('admin-profile');
        Route::post('/admin-edit-profile', 'AdminController@admin_edit_profile')->name('admin-edit-profile');
        Route::post('/admin-change-password', 'AdminController@changePassword')->name('admin-change-password');

        // POST
        Route::get('/post', 'AdminController@posts')->name('post');
        Route::get('/post-add', 'AdminController@createPosts')->name('post-add');
        Route::post('/post-add', 'AdminController@postsAdd')->name('post-add');
        Route::post('/user-status/{slug}', 'AdminController@userStatus')->name('user-status');
        
    });
});
