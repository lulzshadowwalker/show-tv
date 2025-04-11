<?php

namespace App\Http\Controllers;

use App\Models\Episode;
use App\Models\Series;

class SearchController extends Controller
{
    public function index()
    {
        $q = request()->get('q');
        return view('search', [
            'series' => Series::search($q ?? '')->get(),
            'episodes' => Episode::search($q ?? '')->get(),
            'query' => $q,
        ]);
    }
}
