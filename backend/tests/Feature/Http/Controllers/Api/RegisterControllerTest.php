<?php

namespace Tests\Feature\Http\Controllers\Api;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class RegisterControllerTest extends TestCase
{
    use RefreshDatabase;

    public function test_it_registers_users(): void
    {
        $this->post(route('api.auth.register'), [
            'data' => [
                'attributes' => [
                    'name' => 'John Doe',
                    'email' => 'john@example.com',
                    'password' => 'password',
                ],
            ]
        ], [
            'accept' => 'application/json',
        ])->assertOk()
            ->assertSeeText('token');
    }
}
