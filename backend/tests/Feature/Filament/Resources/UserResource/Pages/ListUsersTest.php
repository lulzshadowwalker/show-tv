<?php

namespace Tests\Feature\Filament\Resources\UserResource\Pages;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use Tests\Traits\WithAdmin;

class ListUsersTest extends TestCase
{
    use RefreshDatabase, WithAdmin;

    public function test_it_renders_the_page(): void
    {
        $this->get(route('filament.dashboard.resources.users.index'))
            ->assertOk();
    }
}
