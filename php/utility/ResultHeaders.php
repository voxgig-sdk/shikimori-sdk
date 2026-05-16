<?php
declare(strict_types=1);

// Shikimori SDK utility: result_headers

class ShikimoriResultHeaders
{
    public static function call(ShikimoriContext $ctx): ?ShikimoriResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
