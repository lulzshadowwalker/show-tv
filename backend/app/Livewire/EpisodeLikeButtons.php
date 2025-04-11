<?php

namespace App\Livewire;

use App\Actions\DislikeEpisodeAction;
use App\Actions\LikeEpisodeAction;
use Livewire\Component;
use App\Models\Episode;
use App\Models\Like;

class EpisodeLikeButtons extends Component
{
    public Episode $episode;
    //  TODO: Add liked and disliked to EpisodeResource
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

        $this->liked = LikeEpisodeAction::make()->execute($this->episode);
        $this->disliked = false;
    }

    public function dislike(): void
    {
        if (! auth()->user()) {
            $this->redirect(route('login'));
            return;
        }

        $this->disliked = DislikeEpisodeAction::make()->execute($this->episode);
        $this->liked = false;
    }

    public function render()
    {
        return view('livewire.episode-like-buttons');
    }
}
