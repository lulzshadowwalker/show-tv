<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class EpisodeResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return  [
            'type' => 'episode',
            'id' => (string) $this->id,
            'attributes' => [
                'title' => $this->title,
                'description' => $this->description,
                'duration' => $this->duration,
                'airtime' => (string) $this->airtime,
                'thumbnail' => $this->thumbnail,
                'video' => $this->video ?: null,
                'rating' => (string) $this->rating,
                'liked' => auth('sanctum')->user() && $this->likes()->where('value', true)->where('user_id', auth('sanctum')->id())->exists(),
                'disliked' => auth('sanctum')->user() && $this->likes()->where('value', false)->where('user_id', auth('sanctum')->id())->exists(),
                'createdAt' => $this->created_at,
                'updatedAt' => $this->updated_at,
            ],
            'links' => (object) [],
            'relationships' => (object) [],
            'includes' => (object) [
                'likes' => LikeResource::collection($this->likes),
                'series' => $this->mergeWhen($request->routeIs('api.episodes.*'), SeriesResource::make($this->series)),
            ],
        ];
    }
}
