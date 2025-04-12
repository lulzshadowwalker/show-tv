<?php

namespace App\Filament\Resources\SeriesResource\RelationManagers;

use App\Filament\Resources\EpisodeResource;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class EpisodesRelationManager extends RelationManager
{
    protected static string $relationship = 'episodes';

    public function form(Form $form): Form
    {
        return EpisodeResource::form($form);
    }

    public function table(Table $table): Table
    {
        return EpisodeResource::table($table)
            ->recordTitleAttribute('title');
    }
}
