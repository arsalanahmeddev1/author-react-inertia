<?php

namespace Database\Seeders;

use App\Models\Story;
use Illuminate\Database\Seeder;

class StoriesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create sample stories
        Story::create([
            'title' => 'Death at Fallow End',
            'description' => 'A tale wrapped in shadows, where ancient secrets meet modern art in an eerie village. When the Earl of Halverton is found dead in his koi pond, the quiet village of Fallow End is turned upside down. Unveil the mystery with Detective Felix Merton and uncover the dark undercurrents of wealth, power, and love.',
            'author' => 'Anne Rice',
            'genre' => 'Mystery',
            'cover_image' => 'assets/images/book-03.png',
            'read_count' => 95,
            'comment_count' => 64,
            'style' => 'Anne Rice style',
        ]);

        Story::create([
            'title' => 'Death At Fallow End',
            'description' => 'A romantic mystery set in the heart of Victorian London. When Lady Elizabeth meets the mysterious Duke of Blackwood, she finds herself drawn into a world of intrigue and passion. As secrets from the past emerge, their love is tested in ways they never imagined.',
            'author' => 'Victoria Saccenti',
            'genre' => 'Romance',
            'cover_image' => 'assets/images/book-02.png',
            'read_count' => 62,
            'comment_count' => 21,
            'style' => 'Victoria Saccenti style',
        ]);

        Story::create([
            'title' => 'Death At Fallow End',
            'description' => 'In the quiet town of Millfield, strange occurrences begin at midnight. As the town clock strikes twelve, residents report seeing shadows move on their own. Detective Sarah Morgan must uncover the truth before the darkness consumes them all.',
            'author' => 'Martha Grimes',
            'genre' => 'Horror',
            'cover_image' => 'assets/images/book-04.png',
            'read_count' => 36,
            'comment_count' => 6,
            'style' => 'Martha Grimes style',
        ]);
    }
}
