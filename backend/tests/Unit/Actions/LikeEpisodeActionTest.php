<?php

namespace Tests\Unit\Actions;

use App\Actions\LikeEpisodeAction;
use App\Models\Episode;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class LikeEpisodeActionTest extends TestCase
{
    use RefreshDatabase;

    public function test_it_adds_a_like_to_an_episode(): void
    {
        $user = User::factory()->create();
        $this->actingAs($user);
        $episode = Episode::factory()->create();

        $liked = LikeEpisodeAction::make()->execute($episode);
        $this->assertTrue($liked);
        $this->assertCount(1, $user->likes);
        $this->assertTrue($user->likes->first()->value);
    }

    public function test_it_removes_a_like_from_an_episode(): void
    {
        $user = User::factory()->create();
        $this->actingAs($user);
        $episode = Episode::factory()->create();
        $episode->likes()->create(['user_id' => $user->id, 'value' => true]);

        $this->assertCount(1, $user->fresh()->likes);
        $liked = LikeEpisodeAction::make()->execute($episode);
        $this->assertFalse($liked);
        $this->assertCount(0, $user->likes);
    }
}
