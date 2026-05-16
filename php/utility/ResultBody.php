<?php
declare(strict_types=1);

// Shikimori SDK utility: result_body

class ShikimoriResultBody
{
    public static function call(ShikimoriContext $ctx): ?ShikimoriResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
