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
        Schema::create('risks', function (Blueprint $table) {
            $table->id();
            $table->string('risk_id')->unique();
            $table->unsignedBigInteger('risk_owner_id');
            $table->foreign('risk_owner_id')->references('id')->on('users');
            $table->string('risk_name');
            $table->string('priority');
            $table->text('risk_description');
            $table->string('risk_category');
            $table->string('risk_division');
            $table->string('strategic_objective');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('risks');
    }
};
