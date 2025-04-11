<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Episode;
use App\Models\Series;

class HomeController extends Controller
{
    public function index()
    {
        return view('home', [
            'series' => Series::all(),
            'episodes' => Episode::with('series')->get(),
        ]);
    }
}
