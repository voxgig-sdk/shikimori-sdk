<?php
declare(strict_types=1);

// Shikimori SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class ShikimoriFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new ShikimoriBaseFeature();
            case "test":
                return new ShikimoriTestFeature();
            default:
                return new ShikimoriBaseFeature();
        }
    }
}
