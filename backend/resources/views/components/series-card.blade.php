@props([ 'series' ])

<a href="{{ route('series.show') }}">
    <div class="card" style="min-width: 18rem; position: relative; aspect-ratio: 0.67;">
        <img src="{{ $series->cover }}" alt="{{ $series->title   . ' cover' }}" style="aspect-ratio: 16 / 9; position: absolute; inset: 0; object-fit: cover; height: 100%">

        <div class="card-body d-flex flex-column justify-content-end text-white" style="z-index: 10; background-color: rgba(26, 26, 26, 0.1);">
            <h3 class="card-title fs-5 mb-1">{{ $series->title }}</h3>
            <p class="card-text fw-light mb-2" style="line-clamp: 2; -webkit-line-clamp: 2;">{{ mb_strimwidth($series->description, 0, 120, "...") }}</p>

            <a href="@auth https://google.com @else {{ route('login') }} @endauth" class="btn btn-primary">Follow <i class="bi bi-plus-circle-fill ms-1"></i></a>
        </div>
    </div>
</a>