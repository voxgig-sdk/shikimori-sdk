# Shikimori Python SDK Reference

Complete API reference for the Shikimori Python SDK.


## ShikimoriSDK

### Constructor

```python
from shikimori_sdk import ShikimoriSDK

client = ShikimoriSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["apikey"]` | `str` | API key for authentication. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `ShikimoriSDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = ShikimoriSDK.test()
```


### Instance Methods

#### `Achievement(data=None)`

Create a new `AchievementEntity` instance. Pass `None` for no initial data.

#### `Anime(data=None)`

Create a new `AnimeEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> dict`

Make a direct HTTP request to any API endpoint. Returns a result `dict` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `result_dict`

#### `prepare(fetchargs=None) -> dict`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## AchievementEntity

```python
achievement = client.Achievement()
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

#### `list(reqmatch, ctrl=None) -> list`

List entities matching the given criteria. Returns a list and raises on error.

```python
results = client.Achievement().list({})
for achievement in results:
    print(achievement)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AchievementEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## AnimeEntity

```python
anime = client.Anime()
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

#### `list(reqmatch, ctrl=None) -> list`

List entities matching the given criteria. Returns a list and raises on error.

```python
results = client.Anime().list({})
for anime in results:
    print(anime)
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AnimeEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```python
client = ShikimoriSDK({
    "feature": {
        "test": {"active": True},
    },
})
```

