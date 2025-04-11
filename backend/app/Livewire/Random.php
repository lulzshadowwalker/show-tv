<?php

namespace App\Livewire;

use App\Models\Series;
use Livewire\Attributes\Layout;
use Livewire\Component;

class Random extends Component
{
    public int $limit = 5;

    #[Layout('components.layout')]
    public function render()
    {
        $series = Series::latest()->limit(100)->get();
        return view('livewire.random', [
            'series' => $series->random(min($series->count(), $this->limit)),
        ]);
    }
}
