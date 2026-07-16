<?php
declare(strict_types=1);

// Shikimori SDK base feature

class ShikimoriBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(ShikimoriContext $ctx, array $options): void {}
    public function PostConstruct(ShikimoriContext $ctx): void {}
    public function PostConstructEntity(ShikimoriContext $ctx): void {}
    public function SetData(ShikimoriContext $ctx): void {}
    public function GetData(ShikimoriContext $ctx): void {}
    public function GetMatch(ShikimoriContext $ctx): void {}
    public function SetMatch(ShikimoriContext $ctx): void {}
    public function PrePoint(ShikimoriContext $ctx): void {}
    public function PreSpec(ShikimoriContext $ctx): void {}
    public function PreRequest(ShikimoriContext $ctx): void {}
    public function PreResponse(ShikimoriContext $ctx): void {}
    public function PreResult(ShikimoriContext $ctx): void {}
    public function PreDone(ShikimoriContext $ctx): void {}
    public function PreUnexpected(ShikimoriContext $ctx): void {}
}
