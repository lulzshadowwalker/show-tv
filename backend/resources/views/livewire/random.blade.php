<div class="container" style="margin-top: 60px;">
    <section class="d-flex flex-column align-items-center" style="margin-top: 7rem; margin-bottom: 6rem;">
        <h1>Feeling Lucky</h1>
        <p style="max-width: 50ch; text-align: center; font-size: 1.2rem;">Explore random tv shows from our rich selection of the best tv shows on the platform</p>
    </section>

    <div class="row">
        @foreach (range(1, 5) as $key)
        <div class="col-lg-4 col-md-12 mb-4">
            <x-series-card />
        </div>
        @endforeach
    </div>

    <a href="/series/random" class="btn btn-primary random__fab">
        <i class="bi bi-dice-5-fill me-1"></i> Retry
    </a>
</div>