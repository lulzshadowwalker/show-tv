<x-layout>
    <div class="series__container">
        <div class="list-group series__sidebar">
            @foreach (range(1, 1000) as $key)
            <a href="#" class="list-group-item list-group-item-action d-flex align-items-start gap-3 @if($key === 2) active @endif">
                <div class="series__sidebar__counter">{{ str_pad($key, 2, '0', STR_PAD_LEFT) }}</div>

                <div>
                    <h2 class="fs-5">The Start</h2>
                    <p class="fw-light" style="font-size: 0.9rem; line-clamp: 2;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta ut architecto cum dolore, nesciunt adipisci, repudiandae ducimus culpa explicabo nemo eveniet. Ut facere maiores quaerat nisi labore placeat exercitationem sequi.</p>
                </div>
            </a>
            @endforeach
        </div>

        <div class="series__view">
            <div class="series__view__video">
                <video
                    class="video-js vjs-theme-forest"
                    controls
                    vjs-fill
                    preload="auto"
                    poster="https://images.unsplash.com/photo-1555701307-66a9a3a82928?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                    data-setup="{}">
                    <source src="https://cdn.pixabay.com/video/2025/03/18/265501_large.mp4" type="video/mp4" />
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
                <div class="badge rounded-pill border text-secondary mb-2 py-2" style="font-size: 0.7rem;"><i class="bi bi-clock"></i> 45 Minutes</div>

                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="fw-bold">The Beginning</h1>
                    <div class="d-flex justify-content-end gap-1">
                        <button class="btn btn-outline-success rounded-circle" data-bs-toggle="tooltip" data-bs-title="I like it">
                            <i class="bi bi-hand-thumbs-up-fill"></i>
                        </button>

                        <button class="btn btn-outline-danger rounded-circle" data-bs-toggle="tooltip" data-bs-title="I don't like it">
                            <i class="bi bi-hand-thumbs-down-fill"></i>
                        </button>
                    </div>

                    <!-- <button class="btn btn-outline-primary">Follow <i class="bi bi-plus-circle-fill ms-1"></i></button> -->
                </div>

                <p class="fw-light" style="max-width: 80ch;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Cumque veritatis officiis neque veniam consectetur vitae corporis sequi impedit rem consequatur? Reprehenderit hic ipsam ratione eveniet nulla repellendus repudiandae officiis magni.</p>
            </section>

            <!-- NOTE: Series Details -->
            <section class="m-4">
                <div class="hr-blur my-4"></div>
                <div class="d-flex">

                    <div class="card" style="min-width: 14rem; position: relative; aspect-ratio: 0.67;">
                        <img src="https://images.unsplash.com/photo-1485846234645-a62644f84728?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bW92aWV8ZW58MHx8MHx8fDA%3D" alt="" style="aspect-ratio: 16 / 9; position: absolute; inset: 0; object-fit: cover; height: 100%">
                    </div>

                    <div class="px-4">
                        <h3 class="fw-semibold">The Punisher</h3>
                        <p class="fw-light">Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem suscipit labore neque, maiores blanditiis iste! Corporis, quam voluptatum facere a animi ducimus sed ipsa, atque laudantium, magnam iste molestiae recusandae?</p>

                        <ul class="fw-light">
                            <li>Episodes: 12</li>
                            <li>Episode Duration: About 44 Minutes</li>
                            <li>Rating: 95% (2555 reviews)</li>
                        </ul>
                    </div>
                </div>
            </section>
        </div>
    </div>
</x-layout>