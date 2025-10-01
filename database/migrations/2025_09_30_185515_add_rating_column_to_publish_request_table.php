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
        Schema::table('publish_request', function (Blueprint $table) {
            $table->string('rating')->nullable()->after('genre');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('publish_request', function (Blueprint $table) {
            $table->dropColumn('rating');
        });
    }
};
