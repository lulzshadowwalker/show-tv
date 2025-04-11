<x-layout>
  <x-hero />

  <section id="series" class="p-4" style="scroll-margin-top: 2rem;">
    <h2>Recently Added TV Shows</h2>
    <div class="d-flex overflow-scroll gap-2 mt-3">
      @foreach ($series as $key => $s)
      <x-series-card :key="$key" :series="$s" />
      @endforeach
    </div>
  </section>

  <section class="p-4">
    <h2>Latest Episodes</h2>
    <div class="d-flex overflow-scroll gap-2 mt-3">
      @foreach ($episodes as $key => $e)
      <x-episode-card :key="$key" :episode="$e" />
      @endforeach
    </div>
  </section>
</x-layout>