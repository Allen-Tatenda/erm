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
        Schema::create('treatments_evaluations', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('risk_id');
            $table->foreign('risk_id')->references('id')->on('risks');
            $table->string('code');
            $table->string('name');
            $table->string('design_and_implementation');
            $table->string('level_of_risk_reduction');
            $table->string('ongoing_monitoring_and_review');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('treatments_evaluations');
    }
};
