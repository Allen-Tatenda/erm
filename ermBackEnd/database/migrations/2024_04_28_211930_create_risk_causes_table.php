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
        Schema::create('risk_causes', function (Blueprint $table) {
            $table->id();
            $table->string('risk_cause_name');
            $table->string('risk_cause_description');
            $table->string('consequence_id');
            $table->unsignedBigInteger('risk_id');
            $table->foreign('risk_id')->references('id')->on('risks');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('risk_causes');
    }
};
