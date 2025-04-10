<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;

use App\Enums\Role;
use Filament\Models\Contracts\FilamentUser;
use Filament\Models\Contracts\HasAvatar;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Str;
use Spatie\Permission\Traits\HasRoles;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Filament\Panel;

class User extends Authenticatable implements HasMedia, FilamentUser, HasAvatar
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable, HasRoles, InteractsWithMedia;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    /**
     * Get the user's initials
     */
    public function initials(): string
    {
        return Str::of($this->name)
            ->explode(' ')
            ->map(fn(string $name) => Str::of($name)->substr(0, 1))
            ->implode('');
    }

    public function likes(): HasMany
    {
        return $this->hasMany(Like::class);
    }

    public function follows(): HasMany
    {
        return $this->hasMany(Follow::class);
    }

    public function isCustomer(): Attribute
    {
        return Attribute::get(fn(): bool => $this->hasRole(Role::customer->value));
    }

    public function isAdmin(): Attribute
    {
        return Attribute::get(fn(): bool => $this->hasRole(Role::admin->value));
    }

    const MEDIA_COLLECTION_AVATAR = 'avatar';

    public function registerMediaCollections(): void
    {
        $fallback = 'https://ui-avatars.com/api/?name=' . str_replace(' ', '+', $this->name);
        $this->addMediaCollection(self::MEDIA_COLLECTION_AVATAR)
            ->useFallbackUrl($fallback);
    }

    public function avatar(): Attribute
    {
        return Attribute::get(fn(): string => $this->getFirstMediaUrl(self::MEDIA_COLLECTION_AVATAR));
    }

    public function avatarFile(): Attribute
    {
        return Attribute::get(fn() => $this->getFirstMedia(self::MEDIA_COLLECTION_AVATAR));
    }

    public function getFilamentAvatarUrl(): ?string
    {
        return $this->avatar;
    }

    public function canAccessPanel(Panel $panel): bool
    {
        return $this->isAdmin;
    }
}
