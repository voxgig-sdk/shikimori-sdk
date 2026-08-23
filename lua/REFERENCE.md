# Shikimori Lua SDK Reference

Complete API reference for the Shikimori Lua SDK.


## ShikimoriSDK

### Constructor

```lua
local sdk = require("shikimori_sdk")
local client = sdk.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `table` | SDK configuration options. |
| `options.apikey` | `string` | API key for authentication. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `table` | Custom headers for all requests. |
| `options.feature` | `table` | Feature configuration. |
| `options.system` | `table` | System overrides (e.g. custom fetch). |


### Static Methods

#### `sdk.test(testopts?, sdkopts?)`

Create a test client with mock features active. Both arguments are optional.

```lua
local client = sdk.test()
```


### Instance Methods

#### `Achievement(data)`

Create a new `Achievement` entity instance. Pass `nil` for no initial data.

#### `Anime(data)`

Create a new `Anime` entity instance. Pass `nil` for no initial data.

#### `options_map() -> table`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> table, err`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs.params` | `table` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `table` | Query string parameters. |
| `fetchargs.headers` | `table` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (tables are JSON-serialized). |
| `fetchargs.ctrl` | `table` | Control options (e.g. `{ explain = true }`). |

**Returns:** `table, err`

#### `prepare(fetchargs) -> table, err`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `table, err`


---

## AchievementEntity

```lua
local achievement = client:Achievement(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `number` | No | Achievement ID |
| `level` | `number` | No | Achievement level |
| `neko_id` | `string` | No | Neko achievement identifier |
| `progress` | `number` | No | Progress towards next level |
| `user_id` | `number` | No | User ID |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Achievement():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AchievementEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## AnimeEntity

```lua
local anime = client:Anime(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `aired_on` | `string` | No | Aired date |
| `anons` | `boolean` | No | Is in anons state |
| `description` | `string` | No | Anime description |
| `description_html` | `string` | No | HTML formatted description |
| `duration` | `number` | No | Episode duration in minutes |
| `english` | `table` | No | English names |
| `episodes` | `number` | No | Number of episodes |
| `episodes_aired` | `number` | No | Number of aired episodes |
| `favoured` | `boolean` | No | Favoured by user |
| `franchise` | `string` | No | Franchise name |
| `id` | `number` | No | Anime ID |
| `image` | `table` | No |  |
| `japanese` | `table` | No | Japanese names |
| `kind` | `string` | No | Anime type |
| `myanimelist_id` | `number` | No | MyAnimeList ID |
| `name` | `string` | No | Anime name |
| `ongoing` | `boolean` | No | Is ongoing |
| `rates_scores_stats` | `table` | No | Rating statistics |
| `rates_statuses_stats` | `table` | No | Status statistics |
| `rating` | `string` | No | Age rating |
| `released_on` | `string` | No | Released date |
| `russian` | `string` | No | Russian name |
| `score` | `string` | No | Anime score |
| `status` | `string` | No | Anime status |
| `synonyms` | `table` | No | Alternative names |
| `thread_id` | `number` | No | Thread ID |
| `topic_id` | `number` | No | Topic ID |
| `url` | `string` | No | Anime URL |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Anime():list()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AnimeEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```lua
local client = sdk.new({
  feature = {
    test = { active = true },
  },
})
```

