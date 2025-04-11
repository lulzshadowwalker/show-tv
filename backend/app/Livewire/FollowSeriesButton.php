<?php

namespace App\Livewire;

use App\Actions\FollowSeriesAction;
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

        $this->following = FollowSeriesAction::make()->execute($this->series);
    }

    public function render()
    {
        return view('livewire.follow-series-button');
    }
}
