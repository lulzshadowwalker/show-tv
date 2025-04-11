<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\EpisodeResource;
use App\Models\Episode;
use App\Models\Series;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class SeriesEpisodeController extends Controller
{
    public function index(Series $series)
    {
        return EpisodeResource::collection($series->episodes);
    }

    public function show(Series $series, Episode $episode)
    {
        if ($episode->series->id !== $series->id) {
            throw new NotFoundHttpException('Episode not found');
        }

        return EpisodeResource::make($episode);
    }
}
