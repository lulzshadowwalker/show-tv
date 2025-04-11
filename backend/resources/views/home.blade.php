<x-layout>
  <x-header />
  <x-hero />

  <section class="p-4">
    <h2>Recently Added TV Shows</h2>
    <div class="d-flex gap-3 overflow-scroll mt-3">
      @foreach (range(1, 10) as $key)

      <div class="card" style="min-width: 18rem; position: relative; aspect-ratio: 0.67;">
        <img src="https://images.unsplash.com/photo-1485846234645-a62644f84728?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bW92aWV8ZW58MHx8MHx8fDA%3D" alt="" style="aspect-ratio: 16 / 9; position: absolute; inset: 0; object-fit: cover; height: 100%">

        <div class="card-body d-flex flex-column justify-content-end text-white" style="z-index: 10; background-color: rgba(26, 26, 26, 0.1);">
          <h3 class="card-title fs-5">The Punisher</h3>
          <p class="card-text fw-light">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary">Watch <i class="bi bi-play-fill"></i></a>
        </div>
      </div>
      @endforeach
    </div>
  </section>

  <section class="p-4">
    <h2>Latest Episodes</h2>
    <div class="d-flex gap-3 overflow-scroll mt-3">
      @foreach (range(1, 10) as $key)
      <div class="card" style="min-width: 18rem;">
        <img src="https://images.unsplash.com/photo-1485846234645-a62644f84728?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bW92aWV8ZW58MHx8MHx8fDA%3D" class="card-img-top" alt="" style="aspect-ratio: 16 / 9;">
        <div class="card-body">
          <div class="badge rounded-pill border text-secondary mb-2 py-2" style="font-size: 0.7rem;"><i class="bi bi-clock"></i> 45 Minutes</div>
          <h3 class="card-title fs-5">The Punisher</h3>
          <p class="card-text text-secondary fw-light">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary">Play <i class="bi bi-play-fill"></i></a>
        </div>
      </div>
      @endforeach
    </div>
  </section>

  <!-- TODO: Move header and footer to layout -->
  <x-footer />
</x-layout>