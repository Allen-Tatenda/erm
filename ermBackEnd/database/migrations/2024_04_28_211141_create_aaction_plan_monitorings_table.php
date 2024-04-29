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
        Schema::create('aaction_plan_monitorings', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('treatments_evaluation_id');
            $table->foreign('treatments_evaluation_id')->references('id')->on('treatments_evaluations');
            $table->unsignedBigInteger('controls_evaluation_id');
            $table->foreign('controls_evaluation_id')->references('id')->on('controls_evaluations');
            $table->string('status');
            $table->string('name');
            $table->string('progress');
            $table->string('code');
            $table->string('treatment');
            $table->unsignedBigInteger('treater_id');
            $table->foreign('treater_id')->references('id')->on('users');
            $table->timestamp('start_date')->nullable();
            $table->timestamp('end_date')->nullable();
            $table->string('followup_comments');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('aaction_plan_monitorings');
    }
};
