<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class SeriesResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'type' => 'series',
            'id' => (string) $this->id,
            'attributes' => [
                'title' => $this->title,
                'description' => $this->description,
                'episode' => $this->description,
                'cover' => $this->cover,
                'averageDuration' => (string) $this->averageDuration,
                'rating' => (string) $this->rating,
                'following' => auth('sanctum')->user() && $this->follows()->where('user_id', auth('sanctum')->id())->exists(),
                'createdAt' => $this->created_at,
                'updatedAt' => $this->updated_at,
            ],
            'links' => (object) [],
            'relationships' => (object) [],
            'includes' => (object) [
                'episodes' => $this->mergeWhen($request->routeIs('api.series.*'), EpisodeResource::collection($this->episodes)),
                'likes' => LikeResource::collection($this->likes),
                'follows' => FollowResource::collection($this->follows),
            ],
        ];
    }
}
