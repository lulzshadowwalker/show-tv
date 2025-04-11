<?php

namespace App\Http\Controllers;

use App\Models\Episode;
use App\Models\Series;

class SearchController extends Controller
{
    public function index()
    {
        return view('search', [
            'series' => Series::limit(5)->get(),
            'episodes' => Episode::limit(5)->get(),
        ]);
    }
}
