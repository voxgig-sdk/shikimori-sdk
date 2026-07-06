# Shikimori PHP SDK Reference

Complete API reference for the Shikimori PHP SDK.


## ShikimoriSDK

### Constructor

```php
require_once __DIR__ . '/shikimori_sdk.php';

$client = new ShikimoriSDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["apikey"]` | `string` | API key for authentication. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `ShikimoriSDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = ShikimoriSDK::test();
```


### Instance Methods

#### `Achievement($data = null)`

Create a new `AchievementEntity` instance. Pass `null` for no initial data.

#### `Anime($data = null)`

Create a new `AnimeEntity` instance. Pass `null` for no initial data.

#### `options_map(): array`

Return a deep copy of the current SDK options.

#### `get_utility(): ShikimoriUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. This is the raw-HTTP escape
hatch: it does **not** throw. It returns a result array
`["ok" => bool, "status" => int, "headers" => array, "data" => mixed]`, or
`["ok" => false, "err" => \Exception]` on failure. Branch on `$result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array` — the result dict (see above); never throws.

#### `prepare(array $fetchargs = []): mixed`

Prepare a fetch definition without sending the request. Returns the
`$fetchdef` array. Throws on error.


---

## AchievementEntity

```php
$achievement = $client->Achievement();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `int` | No |  |
| `level` | `int` | No |  |
| `neko_id` | `string` | No |  |
| `progress` | `int` | No |  |
| `user_id` | `int` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Achievement()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): AchievementEntity`

Create a new `AchievementEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## AnimeEntity

```php
$anime = $client->Anime();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `aired_on` | `string` | No |  |
| `anon` | `bool` | No |  |
| `description` | `string` | No |  |
| `description_html` | `string` | No |  |
| `duration` | `int` | No |  |
| `english` | `array` | No |  |
| `episode` | `int` | No |  |
| `episodes_aired` | `int` | No |  |
| `favoured` | `bool` | No |  |
| `franchise` | `string` | No |  |
| `id` | `int` | No |  |
| `image` | `array` | No |  |
| `japanese` | `array` | No |  |
| `kind` | `string` | No |  |
| `myanimelist_id` | `int` | No |  |
| `name` | `string` | No |  |
| `ongoing` | `bool` | No |  |
| `rates_scores_stat` | `array` | No |  |
| `rates_statuses_stat` | `array` | No |  |
| `rating` | `string` | No |  |
| `released_on` | `string` | No |  |
| `russian` | `string` | No |  |
| `score` | `string` | No |  |
| `status` | `string` | No |  |
| `synonym` | `array` | No |  |
| `thread_id` | `int` | No |  |
| `topic_id` | `int` | No |  |
| `url` | `string` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Anime()->list();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): AnimeEntity`

Create a new `AnimeEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```php
$client = new ShikimoriSDK([
  "feature" => [
    "test" => ["active" => true],
  ],
]);
```

