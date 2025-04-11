@props([ 'episode' ])

<a href="{{ route('series.show') }}">
    <div class="card" style="min-width: 18rem;">
        <img src="{{ $episode->thumbnail }}" class="card-img-top" alt="" style="aspect-ratio: 16 / 9;">
        <div class="card-body d-flex flex-column align-items-stretch">
            <div class="badge rounded-pill border text-secondary mb-2 py-2 align-self-start" style="font-size: 0.7rem;"><i class="bi bi-clock"></i> {{ $episode->duration }} Minutes</div>
            <h3 class="card-title fs-5">{{ $episode->title }}</h3>
            <h4 class="text-secondary" style="font-size: 0.9rem;">{{ $episode->series->title }}</h4>
            <p class="card-text text-secondary fw-light">{{ mb_strimwidth($episode->description, 0, 120, "...") }}</p>
            <a href="{{ route('series.show') }}" class="btn btn-primary mt-auto">Play <i class="bi bi-play-fill"></i></a>
        </div>
    </div>
</a>