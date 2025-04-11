<?php

namespace Tests\Unit\Actions;

use App\Actions\FollowSeriesAction;
use App\Models\Series;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class FollowSeriesActionTest extends TestCase
{
    use RefreshDatabase;

    public function test_it_follows_a_series(): void
    {
        $user = User::factory()->create();
        $this->actingAs($user);
        $series = Series::factory()->create();

        $following = FollowSeriesAction::make()->execute($series);
        $this->assertTrue($following);
        $this->assertCount(1, $user->follows);
    }

    public function test_it_unfollows_a_series(): void
    {
        $user = User::factory()->create();
        $this->actingAs($user);
        $series = Series::factory()->create();
        $series->follows()->create(['user_id' => $user->id]);

        $this->assertCount(1, $user->fresh()->follows);
        $following = FollowSeriesAction::make()->execute($series);
        $this->assertFalse($following);
        $this->assertCount(0, $user->follows);
    }
}
