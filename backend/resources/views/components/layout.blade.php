<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ $title ?? 'Shows' }}</title>

    <!-- NOTE: Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- NOTE: Video.js -->
    <link href="
https://cdn.jsdelivr.net/npm/video.js@8.22.0/dist/video-js.min.css
" rel="stylesheet">
    <link href="https://unpkg.com/@videojs/themes@1/dist/forest/index.css" rel="stylesheet">

    <link rel="stylesheet" href="{{ asset('css/style.css') }}" />
</head>

<body>
    <x-header />
    <main> {{ $slot }} </main>
    <x-footer />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
    <script src="
https://cdn.jsdelivr.net/npm/video.js@8.22.0/dist/video.min.js
"></script>


    <script>
        //  NOTE: This enabled all Bootstrap tooltips on the page
        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
    </script>
</body>

</html>