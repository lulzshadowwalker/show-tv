<?php

namespace Tests\Feature\Http\Controllers;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class SearchControllerTest extends TestCase
{
    use RefreshDatabase;

    public function test_it_renders_the_page(): void
    {
        $this->get(route('search.index'))
            ->assertOk();
    }
}
