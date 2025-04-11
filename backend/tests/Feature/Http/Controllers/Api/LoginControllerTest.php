<?php

namespace Tests\Feature\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class LoginControllerTest extends TestCase
{
    use RefreshDatabase;

    public function test_it_logs_in_users(): void
    {
        User::factory()->create([
            'email' => 'john@example.com',
            'password' => 'password',
        ]);

        $this->post(route('api.auth.login'), [
            'data' => [
                'attributes' => [
                    'email' => 'john@example.com',
                    'password' => 'password',
                ],
            ]
        ], [
            'accept' => 'application/json',
        ])->assertOk()
            ->assertSeeText('token');
    }

    public function test_it_returns_forbidden_on_incorrect_combinations(): void
    {
        $this->post(route('api.auth.login'), [
            'data' => [
                'attributes' => [
                    'email' => 'fake@example.com',
                    'password' => 'password',
                ],
            ]
        ], [
            'accept' => 'application/json',
        ])->assertForbidden();
    }
}
