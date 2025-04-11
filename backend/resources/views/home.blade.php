<x-layout>
  <x-hero />

  <section class="p-4">
    <h2>Recently Added TV Shows</h2>
    <div class="d-flex gap-3 overflow-scroll mt-3">
      @foreach (range(1, 10) as $key)
      <x-series-card />
      @endforeach
    </div>
  </section>

  <section class="p-4">
    <h2>Latest Episodes</h2>
    <div class="d-flex gap-3 overflow-scroll mt-3">
      @foreach (range(1, 10) as $key)
      <x-episode-card />
      @endforeach
    </div>
  </section>
</x-layout>