<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\SeriesResource;
use App\Models\Series;
use Illuminate\Http\Request;

class SeriesController extends Controller
{
    public function index()
    {
        return SeriesResource::collection(Series::all());
    }

    public function show(Series $series)
    {
        return SeriesResource::make($series);
    }
}
