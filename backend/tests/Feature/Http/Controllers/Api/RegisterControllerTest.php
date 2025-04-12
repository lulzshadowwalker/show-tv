<?php

namespace Tests\Feature\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use Tests\Traits\WithRoles;

class RegisterControllerTest extends TestCase
{
    use RefreshDatabase, WithRoles;

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

        $this->assertDatabaseCount('users', 1);
        $user = User::first();
        $this->assertTrue($user->isCustomer);
    }
}
