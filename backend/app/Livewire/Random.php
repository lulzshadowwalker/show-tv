<?php

namespace App\Livewire;

use App\Models\Series;
use Livewire\Attributes\Layout;
use Livewire\Component;

class Random extends Component
{
    #[Layout('components.layout')]
    public function render()
    {
        return view('livewire.random', [
            'series' => Series::limit(5)->get(),
        ]);
    }
}
