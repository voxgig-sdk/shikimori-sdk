<?php
declare(strict_types=1);

// Shikimori SDK utility: feature_hook

class ShikimoriFeatureHook
{
    public static function call(ShikimoriContext $ctx, string $name): void
    {
        if (!$ctx->client) {
            return;
        }
        $features = $ctx->client->features ?? null;
        if (!$features) {
            return;
        }
        foreach ($features as $f) {
            if (method_exists($f, $name)) {
                $f->$name($ctx);
            }
        }
    }
}
