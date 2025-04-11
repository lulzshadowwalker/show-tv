<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Illuminate\Database\Eloquent\Builder;

class Episode extends Model implements HasMedia
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
        'duration',
        'airtime',
        'series_id',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'series_id' => 'integer',
    ];

    public function series(): BelongsTo
    {
        return $this->belongsTo(Series::class);
    }

    public function likes(): MorphMany
    {
        return $this->morphMany(Like::class, 'likeable');
    }

    const MEDIA_COLLECTION_THUMBNAIL = 'thumbnail';
    const MEDIA_COLLECTION_VIDEO = 'video';

    public function registerMediaCollections(): void
    {
        $fallback = 'https://placehold.co/400x225?text=' . str_replace(' ', '%20', $this->title);
        $this->addMediaCollection(self::MEDIA_COLLECTION_THUMBNAIL)
            ->useFallbackUrl($fallback);

        $this->addMediaCollection(self::MEDIA_COLLECTION_VIDEO);
    }

    public function thumbnail(): Attribute
    {
        return Attribute::get(fn(): string => $this->getFirstMediaUrl(self::MEDIA_COLLECTION_THUMBNAIL));
    }

    public function thumbnailFile(): Attribute
    {
        return Attribute::get(fn() => $this->getFirstMedia(self::MEDIA_COLLECTION_THUMBNAIL));
    }

    public function video(): Attribute
    {
        return Attribute::get(fn(): ?string => $this->getFirstMediaUrl(self::MEDIA_COLLECTION_VIDEO) ?? null);
    }

    public function videoFile(): Attribute
    {
        return Attribute::get(fn() => $this->getFirstMedia(self::MEDIA_COLLECTION_VIDEO));
    }

    public function scopeSearch(Builder $query, string $search): void
    {
        $query->where('title', 'like', "%$search%")
            ->orWhere('description', 'like', "%$search%")
            ->orWhereHas('series', function (Builder $query) use ($search): void {
                $query->where('title', 'like', "%$search%");
            });
    }

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
