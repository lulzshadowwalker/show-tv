<x-layout>
    <div class="container" style="margin-block: 60px">
        <section class="d-flex flex-column align-items-center" style="margin-top: 7rem; margin-bottom: 6rem;">
            <h1>Search results for "The Punisher"</h1>
            <p style="max-width: 50ch; text-align: center; font-size: 1.2rem;">1, 300 results.</p>
        </section>

        <section>
            <h2 class="mb-4" style="font-size: 2.8rem;">Series</h2>

            <div class="row">
                @foreach (range(1, 5) as $key)
                <div class="col-lg-4 col-md-12 mb-4">
                    <x-series-card />
                </div>
                @endforeach
            </div>
        </section>

        <div class="hr-blur my-4"></div>

        <section>
            <h2 class="mb-4" style="font-size: 2.8rem;">Episodes</h2>

            <div class="row">
                @foreach (range(1, 5) as $key)
                <div class="col-lg-4 col-md-12 mb-4">
                    <x-episode-card />
                </div>
                @endforeach
            </div>
        </section>
    </div>
</x-layout>