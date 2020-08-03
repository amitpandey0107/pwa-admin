<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Cviebrock\EloquentSluggable\Sluggable;
use Cviebrock\EloquentSluggable\SluggableScopeHelpers;

class Password_reset extends Model
{
    use Sluggable;
    use SluggableScopeHelpers;

    public function sluggable() {
        return [
            
        ];
    }
    protected $hidden = [];
    protected $guarded = [];
}
