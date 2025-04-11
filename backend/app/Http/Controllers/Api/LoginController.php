<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use App\Http\Resources\TokenResource;
use App\Models\User;
use App\Support\AccessToken;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function login(LoginRequest $request)
    {
        if (! Auth::attempt(['email' => $request->email(), 'password' => $request->password()])) {
            return response()->json([
                'errors' => [
                    [
                        'message' => 'invalid email or password',
                        'details' => 'invalid email and password combination',
                        'code' => 403,
                    ]
                ]
            ], 403);
        }

        return TokenResource::make(new AccessToken(User::where('email', $request->email())->first()->createToken(config('app.name'))->plainTextToken));
    }
}
