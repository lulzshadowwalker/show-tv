<?php

namespace Database\Factories;

use App\Models\Episode;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use App\Models\Like;
use App\Models\Series;
use App\Models\User;

class LikeFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Like::class;

    /**
     * Define the model's default state.
     */
    public function definition(): array
    {
        $isSeries = $this->faker->boolean;

        return [
            'value' => fake()->boolean(),
            'user_id' => User::factory(),
            'likeable_id' => $isSeries ? Series::factory() : Episode::factory(),
            'likeable_type' => $isSeries ? Series::class : Episode::class,
        ];
    }
}
