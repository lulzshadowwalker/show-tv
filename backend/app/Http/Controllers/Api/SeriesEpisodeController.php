<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\EpisodeResource;
use App\Models\Episode;
use App\Models\Series;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use App\Actions\DislikeEpisodeAction;
use App\Actions\LikeEpisodeAction;
use Illuminate\Http\Response;

class SeriesEpisodeController extends Controller
{
    public function __construct(protected LikeEpisodeAction $like, protected DislikeEpisodeAction $dislike)
    {
        //
    }

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

    public function like(Episode $episode)
    {
        if ($liked = $this->like->execute($episode)) {
            return response()->noContent(Response::HTTP_CREATED);
        }

        return response()->noContent(Response::HTTP_OK);
    }

    public function dislike(Episode $episode)
    {
        if ($disliked = $this->dislike->execute($episode)) {
            return response()->noContent(Response::HTTP_CREATED);
        }

        return response()->noContent(Response::HTTP_OK);
    }
}
