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
            //$table->foreign('risk_id')->references('risk_identification_id')->on('identified_risks');
            $table->unsignedBigInteger('risk_owner_id');
            $table->foreign('risk_owner_id')->references('id')->on('users');
            $table->string('risk_name');
            $table->string('priority');
            $table->string('risk_description');
            $table->string('residual_impact');
            $table->string('residual_likelihood');
            $table->string('risk_exposure');
            $table->string('relevance_to_objectives');
            $table->string('risk_management_capacity');
            $table->timestamps();
        });
       
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
