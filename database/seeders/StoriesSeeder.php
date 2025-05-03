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
            'cover_image' => 'assets/images/book-01.png',
            'read_count' => 95,
            'comment_count' => 64,
            'style' => 'Anne Rice style',
        ]);

        Story::create([
            'title' => 'Love in the Shadows',
            'description' => 'A romantic mystery set in the heart of Victorian London. When Lady Elizabeth meets the mysterious Duke of Blackwood, she finds herself drawn into a world of intrigue and passion. As secrets from the past emerge, their love is tested in ways they never imagined.',
            'author' => 'Victoria Saccenti',
            'genre' => 'Romance',
            'cover_image' => 'assets/images/book-02.png',
            'read_count' => 62,
            'comment_count' => 21,
            'style' => 'Victoria Saccenti style',
        ]);

        Story::create([
            'title' => 'The Midnight Hour',
            'description' => 'In the quiet town of Millfield, strange occurrences begin at midnight. As the town clock strikes twelve, residents report seeing shadows move on their own. Detective Sarah Morgan must uncover the truth before the darkness consumes them all.',
            'author' => 'Martha Grimes',
            'genre' => 'Horror',
            'cover_image' => 'assets/images/book-04.png',
            'read_count' => 36,
            'comment_count' => 6,
            'style' => 'Martha Grimes style',
        ]);

        Story::create([
            'title' => 'The Last Dragon',
            'description' => 'In a world where dragons are thought to be extinct, a young farm boy discovers a dragon egg hidden in the mountains. As the egg hatches, he must protect the last dragon from those who would destroy it, while learning about his own mysterious past and destiny.',
            'author' => 'J.K. Rowling',
            'genre' => 'Fantasy',
            'cover_image' => 'assets/images/book-03.png',
            'read_count' => 128,
            'comment_count' => 47,
            'style' => 'J.K. Rowling style',
        ]);

        Story::create([
            'title' => 'Beyond the Stars',
            'description' => 'When a mysterious signal is detected from a distant star system, astronaut Dr. Elena Reyes is chosen to lead humanity\'s first interstellar mission. What she discovers will change the course of human history forever and challenge everything we thought we knew about our place in the universe.',
            'author' => 'Isaac Asimov',
            'genre' => 'Science Fiction',
            'cover_image' => 'assets/images/book-01.png',
            'read_count' => 84,
            'comment_count' => 32,
            'style' => 'Isaac Asimov style',
        ]);

        Story::create([
            'title' => 'The Silent Witness',
            'description' => 'When a high-profile murder shakes the quiet town of Oakridge, all evidence points to a local businessman. But defense attorney Claire Mitchell believes he\'s innocent. With time running out, she must uncover the truth and find the real killer before an innocent man is condemned.',
            'author' => 'John Grisham',
            'genre' => 'Thriller',
            'cover_image' => 'assets/images/book-02.png',
            'read_count' => 73,
            'comment_count' => 29,
            'style' => 'John Grisham style',
        ]);

        Story::create([
            'title' => 'Echoes of the Past',
            'description' => 'Set against the backdrop of World War II, this sweeping saga follows three generations of the Fontaine family as they navigate love, loss, and betrayal across continents. From the streets of occupied Paris to the shores of post-war America, their story is one of resilience and hope in the darkest of times.',
            'author' => 'Ken Follett',
            'genre' => 'Historical Fiction',
            'cover_image' => 'assets/images/book-03.png',
            'read_count' => 112,
            'comment_count' => 53,
            'style' => 'Ken Follett style',
        ]);

        Story::create([
            'title' => 'Whispers in the Dark',
            'description' => 'After inheriting an old Victorian mansion from a distant relative, writer Emma Collins moves in hoping to find inspiration for her next novel. But as strange noises and unexplained phenomena begin to occur, she realizes the house holds dark secrets that someone—or something—doesn\'t want revealed.',
            'author' => 'Stephen King',
            'genre' => 'Horror',
            'cover_image' => 'assets/images/book-04.png',
            'read_count' => 91,
            'comment_count' => 38,
            'style' => 'Stephen King style',
        ]);

        Story::create([
            'title' => 'The Lost City',
            'description' => 'Archaeologist Dr. Maya Rivera has spent her career searching for the legendary city of Zintal. When she finally discovers a clue to its location in an ancient manuscript, she embarks on a dangerous expedition into the uncharted jungle. What she finds will rewrite history—if she survives to tell the tale.',
            'author' => 'Clive Cussler',
            'genre' => 'Adventure',
            'cover_image' => 'assets/images/book-01.png',
            'read_count' => 67,
            'comment_count' => 24,
            'style' => 'Clive Cussler style',
        ]);
    }
}
