<?php

namespace Tests\Feature\Http\Controllers\Api;

use App\Http\Resources\EpisodeResource;
use App\Models\Episode;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Collection;
use Tests\TestCase;

class EpisodeControllerTest extends TestCase
{
    use RefreshDatabase;

    protected Collection $episodes;

    public function setUp(): void
    {
        parent::setUp();

            $this->episodes = Episode::factory()->count(3)->create();
    }

    public function test_it_lists_all_episodes(): void
    {
        $resource = EpisodeResource::collection($this->episodes);

        $this->get(route('api.episodes.index'))
            ->assertOk()
            ->assertExactJson($resource->response()->getData(true));
    }

    public function test_it_shows_a_single_episode(): void
    {
        $resource = EpisodeResource::make($this->episodes->first());

        $this->get(route('api.episodes.show', ['episode' => $this->episodes->first()]))
            ->assertOk()
            ->assertExactJson($resource->response()->getData(true));
    }

    public function test_it_adds_and_removes_a_like_for_episode(): void
    {
        $user = User::factory()->create();
        $this->actingAs($user);

        $this->post(route('api.episodes.like', ['episode' => $this->episodes->first()]))
            ->assertCreated();

        $this->post(route('api.episodes.like', ['episode' => $this->episodes->first()]))
            ->assertOk();
    }

    public function test_it_adds_and_removes_a_dislike_for_episode(): void
    {
        $user = User::factory()->create();
        $this->actingAs($user);

        $this->post(route('api.episodes.dislike', ['episode' => $this->episodes->first()]))
            ->assertCreated();

        $this->post(route('api.episodes.dislike', ['episode' => $this->episodes->first()]))
            ->assertOk();
    }
}
