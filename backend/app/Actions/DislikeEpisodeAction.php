<?php

namespace App\Actions;

use App\Models\Episode;
use App\Models\Like;

class DislikeEpisodeAction
{
    public static function make(): self
    {
        return new self;
    }

    public function execute(Episode $episode): bool
    {
        $disliked = $episode->likes()->where('value', false)->where('user_id', auth()->id())->exists();
        if ($disliked) {
            Like::where('user_id', auth()->id())->delete();
            return false;
        }

        $episode->likes()->create(
            [
                'user_id' => auth()->id(),
                'value' => false,
            ]
        );

        return true;
    }
}
