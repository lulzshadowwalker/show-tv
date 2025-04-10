<?php

namespace App\Providers\Filament;

use Filament\Http\Middleware\Authenticate;
use Filament\Http\Middleware\AuthenticateSession;
use Filament\Http\Middleware\DisableBladeIconComponents;
use Filament\Http\Middleware\DispatchServingFilamentEvent;
use Filament\Navigation\NavigationGroup;
use Filament\Navigation\NavigationItem;
use Filament\Pages;
use Filament\Panel;
use Filament\PanelProvider;
use Filament\Support\Colors\Color;
use Filament\Widgets;
use Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse;
use Illuminate\Cookie\Middleware\EncryptCookies;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Illuminate\Routing\Middleware\SubstituteBindings;
use Illuminate\Session\Middleware\StartSession;
use Illuminate\View\Middleware\ShareErrorsFromSession;

class DashboardPanelProvider extends PanelProvider
{
    public function panel(Panel $panel): Panel
    {
        return $panel
            ->default()
            ->id('dashboard')
            ->path('admin')
            ->login()
            ->colors([
                'primary' => Color::Amber,
            ])
            ->discoverResources(in: app_path('Filament/Resources'), for: 'App\\Filament\\Resources')
            ->discoverPages(in: app_path('Filament/Pages'), for: 'App\\Filament\\Pages')
            ->pages([
                Pages\Dashboard::class,
            ])
            ->discoverWidgets(in: app_path('Filament/Widgets'), for: 'App\\Filament\\Widgets')
            ->widgets([
                Widgets\AccountWidget::class,
                Widgets\FilamentInfoWidget::class,
            ])
            ->colors([
                'primary' => '#7b19d8',
            ])
            ->darkMode(false)
            ->brandLogo(asset('logo.svg'))
            ->navigationGroups([
                NavigationGroup::make('Audience'),
                NavigationGroup::make('Content Management'),
                NavigationGroup::make('Monitoring'),
            ])
            ->navigationItems([
                NavigationItem::make('Telescope')
                    ->url(fn(): string => route('telescope'), true)
                    ->group('Monitoring')
                    ->badge('⬤')
                    ->badgeTooltip('Telescope provides insight into the requests coming into your application, exceptions, log entries, database queries, queued jobs, mail, notifications, cache operations, scheduled tasks, variable dumps, and more.')
                    ->icon('heroicon-o-chart-bar-square'),

                NavigationItem::make('Horizon')
                    ->url(fn(): string => route('horizon.index'), true)
                    ->group('Monitoring')
                    ->badge('⬤')
                    ->badgeTooltip('Horizon allows you to easily monitor key metrics of your queue system such as job throughput, runtime, and job failures.')
                    ->icon('heroicon-o-lifebuoy'),

                NavigationItem::make('Pulse')
                    ->url(fn(): string => route('pulse'), true)
                    ->group('Monitoring')
                    ->badge('⬤')
                    ->badgeTooltip("Pulse delivers at-a-glance insights into your application's performance and usage. Track down bottlenecks like slow jobs and endpoints, find your most active users, and more.")
                    ->icon('heroicon-o-heart'),
            ])
            ->middleware([
                EncryptCookies::class,
                AddQueuedCookiesToResponse::class,
                StartSession::class,
                AuthenticateSession::class,
                ShareErrorsFromSession::class,
                VerifyCsrfToken::class,
                SubstituteBindings::class,
                DisableBladeIconComponents::class,
                DispatchServingFilamentEvent::class,
            ])
            ->authMiddleware([
                Authenticate::class,
            ]);
    }
}
