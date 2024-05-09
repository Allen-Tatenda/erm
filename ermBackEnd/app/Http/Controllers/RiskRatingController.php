<?php

namespace App\Http\Controllers;

use App\Models\RiskRating;
use Illuminate\Http\Request;

class RiskRatingController extends Controller
{


    public function editRiskRating(Request $request){

        $request->validate([
            'risk_id' => 'required|string',
            'added_by' => 'required|string',
            'likelihood' => 'required|string',
            'impact' => 'required|string',
            ]);
        $riskRating = RiskRating::with('risk')->find($request->risk_id);      

        if ($riskRating) {
            $riskRating->update([
                'likelihood' => $request->likelihood,
                'impact' => $request->impact,
               
            ]);
            return RiskRating::with('risk')->find($request->risk_id);

        } else {
                RiskRating::create([
                'risk_id' => $request->risk_id ,
                'added_by' => $request->added_by ,
                'likelihood' => $request->likelihood ,
                'impact' => $request->impact , //impact on scale
                ]);
        }
    }

    public function editRiskExposure(Request $request){

        $request->validate([
            'risk_id' => 'required|string',
            'added_by' => 'required|string',
            'risk_impact' => 'required|string',
            'risk_exposure' => 'required|string'
            ]);
        $riskRating = RiskRating::with('risk')->find($request->risk_id);      
        if ($riskRating) {
           $riskRating->update([
                'risk_impact' => $request->risk_impact,
                'risk_exposure' => $request->risk_exposure,
            ]);

            return RiskRating::with('risk')->find($request->risk_id);

        } else {
             return   RiskRating::create([
                'risk_id' => $request->risk_id ,
                'added_by' => $request->added_by ,
                'risk_impact' => $request-> risk_impact, //financial impact
                'risk_exposure' => $request->risk_exposure , // financial exposure
                ]);
        }
    }
    public function getRiskRating($id){

        $riskRating = RiskRating::find($id);

        if ($riskRating) {
            return $riskRating;
        } else {
            return response()->json([
                'message' => 'No record found',
            ],202);
        }
    }
}
