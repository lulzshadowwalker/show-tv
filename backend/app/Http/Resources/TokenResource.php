<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Http\Resources\Json\JsonResource;

class TokenResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'data'  => [
                'type' => 'access-token',
                'id' => Str::uuid(),
                'attributes' => [
                    'token' => $this->token,
                    'created_at' => now()->utc(),
                ],
                'links' => (object) [],
                'relationships' => (object) [],
                'includes' => (object) [],
            ],
        ];
    }
}
