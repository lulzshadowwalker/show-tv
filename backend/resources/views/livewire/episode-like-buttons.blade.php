<div class="d-flex flex-column align-items-center">
    <div class="fs-2 fw-bold text-success">{{ floor($episode->rating * 100) }}%</div>
    <div class="d-flex justify-content-end gap-1">
        <button class="btn @if($liked) btn-success @else btn-outline-success @endif rounded-circle" data-bs-toggle="tooltip" data-bs-title="I like it" wire:click="like">
            <i class="bi bi-hand-thumbs-up-fill"></i>
        </button>

        <button class="btn @if($disliked) btn-danger @else btn-outline-danger @endif rounded-circle" data-bs-toggle="tooltip" data-bs-title="I don't like it" wire:click="dislike">
            <i class="bi bi-hand-thumbs-down-fill"></i>
        </button>
    </div>
</div>