<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Validation\Rules\Unique;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('identified_risks',function(Blueprint $table){
            $table->increments('id');
            $table->string('risk_identification_id')->unique();
            $table->string('identified_risk_name');
            $table->string('identified_risk_description');
            $table->string('estimated_likelihood');
            $table->string('priority');
            $table->unsignedBigInteger('identified_by');
            $table->foreign('identified_by')->references('id')->on('users');
            $table->timestamp('date_identified');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('identified_risks');
    }
};
