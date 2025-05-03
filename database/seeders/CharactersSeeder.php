<?php

namespace Database\Seeders;

use App\Models\Character;
use App\Models\Story;
use Illuminate\Database\Seeder;

class CharactersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create 3-5 characters for each story
        Story::all()->each(function ($story) {
            // Create a hero character for each story
            Character::create([
                'name' => fake()->name() . ' the Hero',
                'story_id' => $story->id,
                'description' => 'The main protagonist of the story. ' . fake()->paragraph(3),
            ]);

            // Create a villain character for each story
            Character::create([
                'name' => fake()->name() . ' the Villain',
                'story_id' => $story->id,
                'description' => 'The main antagonist of the story. ' . fake()->paragraph(3),
            ]);

            // Create 1-3 additional random characters
            $additionalCount = rand(1, 3);
            Character::factory()->count($additionalCount)->create([
                'story_id' => $story->id,
            ]);
        });
    }
}
