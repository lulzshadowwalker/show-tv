<?php

namespace App\Http\Controllers\Api;

use App\Actions\DislikeEpisodeAction;
use App\Actions\LikeEpisodeAction;
use App\Http\Controllers\Controller;
use App\Http\Resources\EpisodeResource;
use App\Models\Episode;
use Illuminate\Http\Response;

class EpisodeController extends Controller
{
    public function __construct(protected LikeEpisodeAction $like, protected DislikeEpisodeAction $dislike)
    {
        //
    }

    public function index()
    {
        return EpisodeResource::collection(Episode::all());
    }

    public function show(Episode $episode)
    {
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
