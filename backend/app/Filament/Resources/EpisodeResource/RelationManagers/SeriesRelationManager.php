<?php

namespace App\Filament\Resources\EpisodeResource\RelationManagers;

use App\Filament\Resources\SeriesResource;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class SeriesRelationManager extends RelationManager
{
    protected static string $relationship = 'series';

    public function form(Form $form): Form
    {
        return SeriesResource::form($form);
    }

    public function table(Table $table): Table
    {
        return SeriesResource::table($table)
            ->recordTitleAttribute('title');
    }
}
