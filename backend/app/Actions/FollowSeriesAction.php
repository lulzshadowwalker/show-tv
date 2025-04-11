<?php

namespace App\Actions;

use App\Models\Series;

class FollowSeriesAction
{
    public static function make(): self
    {
        return new self;
    }

    public function execute(Series $series): bool
    {
        $following = $series->follows()->where('user_id', auth()->id())->exists();
        if ($following) {
            $series->follows()->where('user_id', auth()->id())->delete();
            return false;
        }

        $series->follows()->create(['user_id' => auth()->id()]);
        return true;
    }
}
