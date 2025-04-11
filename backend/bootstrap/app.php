<?php

use Illuminate\Auth\AuthenticationException;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__ . '/../routes/web.php',
        api: __DIR__ . '/../routes/api.php',
        commands: __DIR__ . '/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        //
    })
    ->withExceptions(function (Exceptions $exceptions) {
        if (! request()->routeIs('api.*')) return;

        $exceptions->render(function (NotFoundHttpException $e) {
            return response()->json([
                'errors' => [
                    [
                        'error' => 'Not Found',
                        'details' => 'Resource Not Found',
                        'code' => 404,
                    ]
                ]
            ], 404);
        });

        $exceptions->render(function (AuthenticationException $e) {
            return response()->json([
                'errors' => [
                    [
                        'error' => 'Unauthorized',
                        'details' => 'provide proper token in the authorization header to access this resource',
                        'code' => 401,
                    ]
                ]
            ], 401);
        });

        $exceptions->render(function (Exception $e) {
            return response()->json([
                'errors' => [
                    [
                        'error' => 'Internal server erorr',
                        'details' => 'an internal server error has occurred',
                        'code' => 500,
                    ]
                ]
            ], 500);
        });
    })->create();
