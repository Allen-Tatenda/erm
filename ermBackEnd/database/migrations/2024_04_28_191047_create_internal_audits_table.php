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
        Schema::create('internal_audits', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('risk_id');
            $table->foreign('risk_id')->references('id')->on('risks');
            $table->unsignedBigInteger('controls_evaluation_id');
            //$table->foreign('controls_evaluation_id')->references('id')->on('controls_evaluation');
            $table->unsignedBigInteger('treatments_evaluation_id');
            //$table->foreign('treatments_evaluation_id')->references('id')->on('treatments_evaluation');
            $table->unsignedBigInteger('findings_on_controls_id');
            //$table->foreign('findings_on_controls_id')->references('id')->on('findings_on_controls');
            $table->unsignedBigInteger('findings_on_treatments_id');
            //$table->foreign('findings_on_treatments_id')->references('id')->on('findings_on_treatments');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('internal_audits');
    }
};
