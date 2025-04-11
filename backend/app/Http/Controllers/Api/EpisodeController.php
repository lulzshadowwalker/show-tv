<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\EpisodeResource;
use App\Models\Episode;

class EpisodeController extends Controller
{
    public function index()
    {
        return EpisodeResource::collection(Episode::all());
    }

    public function show(Episode $episode)
    {
        return EpisodeResource::make($episode);
    }
}
