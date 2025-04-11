<?php

namespace App\Http\Controllers\Api;

use App\Actions\FollowSeriesAction;
use App\Http\Controllers\Controller;
use App\Http\Resources\SeriesResource;
use App\Models\Series;
use Illuminate\Http\Response;

class SeriesController extends Controller
{
    public function __construct(protected FollowSeriesAction $action)
    {
        //
    }

    public function index()
    {
        return SeriesResource::collection(Series::all());
    }

    public function show(Series $series)
    {
        return SeriesResource::make($series);
    }

    public function follow(Series $series)
    {
        if ($following = $this->action->execute($series)) {
            return response()->noContent(Response::HTTP_CREATED);
        }

        return response()->noContent(Response::HTTP_OK);
    }
}
