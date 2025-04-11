<?php

namespace App\Actions;

use App\Models\Episode;
use App\Models\Like;

class LikeEpisodeAction
{
    public static function make(): self
    {
        return new self;
    }

    public function execute(Episode $episode): bool
    {
        $liked = $episode->likes()->where('value', true)->where('user_id', auth()->id())->exists();
        if ($liked) {
            Like::where('user_id', auth()->id())->delete();
            return false;
        }

        $episode->likes()->create(
            [
                'user_id' => auth()->id(),
                'value' => true,
            ]
        );

        return true;
    }
}
