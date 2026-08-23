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
| `id` | `int` | No | Achievement ID |
| `level` | `int` | No | Achievement level |
| `neko_id` | `string` | No | Neko achievement identifier |
| `progress` | `int` | No | Progress towards next level |
| `user_id` | `int` | No | User ID |

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
| `aired_on` | `string` | No | Aired date |
| `anons` | `bool` | No | Is in anons state |
| `description` | `string` | No | Anime description |
| `description_html` | `string` | No | HTML formatted description |
| `duration` | `int` | No | Episode duration in minutes |
| `english` | `array` | No | English names |
| `episodes` | `int` | No | Number of episodes |
| `episodes_aired` | `int` | No | Number of aired episodes |
| `favoured` | `bool` | No | Favoured by user |
| `franchise` | `string` | No | Franchise name |
| `id` | `int` | No | Anime ID |
| `image` | `array` | No |  |
| `japanese` | `array` | No | Japanese names |
| `kind` | `string` | No | Anime type |
| `myanimelist_id` | `int` | No | MyAnimeList ID |
| `name` | `string` | No | Anime name |
| `ongoing` | `bool` | No | Is ongoing |
| `rates_scores_stats` | `array` | No | Rating statistics |
| `rates_statuses_stats` | `array` | No | Status statistics |
| `rating` | `string` | No | Age rating |
| `released_on` | `string` | No | Released date |
| `russian` | `string` | No | Russian name |
| `score` | `string` | No | Anime score |
| `status` | `string` | No | Anime status |
| `synonyms` | `array` | No | Alternative names |
| `thread_id` | `int` | No | Thread ID |
| `topic_id` | `int` | No | Topic ID |
| `url` | `string` | No | Anime URL |

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

