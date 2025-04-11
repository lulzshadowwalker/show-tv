<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Illuminate\Database\Eloquent\Builder;

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
            ->useFallbackUrl($fallback);
    }

    public function cover(): Attribute
    {
        return Attribute::get(fn(): string => $this->getFirstMediaUrl(self::MEDIA_COLLECTION_COVER));
    }

    public function coverFile(): Attribute
    {
        return Attribute::get(fn() => $this->getFirstMedia(self::MEDIA_COLLECTION_COVER));
    }

    public function scopeSearch(Builder $query, string $search): void
    {
        $query->where('title', 'like', "%$search%")
            ->orWhere('description', 'like', "%$search%");
    }

    public function averageDuration(): Attribute
    {
        return Attribute::get(
            fn() =>
            $this->episodes->pluck('duration')->average()
        );
    }

    /**
     * Returns the rating as a value between 0 and 1
     */
    public function rating(): Attribute
    {
        return Attribute::get(function () {
            if (($total = $this->likes()->count()) === 0) {
                return 0;
            }

            return $this->likes()->where('value', true)->count() / $total;
        });
    }
}
