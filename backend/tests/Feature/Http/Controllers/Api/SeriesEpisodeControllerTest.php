<?php

namespace Tests\Feature\Http\Controllers\Api;

use App\Http\Resources\EpisodeResource;
use App\Http\Resources\SeriesResource;
use App\Models\Episode;
use App\Models\Series;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Collection;
use Tests\TestCase;

class SeriesEpisodeControllerTest extends TestCase
{
    use RefreshDatabase;

    protected Series $series;
    protected Collection $episodes;

    public function setUp(): void
    {
        parent::setUp();

        $this->series = Series::factory()->create();

        $this->episodes = collect();
        $this->episodes->push(Episode::factory()->for($this->series)->create());
        $this->episodes->push(Episode::factory()->for($this->series)->create());
    }

    public function test_it_lists_all_episodes_for_a_given_series(): void
    {
        $resource = EpisodeResource::collection($this->episodes);

        $this->get(route('api.series.episodes.index', ['series' => $this->series]))
            ->assertOk()
            ->assertExactJson($resource->response()->getData(true));
    }

    public function test_it_shows_a_single_episode_for_a_given_series(): void
    {
        $resource = EpisodeResource::make($this->episodes->first());

        $this->get(route('api.series.episodes.show', ['series' => $this->series->first(), 'episode' => $this->episodes->first()]))
            ->assertOk()
            ->assertExactJson($resource->response()->getData(true));
    }

    public function test_it_returns_not_found_when_requesting_an_episode_from_another_series(): void
    {
        $another = Episode::factory()->create();

        $this->get(route('api.series.episodes.show', ['series' => $this->series->first(), 'episode' => $another]))
            ->assertNotFound();
    }

    public function test_it_adds_and_removes_a_like_for_episode_from_a_given_series(): void
    {
        $user = User::factory()->create();
        $this->actingAs($user);

        $this->post(route('api.series.episodes.like', ['series' => $this->series->first(), 'episode' => $this->episodes->first()]))
            ->assertCreated();

        $this->post(route('api.series.episodes.like', ['series' => $this->series->first(), 'episode' => $this->episodes->first()]))
            ->assertOk();
    }

    public function test_it_adds_and_removes_a_dislike_for_episode_from_a_given_series(): void
    {
        $user = User::factory()->create();
        $this->actingAs($user);

        $this->post(route('api.series.episodes.dislike', ['series' => $this->series->first(), 'episode' => $this->episodes->first()]))
            ->assertCreated();

        $this->post(route('api.series.episodes.dislike', ['series' => $this->series->first(), 'episode' => $this->episodes->first()]))
            ->assertOk();
    }
}
