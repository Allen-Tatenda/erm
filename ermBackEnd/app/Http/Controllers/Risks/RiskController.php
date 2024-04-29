<?php

namespace App\Http\Controllers\Risks;

use App\Http\Controllers\Controller;
use App\Models\Risks;
use Illuminate\Http\Request;

class RiskController extends Controller
{
    public function getRisks(){
        //return Risks::paginate(100);
        return Risks::with('riskOwner')->get();
    }

    public function getRiskById($id){
        $risk = Risks::with('riskOwner')->find($id);

            if ($risk) {
                return $risk;
            } else {
                return response()->json([
                    'message' => 'No record found',
                ],202);
            }
        
    }
    public function createRisk(Request $request){
        $request->validate([
            'risk_id' => 'required|string',
            'risk_owner_id' => 'required|string',
            'risk_name' => 'required|string',
            'priority' => 'required|string',
            'risk_description' => 'required|string',
            'residual_impact' => 'required|string',
            'residual_likelihood' => 'required|string',
            'risk_exposure' => 'required|string',
            'relevance_to_objectives' => 'required|string',
            'risk_management_capacity' => 'required|string', 
        ]);


        $risk = new Risks([
            'risk_id' => $request->risk_id,
            'risk_owner_id' => $request->risk_owner_id,
            'risk_name' => $request->risk_name,
            'priority' => $request->priority,
            'risk_description' => $request->risk_description,
            'residual_impact' => $request->residual_impact,
            'residual_likelihood' => $request->residual_likelihood,
            'risk_exposure' => $request->risk_exposure,
            'relevance_to_objectives' => $request->relevance_to_objectives,
            'risk_management_capacity' => $request->risk_management_capacity
        ]);

        if($risk->save()){
            return response()->json([
                'message'=> 'Risk Added Successfully'
            ],200);
        }
       
    }
}
