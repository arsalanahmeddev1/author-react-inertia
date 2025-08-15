<?php

namespace Database\Seeders;

use App\Models\Package;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class PackageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Package::create([
            'name' => 'Basic',
            'price_cents' => 0,
            'interval' => null,
            'features' => [
                'can_write' => false,
                'daily_words' => 0,
                'monthly_submissions' => 0,
                'can_read_community' => false
            ],
            'stripe_price_id' => 'price_1Rw9aURpT4YVvGC7Wh2RxKQv',
            'is_active' => true,
        ]);
    }
}
