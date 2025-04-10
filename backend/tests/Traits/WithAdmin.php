<?php

namespace Tests\Traits;

use App\Enums\Role;
use App\Models\User;

trait WithAdmin
{
    use WithRoles;

    protected User $admin;

    public function setUpWithAdmin(): void
    {
        $this->setUpWithRoles();

        $this->admin = User::factory()->create();
        $this->admin->assignRole(Role::admin);

        $this->actingAs($this->admin);
    }
}
