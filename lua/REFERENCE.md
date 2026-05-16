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

#### `sdk.test(testopts, sdkopts)`

Create a test client with mock features active. Both arguments may be `nil`.

```lua
local client = sdk.test(nil, nil)
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
| `id` | ``$INTEGER`` | No |  |
| `level` | ``$INTEGER`` | No |  |
| `neko_id` | ``$STRING`` | No |  |
| `progress` | ``$INTEGER`` | No |  |
| `user_id` | ``$INTEGER`` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Achievement(nil):list(nil, nil)
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
| `aired_on` | ``$STRING`` | No |  |
| `anon` | ``$BOOLEAN`` | No |  |
| `description` | ``$STRING`` | No |  |
| `description_html` | ``$STRING`` | No |  |
| `duration` | ``$INTEGER`` | No |  |
| `english` | ``$ARRAY`` | No |  |
| `episode` | ``$INTEGER`` | No |  |
| `episodes_aired` | ``$INTEGER`` | No |  |
| `favoured` | ``$BOOLEAN`` | No |  |
| `franchise` | ``$STRING`` | No |  |
| `id` | ``$INTEGER`` | No |  |
| `image` | ``$OBJECT`` | No |  |
| `japanese` | ``$ARRAY`` | No |  |
| `kind` | ``$STRING`` | No |  |
| `myanimelist_id` | ``$INTEGER`` | No |  |
| `name` | ``$STRING`` | No |  |
| `ongoing` | ``$BOOLEAN`` | No |  |
| `rates_scores_stat` | ``$ARRAY`` | No |  |
| `rates_statuses_stat` | ``$ARRAY`` | No |  |
| `rating` | ``$STRING`` | No |  |
| `released_on` | ``$STRING`` | No |  |
| `russian` | ``$STRING`` | No |  |
| `score` | ``$STRING`` | No |  |
| `status` | ``$STRING`` | No |  |
| `synonym` | ``$ARRAY`` | No |  |
| `thread_id` | ``$INTEGER`` | No |  |
| `topic_id` | ``$INTEGER`` | No |  |
| `url` | ``$STRING`` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Anime(nil):list(nil, nil)
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

