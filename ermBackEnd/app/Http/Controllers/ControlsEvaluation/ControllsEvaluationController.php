<?php

namespace App\Http\Controllers\ControlsEvaluation;

use App\Http\Controllers\Controller;
use App\Models\ControlsEvaluation;
use Illuminate\Http\Request;

class ControllsEvaluationController extends Controller
{
    public function createControlEvaluation(Request $request){

        $request->validate([
            'risk_id' => 'required|int',
            'code' => 'required|string',
            'name' => 'required|string',
            'control_type' => 'required|string',
            'design' => 'required|string',
            'operation_effectiveness' => 'required|string',
            'documentation' => 'required|string',
            'monitoring' => 'required|string',
        ]);

        $controlEvaluation = new ControlsEvaluation([
            'risk_id' => $request->risk_id,
            'code' => $request->code,
            'name' => $request->name,
            'control_type' => $request->control_type,
            'design' => $request->design,
            'operation_effectiveness' => $request->operation_effectiveness,
            'documentation' => $request->documentation,
            'monitoring' => $request->monitoring
        ]);

        if( $controlEvaluation->save() ){
            return response()->json( ['success'=> true ],200 );
    }
}


public function getControlEvaluations(){

    return ControlsEvaluation::with('risk')->get();
}
public function getControlEvaluationById($id){

    return ControlsEvaluation::with('risk')->find($id);
}
}