<?php
declare(strict_types=1);

// Shikimori SDK utility: prepare_body

class ShikimoriPrepareBody
{
    public static function call(ShikimoriContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}
