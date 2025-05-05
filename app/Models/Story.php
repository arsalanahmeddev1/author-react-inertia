<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

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
        'style',
    ];

    /**
     * Get the characters for the story.
     */
    public function characters(): HasMany
    {
        return $this->hasMany(Character::class);
    }
}
