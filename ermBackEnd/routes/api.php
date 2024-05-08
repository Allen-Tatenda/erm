<?php

use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\RiskRatingController;
use App\Http\Controllers\RisksController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


Route::group(['prefix' => 'auth'], function () {
    Route::post('login', [AuthController::class, 'login']);
    Route::post('register', [AuthController::class, 'register']);
    Route::group(['middleware' => 'auth:sanctum'], function() {
      Route::get('logout', [AuthController::class, 'logout']);
      Route::get('user', [AuthController::class, 'user']);
      Route::post('password', [AuthController::class, 'password']);
    });
});
Route::group(['middleware' => 'auth:sanctum'], function() {
    Route::get('users', [UserController::class, 'getAllUsers']);
  });

Route::middleware("auth:sanctum")->group(function () {
    Route::get('risks',[RisksController::class,'getRisks']);
    Route::get('risks/{riskId}',[RisksController::class,'getRiskById']);
    Route::post('risk',[RisksController::class,'createRisk']);
});


Route::middleware("auth:sanctum")->group(function () {
    Route::get('riskrating/{riskId}',[RiskRatingController::class,'getRiskRating']);
    Route::post('riskrating',[RiskRatingController::class,'editRiskRating']);
});