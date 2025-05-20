<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Story extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'title',
        'description',
        'author',
        'genre',
        'cover_image',
        'read_count',
        'comment_count',
        'likes_count',
        'style',
        'content',
        'is_community',
        'status',
        'user_id',
    ];

    /**
     * The attributes that should have default values.
     *
     * @var array
     */
    protected $attributes = [
        'is_community' => false,
    ];

    public function scopeCommunity($query)
    {
        return $query->where('is_community', true);
    }

    public function scopeStandard($query)
    {
        return $query->where('is_community', false);
    }

    /**
     * Get the characters for the story.
     */
    public function characters(): HasMany
    {
        return $this->hasMany(Character::class);
    }

    /**
     * Get the comments for the story.
     */
    public function comments(): HasMany
    {
        return $this->hasMany(Comment::class);
    }

    /**
     * Get the reads for the story.
     */
    public function reads(): HasMany
    {
        return $this->hasMany(StoryRead::class);
    }

    /**
     * Get the likes for the story.
     */
    public function likes(): HasMany
    {
        return $this->hasMany(StoryLike::class);
    }

    /**
     * Get the users who liked the story.
     */
    public function likedBy(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'story_likes')
            ->withTimestamps();
    }

    /**
     * Get the drafts for the story.
     */
    public function drafts(): HasMany
    {
        return $this->hasMany(StoryDraft::class);
    }
}
