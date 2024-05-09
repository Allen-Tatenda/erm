<?php

namespace App\Http\Controllers;

use App\Models\RiskCause;
use App\Models\Risks;
use Illuminate\Http\Request;

class RiskCausesController extends Controller
{
    public function addRiskCause(Request $request){
        $validation = $request->validate([
        'risk_id'=>'required|integer',
        'added_by'=>'required|integer',
        'cause'=>'required|string',
        'description'=>'required|string',
        ]);

        if($validation){
            $cause = new RiskCause([
                'risk_id' => $request->risk_id ,
                'added_by' => $request->added_by ,
                'cause' => $request->cause ,
                'description' => $request->description ,
            ]);

            if($cause->save()){
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

    public function getCausesByRiskId($id){
        $risk = Risks::find($id);

        if($risk){
            $causes = $risk->causes;

           if($causes){
            return $causes;
           }
        }
        
            return response()->json([
                'message' => 'Error retriving records',
            ],422);
    
    }
}
