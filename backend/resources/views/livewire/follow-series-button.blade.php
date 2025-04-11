<button class="btn btn-primary" wire:click.prevent="toggle">
    @if ($following) Following
    <i class="bi bi-check-circle-fill ms-1"></i>
    @else
    Follow
    <i class="bi bi-plus-circle-fill ms-1"></i>
    @endif
</button>