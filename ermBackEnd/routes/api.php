<?php

use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\Risks\RiskController;
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
    });
});

Route::middleware("auth:sanctum")->group(function () {
    Route::get('risks',[RiskController::class,'getRisks']);
    Route::post('risk',[RiskController::class,'createRisk']);
});


//Route::get('risks',[RiskController::class,'risks'])->middleware('auth:sanctum');

// Route::get('getallmedia',[MediaContoller::class,'getAllMedia'])->middleware('auth:sanctum');
// Route::get('getalllikes',[LikesController::class,'getAllLikes'])->middleware('auth:sanctum');