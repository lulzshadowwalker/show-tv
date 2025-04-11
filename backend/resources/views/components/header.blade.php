<header class="header" style="z-index: 50;">
  <nav class="header__navbar navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <a class="navbar-brand" href="/">
        <img src="{{ asset('logo.svg') }}" alt="logo" width="180">
      </a>

      <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/random">Random</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/random">Account</a>
          </li>
        </ul>

        <form class="d-flex">
          <div class="input-group">
            <input class="form-control" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-secondary" type="button" id="button-search">
              <i class="bi bi-search" style="display: block; transform: scaleX(-1) !important;"></i>
            </button>
          </div>

        </form>
      </div>
    </div>
  </nav>
</header>