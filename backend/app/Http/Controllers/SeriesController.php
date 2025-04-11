<?php

namespace App\Http\Controllers;

use App\Models\Episode;
use App\Models\Series;

class SeriesController extends Controller
{
    public function show(Series $series, Episode $episode)
    {
        if (! $episode->id) {
            $episode = $series->episodes->first();
        }

        return view('series.show', [
            'episode' => $episode,
            'series' => $series,
        ]);
    }
}
