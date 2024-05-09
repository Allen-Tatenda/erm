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
        $riskRating = RiskRating::where('risk_id',$request->risk_id)->first();      

        if ($riskRating) {
            $riskRating->update([
                'likelihood' => $request->likelihood,
                'impact' => $request->impact,
               
            ]);
          return RiskRating::where('risk_id',$request->risk_id)->first();

        } else {
            RiskRating::create([
                'risk_id' => $request->risk_id ,
                'added_by' => $request->added_by ,
                'likelihood' => $request->likelihood ,
                'impact' => $request->impact , //impact on scale
                ]);
            return  RiskRating::where('risk_id',$request->risk_id)->first();
        }
    }

    public function editRiskExposure(Request $request){

        $request->validate([
            'risk_id' => 'required|string',
            'added_by' => 'required|string',
            'risk_impact' => 'required|string',
            'risk_exposure' => 'required|string'
            ]);
        $riskRating = RiskRating::where('risk_id',$request->risk_id)->first();      
        if ($riskRating) {
           $riskRating->update([
                'risk_impact' => $request->risk_impact,
                'risk_exposure' => $request->risk_exposure,
            ]);

            return RiskRating::where('risk_id',$request->risk_id)->first();

        } else {
             RiskRating::create([
                'risk_id' => $request->risk_id ,
                'added_by' => $request->added_by ,
                'risk_impact' => $request-> risk_impact, //financial impact
                'risk_exposure' => $request->risk_exposure , // financial exposure
                ]);
            return  RiskRating::where('risk_id',$request->risk_id)->first();
        }
    }
    public function getRiskRating($id){

        $riskRating = RiskRating::where('risk_id',$id)->first();

        if ($riskRating) {
            return $riskRating;
        } else {
            return response()->json([
                'message' => 'No record found',
            ],202);
        }
    }
}
