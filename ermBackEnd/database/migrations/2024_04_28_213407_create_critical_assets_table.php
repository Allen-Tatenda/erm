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
        Schema::create('critical_assets', function (Blueprint $table) {
            $table->id();
            $table->string('asset_id');//eg AST0322
            $table->string('asset_type');
            $table->string('asset');
            $table->string('location');
            $table->string('purchase_date');
            $table->string('purchase_price');
            $table->string('current_value');
            $table->string('depreciation');
            $table->string('expected_lifespan');
            $table->string('category');
            $table->unsignedBigInteger('owner_id');
            $table->foreign('owner_id')->references('id')->on('users');
            $table->unsignedBigInteger('risk_id');
            $table->foreign('risk_id')->references('id')->on('risks');
            $table->string('status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('critical_assets');
    }
};
