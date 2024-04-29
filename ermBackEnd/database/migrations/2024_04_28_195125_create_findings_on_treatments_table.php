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
        Schema::create('findings_on_treatments', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('treatments_evaluation_id');
            $table->foreign('treatments_evaluation_id')->references('id')->on('treatments_evaluations');
            $table->string('name');
            $table->string('findings');
            $table->string('recommendations');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('findings_on_treatments');
    }
};
