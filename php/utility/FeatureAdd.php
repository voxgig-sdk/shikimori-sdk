<?php
declare(strict_types=1);

// Shikimori SDK utility: feature_add

class ShikimoriFeatureAdd
{
    public static function call(ShikimoriContext $ctx, mixed $f): void
    {
        $ctx->client->features[] = $f;
    }
}
