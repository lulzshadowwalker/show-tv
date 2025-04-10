<?php

namespace App\Filament\Resources;

use App\Filament\Resources\EpisodeResource\Pages;
use App\Filament\Resources\EpisodeResource\RelationManagers;
use App\Models\Episode;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Support\Colors\Color;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class EpisodeResource extends Resource
{
    protected static ?string $model = Episode::class;

    protected static ?string $navigationIcon = 'heroicon-o-film';

    protected static ?string $navigationGroup = 'Content Management';

    protected static ?int $navigationSort = 2;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Episode Information')
                    ->description('View and manage all the details for this episode')
                    ->aside()
                    ->schema([
                        Forms\Components\SpatieMediaLibraryFileUpload::make('thumbnail')
                            ->collection(Episode::MEDIA_COLLECTION_THUMBNAIL)
                            ->required(),

                        Forms\Components\SpatieMediaLibraryFileUpload::make('video')
                            ->collection(Episode::MEDIA_COLLECTION_VIDEO)
                            ->required(),

                        Forms\Components\TextInput::make('title')
                            ->helperText('Glamorous title for your episode')
                            ->required(),

                        Forms\Components\TextInput::make('description')
                            ->helperText('Provide a clear and concise description for the viewers')
                            ->required(),

                        Forms\Components\TextInput::make('duration')
                            ->required()
                            ->minValue(0)
                            ->suffix('minutes')
                            ->helperText('Episode duration')
                            ->numeric(),

                        Forms\Components\TextInput::make('airtime')
                            ->placeholder('monday through thursday, from 3:00pm - 4:00pm')
                            ->helperText('Episode airtime')
                            ->required(),

                        Forms\Components\Select::make('series_id')
                            ->relationship('series', 'title')
                            ->helperText('The series this episode belongs to')
                            ->searchable()
                            ->preload()
                            ->required(),
                    ]),

                Forms\Components\TextInput::make('title')

                    ->required(),

                Forms\Components\TextInput::make('description')
                    ->required(),

            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('series.title')
                    ->sortable(),

                Tables\Columns\TextColumn::make('title')
                    ->searchable(),

                Tables\Columns\TextColumn::make('description')
                    ->limit(60)
                    ->searchable(),

                Tables\Columns\TextColumn::make('duration')
                    ->numeric()
                    ->formatStateUsing(fn($state): string => $state . ' Minute')
                    ->badge()
                    ->color(fn($state) => match (true) {
                        $state > 0 && $state <= 25 => Color::hex('#39c0fa'),
                        $state > 25 && $state <= 35 => Color::hex('#fcba03'),
                        default => Color::hex('#fc712b')
                    })
                    ->sortable(),

                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),

                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make()
                    ->slideOver(),

                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])
            ->defaultSort('created_at', 'desc');
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListEpisodes::route('/'),
        ];
    }
}
