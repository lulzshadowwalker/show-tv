<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Episode;
use App\Models\Like;

class EpisodeLikeButtons extends Component
{
    public Episode $episode;
    public bool $liked;
    public bool $disliked;

    public function mount()
    {
        $this->liked = $this->episode->likes()->where('value', true)->where('user_id', auth()->id())->exists();
        $this->disliked = $this->episode->likes()->where('value', false)->where('user_id', auth()->id())->exists();
    }

    public function like(): void
    {
        if (! auth()->user()) {
            $this->redirect(route('login'));
            return;
        }

        if ($this->liked) {
            Like::where('user_id', auth()->id())->delete();
            $this->liked = false;
            return;
        }

        auth()->user()->likes()->create(
            [
                'likeable_id' => $this->episode->id,
                'likeable_type' => Episode::class,
                'value' => true,
            ]
        );

        $this->liked = true;
        $this->disliked = false;
    }

    public function dislike(): void
    {
        if (! auth()->user()) {
            $this->redirect(route('login'));
            return;
        }

        if ($this->disliked) {
            Like::where('user_id', auth()->id())->delete();
            $this->disliked = false;
            return;
        }

        auth()->user()->likes()->create(
            [
                'likeable_id' => $this->episode->id,
                'likeable_type' => Episode::class,
                'value' => false,
            ]
        );

        $this->liked = false;
        $this->disliked = true;
    }

    public function render()
    {
        return view('livewire.episode-like-buttons');
    }
}
