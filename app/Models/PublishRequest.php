<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PublishRequest extends Model
{
    protected $table = 'publish_request';
    protected $primaryKey = 'id';
    
    protected $fillable = [
        'user_id',
        'story_id',
        'title',
        'character',
        'genre',
        'content',
        'status',
    ];
}
