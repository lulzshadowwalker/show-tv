<?php

namespace Tests\Feature\Auth;

use App\Livewire\Auth\Register;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Http\Testing\File;
use Livewire\Livewire;
use Tests\TestCase;

class RegistrationTest extends TestCase
{
    use RefreshDatabase;

    public function test_registration_screen_can_be_rendered(): void
    {
        $response = $this->get('/register');

        $response->assertStatus(200);
    }

    public function test_new_users_can_register(): void
    {
        $avatar = File::image('avatar.png', 100, 100);

        $response = Livewire::test(Register::class)
            ->set('name', 'Test User')
            ->set('email', 'test@example.com')
            ->set('password', 'password')
            ->set('password_confirmation', 'password')
            ->set('avatar', $avatar)
            ->call('register');

        $response
            ->assertHasNoErrors()
            ->assertRedirect(route('home.index', absolute: false));

        $this->assertDatabaseCount('users', 1);

        $user = User::first();
        $this->assertNotNull($user->avatarFile);

        $this->assertAuthenticated();
    }
}
