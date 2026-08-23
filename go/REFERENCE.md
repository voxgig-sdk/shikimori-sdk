# Shikimori Golang SDK Reference

Complete API reference for the Shikimori Golang SDK.


## ShikimoriSDK

### Constructor

```go
func NewShikimoriSDK(options map[string]any) *ShikimoriSDK
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `map[string]any` | SDK configuration options. |
| `options["apikey"]` | `string` | API key for authentication. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `map[string]any` | Custom headers for all requests. |
| `options["feature"]` | `map[string]any` | Feature configuration. |
| `options["system"]` | `map[string]any` | System overrides (e.g. custom fetch). |


### Static Methods

#### `Test() *ShikimoriSDK`

No-arg convenience constructor for the common no-options test case.

```go
client := sdk.Test()
```

#### `TestSDK(testopts, sdkopts map[string]any) *ShikimoriSDK`

Test client with options. Both arguments may be `nil`.

```go
client := sdk.TestSDK(testopts, sdkopts)
```


### Instance Methods

#### `Achievement(data map[string]any) ShikimoriEntity`

Create a new `Achievement` entity instance. Pass `nil` for no initial data.

#### `Anime(data map[string]any) ShikimoriEntity`

Create a new `Anime` entity instance. Pass `nil` for no initial data.

#### `OptionsMap() map[string]any`

Return a deep copy of the current SDK options.

#### `GetUtility() *Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs map[string]any) (map[string]any, error)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `map[string]any` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `map[string]any` | Query string parameters. |
| `fetchargs["headers"]` | `map[string]any` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (maps are JSON-serialized). |
| `fetchargs["ctrl"]` | `map[string]any` | Control options (e.g. `map[string]any{"explain": true}`). |

**Returns:** `(map[string]any, error)`

#### `Prepare(fetchargs map[string]any) (map[string]any, error)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `Direct()`.

**Returns:** `(map[string]any, error)`


---

## AchievementEntity

```go
achievement := client.Achievement(nil)
fmt.Println(achievement.GetName()) // "achievement"
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

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Achievement(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `AchievementEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## AnimeEntity

```go
anime := client.Anime(nil)
fmt.Println(anime.GetName()) // "anime"
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `aired_on` | `string` | No | Aired date |
| `anons` | `bool` | No | Is in anons state |
| `description` | `string` | No | Anime description |
| `description_html` | `string` | No | HTML formatted description |
| `duration` | `int` | No | Episode duration in minutes |
| `english` | `[]any` | No | English names |
| `episodes` | `int` | No | Number of episodes |
| `episodes_aired` | `int` | No | Number of aired episodes |
| `favoured` | `bool` | No | Favoured by user |
| `franchise` | `string` | No | Franchise name |
| `id` | `int` | No | Anime ID |
| `image` | `map[string]any` | No |  |
| `japanese` | `[]any` | No | Japanese names |
| `kind` | `string` | No | Anime type |
| `myanimelist_id` | `int` | No | MyAnimeList ID |
| `name` | `string` | No | Anime name |
| `ongoing` | `bool` | No | Is ongoing |
| `rates_scores_stats` | `[]any` | No | Rating statistics |
| `rates_statuses_stats` | `[]any` | No | Status statistics |
| `rating` | `string` | No | Age rating |
| `released_on` | `string` | No | Released date |
| `russian` | `string` | No | Russian name |
| `score` | `string` | No | Anime score |
| `status` | `string` | No | Anime status |
| `synonyms` | `[]any` | No | Alternative names |
| `thread_id` | `int` | No | Thread ID |
| `topic_id` | `int` | No | Topic ID |
| `url` | `string` | No | Anime URL |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Anime(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(results)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `AnimeEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```go
client := sdk.NewShikimoriSDK(map[string]any{
    "feature": map[string]any{
        "test": map[string]any{"active": true},
    },
})
```

