<?php

namespace Tests\Unit\Actions;

use App\Actions\DislikeEpisodeAction;
use App\Models\Episode;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class DislikeEpisodeActionTest extends TestCase
{
    use RefreshDatabase;

    public function test_it_adds_a_dislike_to_an_episode(): void
    {
        $user = User::factory()->create();
        $this->actingAs($user);
        $episode = Episode::factory()->create();

        $disliked = DislikeEpisodeAction::make()->execute($episode);
        $this->assertTrue($disliked);
        $this->assertCount(1, $user->likes);
        $this->assertFalse($user->likes->first()->value);
    }

    public function test_it_removes_a_dislike_from_an_episode(): void
    {
        $user = User::factory()->create();
        $this->actingAs($user);
        $episode = Episode::factory()->create();
        $episode->likes()->create(['user_id' => $user->id, 'value' => false]);

        $this->assertCount(1, $user->fresh()->likes);
        $disliked = DislikeEpisodeAction::make()->execute($episode);
        $this->assertFalse($disliked);
        $this->assertCount(0, $user->likes);
    }
}
