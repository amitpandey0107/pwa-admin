<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Cviebrock\EloquentSluggable\Sluggable;
use Cviebrock\EloquentSluggable\SluggableScopeHelpers;

class Post extends Model
{
	use Notifiable;
	use Sluggable;
	use SluggableScopeHelpers;

    public function sluggable() {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }

    protected $guarded = [];

     protected $hidden = [
         'created_at', 'updated_at'
    ];


    public function getUser() {
        return $this->belongsTo('App\User', 'user_id');
    }
}
