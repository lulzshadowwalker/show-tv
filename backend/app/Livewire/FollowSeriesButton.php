<?php

namespace App\Livewire;

use App\Models\Series;
use Livewire\Component;

class FollowSeriesButton extends Component
{
    public Series $series;
    public bool $following = false;

    public function mount(): void
    {
        if ($user = auth()->user()) {
            $this->following = $this->series->follows()->where('user_id', $user->id)->exists();
        }
    }

    public function toggle(): void
    {
        if (! auth()->user()) {
            $this->redirect(route('login'));
            return;
        }

        if ($this->following) {
            $this->series->follows()->where('user_id', auth()->id())->delete();
            $this->following = false;
            return;
        }

        $this->series->follows()->create([
            'user_id' => auth()->id(),
        ]);
        $this->following = true;
    }

    public function render()
    {
        return view('livewire.follow-series-button');
    }
}
