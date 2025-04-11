<div class="container" style="margin-top: 60px;">
    <section class="d-flex flex-column align-items-center" style="margin-top: 7rem; margin-bottom: 6rem;">
        <h1>Feeling Lucky</h1>
        <p style="max-width: 50ch; text-align: center; font-size: 1.2rem;">Explore random tv shows from our rich selection of the best tv shows on the platform</p>

        <aside style="max-width: 600px; width: 100%; margin-inline: auto;">
            <div class="fw-bold fs-4 text-secondary text-center">{{ $limit }}</div>
            <div class="d-flex align-items-center justify-content-center gap-2">

                <span class="fw-bold fs-4 text-secondary">1</span>
                <input type="range" class="form-range" min="1" max="25" id="limit-range" wire:model.live="limit">
                <span class="fw-bold fs-4 text-secondary">25</span>
            </div>
        </aside>
    </section>

    <div class="row">
        @foreach ($series as $key => $s)
        <div class="col-lg-4 col-md-12 mb-4" :key="$key">
            <x-series-card :series="$s" />
        </div>
        @endforeach
    </div>

    <button class="btn btn-primary random__fab" wire:click="$refresh()" style="z-index: 50">
        <i class="bi bi-dice-5-fill me-1"></i> Retry
    </button>
</div>