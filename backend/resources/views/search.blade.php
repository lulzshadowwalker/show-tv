<x-layout>
    <div class="container" style="margin-block: 60px">
        <section class="d-flex flex-column align-items-center" style="margin-top: 7rem; margin-bottom: 6rem;">
            <h1 class="text-center" style="max-width: 750px;">@if($query) Search results for "{{ mb_strimwidth($query, 0, 24, "...")  }}" @else Provide a search term to look for your favorite series and episodes @endif</h1>
            <p style="max-width: 50ch; text-align: center; font-size: 1.2rem;">{{ count($series) + count($episodes) }} results.</p>
        </section>

        <section>
            <h2 class="mb-4" style="font-size: 2.8rem;">Series</h2>

            @if (! count($series))
            No Results Found. Please try another search term.
            @else
            <div class="row">
                @foreach ($series as $key => $s)
                <div class="col-lg-4 col-md-12 mb-4" :key="key">
                    <x-series-card :series="$s" />
                </div>
                @endforeach
            </div>
            @endif
        </section>

        <div class="hr-blur my-4"></div>

        <section>
            <h2 class="mb-4" style="font-size: 2.8rem;">Episodes</h2>

            @if (! count($episodes))
            No Results Found. Please try another search term.
            @else
            <div class="row">
                @foreach ($episodes as $key => $e)
                <div class="col-lg-4 col-md-12 mb-4" :key="key">
                    <x-episode-card :episode="$e" />
                </div>
                @endforeach
            </div>
            @endif
        </section>
    </div>
</x-layout>