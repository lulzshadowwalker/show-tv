<?php

namespace Tests\Feature\Http\Controllers;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class SeriesControllerTest extends TestCase
{
    use RefreshDatabase;

    public function test_it_renders_the_Page()
    {
        $this->get(route('series.show'))
            ->assertOk();
    }
}
