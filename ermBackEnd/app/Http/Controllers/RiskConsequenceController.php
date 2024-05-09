<?php

namespace App\Http\Controllers;

use App\Models\RiskConsequence;
use App\Models\Risks;
use Illuminate\Http\Request;

class RiskConsequenceController extends Controller
{
    public function addRiskConsequence(Request $request){
        $validation = $request->validate([
        'risk_id'=>'required|integer',
        'added_by'=>'required|integer',
        'consequence'=>'required|string',
        'description'=>'required|string',
        ]);

        if($validation){
            $consequence = new RiskConsequence([
                'risk_id' => $request->risk_id ,
                'added_by' => $request->added_by ,
                'consequence' => $request->consequence ,
                'description' => $request->description ,
            ]);

            if($consequence->save()){
                return response()->json([
                    'message' => 'Success',
                ],200);
            }else{
                return response()->json([
                    'message' => 'Failed  to add record',
                ],500);
            }
        }
        else{
            return response()->json([
                'message' => 'Invalid Data',
            ],422);
        }
    }

    public function getConsequencesByRiskId($id){
        $risk = Risks::find($id);

        if($risk){
            $consequences = $risk->consequences;

           if($consequences){
            return $consequences;
           }
        }
        
            return response()->json([
                'message' => 'Error retriving records',
            ],422);
    
    }
}
