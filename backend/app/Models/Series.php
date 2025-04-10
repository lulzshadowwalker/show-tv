<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Series extends Model implements HasMedia
{
    use HasFactory, InteractsWithMedia;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title',
        'description',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
    ];

    public function episodes(): HasMany
    {
        return $this->hasMany(Episode::class);
    }

    public function likes(): MorphMany
    {
        return $this->morphMany(Like::class, 'likeable');
    }

    public function follows(): MorphMany
    {
        return $this->morphMany(Follow::class, 'followable');
    }

    const MEDIA_COLLECTION_COVER = 'cover';

    public function registerMediaCollections(): void
    {
        $fallback = 'https://placehold.co/518x768?text=' . str_replace(' ', '%20', $this->title);
        $this->addMediaCollection(self::MEDIA_COLLECTION_COVER)
            ->fallbackUrls($fallback);
    }

    public function cover(): Attribute
    {
        return Attribute::get(fn(): string => $this->getFirstMediaUrl(self::MEDIA_COLLECTION_COVER));
    }

    public function coverFile(): Attribute
    {
        return Attribute::get(fn() => $this->getFirstMedia(self::MEDIA_COLLECTION_COVER));
    }
}
