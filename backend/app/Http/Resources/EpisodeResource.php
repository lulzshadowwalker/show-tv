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
                'episode' => $this->description,
            ],
            'links' => (object) [],
            'relationships' => (object) [],
            'includes' => (object) [
                'likes' => LikeResource::collection($this->likes),
            ],
        ];
    }
}
