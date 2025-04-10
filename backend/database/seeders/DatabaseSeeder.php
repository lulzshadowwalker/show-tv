<?php

namespace Database\Seeders;

use App\Enums\Role;
use App\Models\Episode;
use App\Models\Follow;
use App\Models\Like;
use App\Models\Series;
use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([RoleSeeder::class]);

        $admin = User::factory()->create([
            'name' => 'Joe Admin',
            'email' => 'admin@example.com',
        ]);
        $admin->assignRole(Role::admin);

        $customers = User::factory()->count(100)->create();
        $customers->each->assignRole(Role::customer);

        $customer = User::factory()->create([
            'name' => 'Joe Customer',
            'email' => 'customer@example.com',
        ]);
        $customer->assignRole(Role::customer);

        $series = Series::factory()->count(10)->create();
        foreach ($series as $s) {
            if (rand(0, 1)) {
                Follow::factory()->for($customer)->create([
                    'followable_id' => $s->id,
                ]);
            }

            $episodes = Episode::factory()->count(rand(5, 12))->for($s)->create();
            foreach ($episodes as $e) {
                if (rand(0, 1)) {
                    Like::factory()->for($customer)->create([
                        'likeable_id' => $e->id,
                        'likeable_type' => Episode::class,
                    ]);
                }
            }
        }
    }
}
