<?php

namespace App\Http\Controllers;

use App\Models\Episode;
use App\Models\Series;

class SeriesController extends Controller
{
    public function show(Series $series, Episode $episode)
    {
        return view('series.show', [
            'episode' => $episode,
            'series' => $series,
        ]);
    }
}
