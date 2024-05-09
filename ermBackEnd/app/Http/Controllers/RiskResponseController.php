<?php

namespace App\Http\Controllers;

use App\Models\RiskResponse;
use Illuminate\Http\Request;

class RiskResponseController extends Controller
{
    public function editRiskResponse(Request $request){

        $request->validate([
            'risk_id' => 'required|string',
            'added_by' => 'required|string',
            'risk_response' => 'required|string',
            ]);

        $riskResponse = RiskResponse::where('risk_id',$request->risk_id)->first();      

        if ($riskResponse) {
            $riskResponse->update([
                'risk_response' => $request->risk_response, 
            ]);
          return RiskResponse::where('risk_id',$request->risk_id)->first();

        } else {
            RiskResponse::create([
                'risk_id' => $request->risk_id ,
                'added_by' => $request->added_by ,
                'risk_response' => $request->risk_response,
                ]);
            return  RiskResponse::where('risk_id',$request->risk_id)->first();
        }
    }

    public function getRiskResponse($id){

        $riskResponse = RiskResponse::where('risk_id',$id)->first();

        if ($riskResponse) {
            return $riskResponse;
        } else {
            return response()->json([
                'message' => 'No record found',
            ],202);
        }
    }
}
