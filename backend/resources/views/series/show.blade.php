<x-layout>
    <div class="series__container">
        <div class="list-group series__sidebar">
            @foreach ($series->episodes as $key => $e)
            <a href="{{ route('series.show', ['series' => $series, 'episode' => $e]) }}" class="list-group-item list-group-item-action d-flex align-items-start gap-3 @if($e->id === $episode->id) active @endif" :key="$key">
                <div class="series__sidebar__counter">{{ str_pad($key + 1, 2, '0', STR_PAD_LEFT) }}</div>

                <div>
                    <h2 class="fs-5">{{ mb_strimwidth($e->title, 0, 32, "...")  }}</h2>
                    <p class="fw-light" style="font-size: 0.9rem; line-clamp: 2;">{{ mb_strimwidth($e->description, 0, 64, "...")  }}</p>
                </div>
            </a>
            @endforeach
        </div>

        <div class="series__view">
            <div class="series__view__video">
                <video
                    style="background-color: black;"
                    class="video-js vjs-theme-forest"
                    controls
                    vjs-fill
                    preload="auto"
                    poster="{{ $episode->thumbnail }}"
                    data-setup="{}">
                    <source src="{{ $episode->video ?: asset('video-placeholder.mp4') }}" type="video/mp4" />
                    <!-- <source src="MY_VIDEO.webm" type="video/webm" /> -->
                    <p class="vjs-no-js">
                        To view this video please enable JavaScript, and consider upgrading to a
                        web browser that
                        <a href="https://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
                    </p>
                </video>
            </div>

            <!-- NOTE: Episode Details -->
            <section class="m-4">
                <div class="badge rounded-pill border text-secondary mb-2 py-2" style="font-size: 0.7rem;"><i class="bi bi-clock"></i> {{ $episode->duration }} Minutes</div>

                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="fw-bold">{{ $episode->title }}</h1>
                    <livewire:episode-like-buttons :episode="$episode" />
                </div>

                <p class="fw-light" style="max-width: 80ch;">{{ $episode->description }}</p>
            </section>

            <!-- NOTE: Series Details -->
            <section class="m-4">
                <div class="hr-blur my-4"></div>
                <div class="d-flex">

                    <div class="card" style="min-width: 14rem; position: relative; aspect-ratio: 0.67;">
                        <img src="{{ $series->cover }}" alt="" style="aspect-ratio: 16 / 9; position: absolute; inset: 0; object-fit: cover; height: 100%">
                    </div>

                    <div class="px-4">
                        <h3 class="fw-semibold">{{ $series->title }}</h3>
                        <p class="fw-light">{{ $series->description }}</p>

                        <ul class="fw-light mb-4">
                            <li>Episodes: {{ $series->episodes->count() }}</li>
                            <li>Airtime: {{ $series->airtime }}</li>
                            <li>Episode Duration: About {{ floor($series->averageDuration) }} Minutes</li>
                            <li>Rating: {{ number_format((float)$series->rating * 100, 2, '.', '') }}% ({{ $series->likes()->count() }} ratings)</li>
                        </ul>

                        <livewire:follow-series-button :series="$series" />
                    </div>
                </div>
            </section>
        </div>
    </div>
</x-layout>