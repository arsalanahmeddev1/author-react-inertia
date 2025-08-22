<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('publish_packages', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->decimal('price', 8,2)->default(0);
            $table->json('features')->nullable();
            $table->string('stripe_price_id');
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('publish_packages');
    }
};
