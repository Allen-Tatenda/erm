<?php

namespace App\Http\Controllers;

use App\Models\Risks;
use Illuminate\Http\Request;

class RisksController extends Controller
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
            'risk_category'=> 'required|string',
            'risk_division'=> 'required|string',
            'strategic_objective'=> 'required|string'
        ]);


        $risk = new Risks([
            'risk_id' => $request->risk_id,
            'risk_owner_id' => $request->risk_owner_id,
            'risk_name' => $request->risk_name,
            'priority' => $request->priority,
            'risk_description' => $request->risk_description,
            'risk_category'=> $request->risk_category,
            'risk_division'=> $request->risk_division,
            'strategic_objective'=>$request->strategic_objective
        ]);

        if($risk->save()){
            return response()->json([
                'message'=> 'Risk Added Successfully'
            ],200);
        }
       
    }
}
