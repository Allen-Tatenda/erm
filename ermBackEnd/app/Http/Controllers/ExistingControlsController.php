<?php

namespace App\Http\Controllers;

use App\Models\ExistingControls;
use Illuminate\Http\Request;

class ExistingControlsController extends Controller
{
    public function getExistingControlsByRiskId($id){
        $controls = ExistingControls::where('risk_id', $id)->get();

        if ($controls) {
            return $controls;
        }
        else{
            return response()->json([
                'message' => 'Error retriving records',
            ],422);
        }
    }


    public function addExistingControl(Request $request){

        $validation = $request->validate([
            'risk_id'=>'required|integer',
            'control_name'=>'required|string',
            'control_description'=>'required|string',
            'control_owner'=>'required|integer',
            'effectiveness'=>'required|string',
            'control_type'=>'required|string',
            ]);


            if($validation){
                $cause = new ExistingControls([
                    'risk_id' => $request->risk_id,
                    'control_name' => $request->control_name,
                    'control_description' => $request->control_description,
                    'control_owner' => $request->control_owner,
                    'effectiveness' => $request->effectiveness,
                    'control_type' => $request->control_type
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
                'message' => 'Error retriving records',
            ],422);
        }
    }

    public function editExistingControl(Request $request){

        $validation = $request->validate([
            'id'=>'required|integer',
            'risk_id'=>'required|integer',
            'control_name'=>'required|string',
            'control_description'=>'required|string',
            'control_owner'=>'required|integer',
            'effectiveness'=>'required|string',
            'control_type'=>'required|string',
            ]);

            $control = ExistingControls::where('id',$request->id)->first();

            if($validation && $control){
                $result = $control->update([
                    'risk_id' => $request->risk_id,
                    'control_name' => $request->control_name,
                    'control_description' => $request->control_description,
                    'control_owner' => $request->control_owner,
                    'effectiveness' => $request->effectiveness,
                    'control_type' => $request->control_type
                ]);
    
                if($result){
                    return response()->json([
                        'message' => 'Success',
                    ],200);
                }else{
                    return response()->json([
                        'message' => 'Failed  to edit record',
                    ],500);
                }
            }
       
        else{
            return response()->json([
                'message' => 'Error retriving records',
            ],422);
        }
    }
}
