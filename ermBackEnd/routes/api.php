<?php

use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\ControlsEvaluation\ControllsEvaluationController;
use App\Http\Controllers\CriticalAssets\CriticalAssetsController;
use App\Http\Controllers\Discussions\discussionsController;
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
      Route::post('password', [AuthController::class, 'password']);
    });
});
Route::group(['middleware' => 'auth:sanctum'], function() {
    Route::get('users', [AuthController::class, 'user']);
  });

Route::middleware("auth:sanctum")->group(function () {
    Route::get('risks',[RiskController::class,'getRisks']);
    Route::get('risks/{riskId}',[RiskController::class,'getRiskById']);
    Route::post('risk',[RiskController::class,'createRisk']);
});

Route::middleware("auth:sanctum")->group(function () {
    Route::get('discussions',[discussionsController::class,'getDiscussions']);
    Route::get('discussions/{discussionId}',[discussionsController::class,'getDiscussionById']);
    Route::post('discussion',[discussionsController::class,'createDiscussion']);
});

Route::middleware("auth:sanctum")->group(function () {
    Route::get('controlEvaluations',[ControllsEvaluationController::class,'getControlEvaluations']);
    Route::get('controlEvaluations/{id}',[ControllsEvaluationController::class,'getControlEvaluationById']);
    Route::post('controlsEvaluation',[ControllsEvaluationController::class,'createControlEvaluation'])->middleware('auth:sanctum');
});

Route::middleware("auth:sanctum")->group(function () {
    Route::get('criticalAssets',[CriticalAssetsController::class,'getCriticalAssets']);
    Route::get('criticalAssets/{id}',[CriticalAssetsController::class,'getCriticalAssetById']);
    Route::post('criticalAsset',[CriticalAssetsController::class,'createCriticalAsset'])->middleware('auth:sanctum');
});


