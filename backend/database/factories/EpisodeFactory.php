<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use App\Models\Episode;
use App\Models\Series;

class EpisodeFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Episode::class;

    /**
     * Define the model's default state.
     */
    public function definition(): array
    {
        return [
            'title' => fake()->sentence(rand(4, 7)),
            'description' => fake()->text(rand(150, 300)),
            'duration' => floor(fake()->numberBetween(20, 75)),
            'airtime' => fake()->sentence(rand(8, 12)),
            'series_id' => Series::factory(),
        ];
    }
}
