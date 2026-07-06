<?php
declare(strict_types=1);

// Typed models for the Shikimori SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Achievement entity data model. */
class Achievement
{
    public ?int $id = null;
    public ?int $level = null;
    public ?string $neko_id = null;
    public ?int $progress = null;
    public ?int $user_id = null;
}

/** Request payload for Achievement#list. */
class AchievementListMatch
{
    public ?int $id = null;
    public ?int $level = null;
    public ?string $neko_id = null;
    public ?int $progress = null;
    public ?int $user_id = null;
}

/** Anime entity data model. */
class Anime
{
    public ?string $aired_on = null;
    public ?bool $anon = null;
    public ?string $description = null;
    public ?string $description_html = null;
    public ?int $duration = null;
    public ?array $english = null;
    public ?int $episode = null;
    public ?int $episodes_aired = null;
    public ?bool $favoured = null;
    public ?string $franchise = null;
    public ?int $id = null;
    public ?array $image = null;
    public ?array $japanese = null;
    public ?string $kind = null;
    public ?int $myanimelist_id = null;
    public ?string $name = null;
    public ?bool $ongoing = null;
    public ?array $rates_scores_stat = null;
    public ?array $rates_statuses_stat = null;
    public ?string $rating = null;
    public ?string $released_on = null;
    public ?string $russian = null;
    public ?string $score = null;
    public ?string $status = null;
    public ?array $synonym = null;
    public ?int $thread_id = null;
    public ?int $topic_id = null;
    public ?string $url = null;
}

/** Request payload for Anime#list. */
class AnimeListMatch
{
    public ?string $aired_on = null;
    public ?bool $anon = null;
    public ?string $description = null;
    public ?string $description_html = null;
    public ?int $duration = null;
    public ?array $english = null;
    public ?int $episode = null;
    public ?int $episodes_aired = null;
    public ?bool $favoured = null;
    public ?string $franchise = null;
    public ?int $id = null;
    public ?array $image = null;
    public ?array $japanese = null;
    public ?string $kind = null;
    public ?int $myanimelist_id = null;
    public ?string $name = null;
    public ?bool $ongoing = null;
    public ?array $rates_scores_stat = null;
    public ?array $rates_statuses_stat = null;
    public ?string $rating = null;
    public ?string $released_on = null;
    public ?string $russian = null;
    public ?string $score = null;
    public ?string $status = null;
    public ?array $synonym = null;
    public ?int $thread_id = null;
    public ?int $topic_id = null;
    public ?string $url = null;
}

