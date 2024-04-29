<?php

namespace App\Http\Controllers\Discussions;

use App\Http\Controllers\Controller;
use App\Models\Discussions;
use Illuminate\Http\Request;

class discussionsController extends Controller
{
    public function getDiscussions(){
        //return Risks::paginate(100);
        //return Discussions::get();
        return Discussions::with('author')->get();
    }

    public function getDiscussionById($id){
        $risk = Discussions::with('author')->find($id);

            if ($risk) {
                return $risk;
            } else {
                return response()->json([
                    'message' => 'No record found',
                ],202);
            }
        
    }
    public function createDiscussion(Request $request){
        $request->validate([
            
            'discussion_owner_id'=>'required|string',
            'item_id'=>'required|string',
            'discussion_text'=>'required|string',
            'date'=>'required|date',
        ]);


        $risk = new Discussions([
            'discussion_owner_id' => $request->discussion_owner_id,
            'item_id' => $request -> item_id,
            'discussion_text' => $request -> discussion_text,
            'date' => $request ->date,
        ]);

        if($risk->save()){
            return response()->json([
                'message'=> 'Discussion Added Successfully'
            ],200);
        }
       
    }
}
