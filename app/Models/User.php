<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'is_guest',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
            'is_guest' => 'boolean',
        ];
    }

    /**
     * Check if the user is a guest user.
     *
     * @return bool
     */
    public function isGuest(): bool
    {
        return $this->is_guest;
    }

    /**
     * Get the comments for the user.
     */
    public function comments(): HasMany
    {
        return $this->hasMany(Comment::class);
    }

    /**
     * Get the story likes for the user.
     */
    public function storyLikes(): HasMany
    {
        return $this->hasMany(StoryLike::class);
    }

    /**
     * Get the stories that the user has liked.
     */
    public function likedStories(): BelongsToMany
    {
        return $this->belongsToMany(Story::class, 'story_likes')
            ->withTimestamps();
    }

    /**
     * Get the story drafts for the user.
     */
    public function storyDrafts(): HasMany
    {
        return $this->hasMany(StoryDraft::class);
    }

    public function isAdmin(): bool
    {
        return $this->is_admin === 1; // or simply: (bool) $this->isAdmin;
    }
}
