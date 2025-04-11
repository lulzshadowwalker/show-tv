<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\RegisterRequest;
use App\Http\Resources\TokenResource;
use App\Models\User;
use App\Support\AccessToken;

class RegisterController extends Controller
{
    public function register(RegisterRequest $request)
    {
        $user = User::create([
            'name' => $request->name(),
            'email' => $request->email(),
            'password' => $request->password(),
        ]);

        return TokenResource::make(new AccessToken($user->createToken(config('app.name'))->plainTextToken));
    }
}
