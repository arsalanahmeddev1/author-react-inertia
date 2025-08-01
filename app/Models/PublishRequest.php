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
        'cover_image',
        'title',
        'character',
        'genre',
        'content',
        'status',
    ];

    /**
     * Get the user that owns the publish request.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Get the story that owns the publish request.
     */
    public function story()
    {
        return $this->belongsTo(Story::class);
    }
}
