<?php

namespace Tests\Feature\Http\Controllers\Api;

use App\Http\Resources\SeriesResource;
use App\Models\Episode;
use App\Models\Series;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Collection;
use Tests\TestCase;

class SeriesControllerTest extends TestCase
{
    use RefreshDatabase;

    protected Collection $series;
    protected Collection $episodes;

    public function setUp(): void
    {
        parent::setUp();

        $this->series = Series::factory()->count(3)->create();
        $this->episodes = collect();
        foreach ($this->series as $s) {
            $this->episodes->push(Episode::factory()->for($s)->create());
        }
    }

    public function test_it_lists_all_series(): void
    {
        $resource = SeriesResource::collection($this->series);

        $this->get(route('api.series.index'))
            ->assertOk()
            ->assertExactJson($resource->response()->getData(true));
    }

    public function test_it_shows_a_single_series(): void
    {
        $resource = SeriesResource::make($this->series->first());

        $this->get(route('api.series.show', ['series' => $this->series->first()]))
            ->assertOk()
            ->assertExactJson($resource->response()->getData(true));
    }

    public function test_it_follows_and_unfollows_a_series(): void
    {
        $user = User::factory()->create();
        $this->actingAs($user);

        $this->post(route('api.series.follow', ['series' => $this->series->first()]))
            ->assertCreated();

        $this->post(route('api.series.follow', ['series' => $this->series->first()]))
            ->assertOk();
    }
}
