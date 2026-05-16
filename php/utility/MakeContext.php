<?php
declare(strict_types=1);

// Shikimori SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class ShikimoriMakeContext
{
    public static function call(array $ctxmap, ?ShikimoriContext $basectx): ShikimoriContext
    {
        return new ShikimoriContext($ctxmap, $basectx);
    }
}
