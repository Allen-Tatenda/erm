<?php

namespace App\Http\Controllers\Auth;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'username' => 'required|string|min:4|unique:users',
            'firstname' => 'required|string',
            'lastname' => 'required|string',
            'designation' => 'required|string',
            'roles' => 'required|string',
            'department' => 'required|string',
            'email'=>'required|email|string|unique:users',
            'password'=>'required|string|min:6',
           
        ]);

        $user = new User([
            'username'  => $request->username,
            'firstname'  => $request->firstname,
            'lastname'  => $request->lastname,
            'designation'  => $request->designation,
            'roles'  => $request->roles,
            'department'  => $request->department,
            'email' => $request->email,
            'password' => bcrypt($request->password),
        ]);

        if($user->save()){
            $tokenResult = $user->createToken('Personal Access Token');
            $token = $tokenResult->plainTextToken;

            return response()->json([
            'user' => $user,
            'message' => 'Successfully created user!',
            'accessToken'=> $token,
            ],201);
        }
        else{
            return response()->json(['error'=>'Provide proper details']);
        }
    }

    public function login(Request $request)
    {
        $request->validate([
            'email'=>'required|email|string|exists:users',
            'password'=>'required|string|min:6',
           
        ]);

       $user = User::where('email', $request->email)->first();

       if(!$user || !Hash::check($request['password'], $user->password)){

        return response([
            'message' => 'Bad Credentials'
        ],401);
       }

        else{
            $tokenResult = $user->createToken('Personal Access Token');
            $token = $tokenResult->plainTextToken;

            return response()->json([
            'user' => $user,
            'message' => 'Successfully logged in user!',
            'accessToken'=> $token,
            ],200);
        }
        
    }

public function user(Request $request)
{
    return response()->json($request->user());
}

public function logout(Request $request)
{
    $request->user()->tokens()->delete();

    return response()->json([
    'message' => 'Successfully logged out'
    ]);

}
}
