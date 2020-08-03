<?php

namespace App\Http\Middleware;

use Closure;
use Auth;

class Admin {

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next) {
         
        if (Auth::user() && Auth::user()->roles[0]->id == 1) {
            return $next($request);
        } else {
            return redirect('admin/login');
        }
    }

}
