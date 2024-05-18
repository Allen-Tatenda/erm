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
        Schema::create('existing_controls', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('risk_id');
            $table->foreign('risk_id')->references('id')->on('risks');
            $table->string('control_name');
            $table->string('control_description');
            $table->unsignedBigInteger('control_owner');
            $table->foreign('control_owner')->references('id')->on('users');
            $table->string('effectiveness');
            $table->string('control_type');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('existing_controls');
    }
};
