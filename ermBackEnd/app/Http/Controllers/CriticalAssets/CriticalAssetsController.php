<?php

namespace App\Http\Controllers\CriticalAssets;

use App\Http\Controllers\Controller;
use App\Models\CriticalAssets;
use Illuminate\Http\Request;

class CriticalAssetsController extends Controller
{

    public function createCriticalAsset(Request $request){

        $request->validate([
            'asset_id' => 'required|string',
            'asset_type' => 'required|string',
            'asset' => 'required|string',
            'location' => 'required|string',
            'purchase_date' => 'required|string',
            'purchase_price' => 'required|string',
            'current_value' => 'required|string',
            'depreciation' => 'required|string',
            'expected_lifespan' => 'required|string',
            'category' => 'required|string',
            'owner_id' => 'required|int',
            'risk_id' => 'required|int',
            'status' => 'required|string',
        ]);

        $asset = new CriticalAssets([
            'asset_id' => $request-> asset_id,
            'asset_type' => $request-> asset_type,
            'asset' => $request-> asset,
            'location' => $request-> location,
            'purchase_date' => $request-> purchase_date,
            'purchase_price' => $request-> purchase_price,
            'current_value' => $request-> current_value,
            'depreciation' => $request-> depreciation,
            'expected_lifespan' => $request-> expected_lifespan,
            'category' => $request-> category,
            'owner_id' => $request-> owner_id,
            'risk_id' => $request-> risk_id,
            'status' => $request-> status,
        ]);

        if($asset->save()){
            return response()->json([
                'message'=> 'Asset saved successfully',
            ],200);
    }
}
    public function getCriticalAssets(){
        return CriticalAssets::with('user')->with('risks')->get();
    }
    public function getCriticalAssetById($id){
        return CriticalAssets::with('user')->with('risks')->find($id);
    }
}
