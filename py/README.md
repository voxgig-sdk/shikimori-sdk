# Shikimori Python SDK



The Python SDK for the Shikimori API — an entity-oriented client following Pythonic conventions.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
```bash
pip install shikimori-sdk
```

Or install from source:

```bash
pip install -e .
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```python
import os
from shikimori_sdk import ShikimoriSDK

client = ShikimoriSDK({
    "apikey": os.environ.get("SHIKIMORI_APIKEY"),
})
```

### 2. List achievements

```python
result, err = client.Achievement().list()
if err:
    raise Exception(err)

if isinstance(result, list):
    for item in result:
        d = item.data_get()
        print(d["id"], d["name"])
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
if err:
    raise Exception(err)

if result["ok"]:
    print(result["status"])  # 200
    print(result["data"])    # response body
```

### Prepare a request without sending it

```python
fetchdef, err = client.prepare({
    "path": "/api/resource/{id}",
    "method": "DELETE",
    "params": {"id": "example"},
})
if err:
    raise Exception(err)

print(fetchdef["url"])
print(fetchdef["method"])
print(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```python
client = ShikimoriSDK.test()

result, err = client.Shikimori().load({"id": "test01"})
# result contains mock response data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```python
def mock_fetch(url, init):
    return {
        "status": 200,
        "statusText": "OK",
        "headers": {},
        "json": lambda: {"id": "mock01"},
    }, None

client = ShikimoriSDK({
    "base": "http://localhost:8080",
    "system": {
        "fetch": mock_fetch,
    },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
SHIKIMORI_TEST_LIVE=TRUE
SHIKIMORI_APIKEY=<your-key>
```

Then run:

```bash
cd py && pytest test/
```


## Reference

### ShikimoriSDK

```python
from shikimori_sdk import ShikimoriSDK

client = ShikimoriSDK(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `str` | API key for authentication. |
| `base` | `str` | Base URL of the API server. |
| `prefix` | `str` | URL path prefix prepended to all requests. |
| `suffix` | `str` | URL path suffix appended to all requests. |
| `feature` | `dict` | Feature activation flags. |
| `extend` | `list` | Additional Feature instances to load. |
| `system` | `dict` | System overrides (e.g. custom `fetch` function). |

### test

```python
client = ShikimoriSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `None`.

### ShikimoriSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> dict` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> (dict, err)` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs) -> (dict, err)` | Build and send an HTTP request. |
| `Achievement` | `(data) -> AchievementEntity` | Create a Achievement entity instance. |
| `Anime` | `(data) -> AnimeEntity` | Create a Anime entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> (any, err)` | Load a single entity by match criteria. |
| `list` | `(reqmatch, ctrl) -> (any, err)` | List entities matching the criteria. |
| `create` | `(reqdata, ctrl) -> (any, err)` | Create a new entity. |
| `update` | `(reqdata, ctrl) -> (any, err)` | Update an existing entity. |
| `remove` | `(reqmatch, ctrl) -> (any, err)` | Remove an entity. |
| `data_get` | `() -> dict` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> dict` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> str` | Return the entity name. |

### Result shape

Entity operations return `(any, err)`. The first value is a
`dict` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `True` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `dict` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `False` and `err` contains the error value.

### Entities

#### Achievement

| Field | Description |
| --- | --- |
| `id` |  |
| `level` |  |
| `neko_id` |  |
| `progress` |  |
| `user_id` |  |

Operations: List.

API path: `/achievements`

#### Anime

| Field | Description |
| --- | --- |
| `aired_on` |  |
| `anon` |  |
| `description` |  |
| `description_html` |  |
| `duration` |  |
| `english` |  |
| `episode` |  |
| `episodes_aired` |  |
| `favoured` |  |
| `franchise` |  |
| `id` |  |
| `image` |  |
| `japanese` |  |
| `kind` |  |
| `myanimelist_id` |  |
| `name` |  |
| `ongoing` |  |
| `rates_scores_stat` |  |
| `rates_statuses_stat` |  |
| `rating` |  |
| `released_on` |  |
| `russian` |  |
| `score` |  |
| `status` |  |
| `synonym` |  |
| `thread_id` |  |
| `topic_id` |  |
| `url` |  |

Operations: List.

API path: `/animes`



## Entities


### Achievement

Create an instance: `const achievement = client.Achievement()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `id` | ``$INTEGER`` |  |
| `level` | ``$INTEGER`` |  |
| `neko_id` | ``$STRING`` |  |
| `progress` | ``$INTEGER`` |  |
| `user_id` | ``$INTEGER`` |  |

#### Example: List

```ts
const achievements = await client.Achievement().list()
```


### Anime

Create an instance: `const anime = client.Anime()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `aired_on` | ``$STRING`` |  |
| `anon` | ``$BOOLEAN`` |  |
| `description` | ``$STRING`` |  |
| `description_html` | ``$STRING`` |  |
| `duration` | ``$INTEGER`` |  |
| `english` | ``$ARRAY`` |  |
| `episode` | ``$INTEGER`` |  |
| `episodes_aired` | ``$INTEGER`` |  |
| `favoured` | ``$BOOLEAN`` |  |
| `franchise` | ``$STRING`` |  |
| `id` | ``$INTEGER`` |  |
| `image` | ``$OBJECT`` |  |
| `japanese` | ``$ARRAY`` |  |
| `kind` | ``$STRING`` |  |
| `myanimelist_id` | ``$INTEGER`` |  |
| `name` | ``$STRING`` |  |
| `ongoing` | ``$BOOLEAN`` |  |
| `rates_scores_stat` | ``$ARRAY`` |  |
| `rates_statuses_stat` | ``$ARRAY`` |  |
| `rating` | ``$STRING`` |  |
| `released_on` | ``$STRING`` |  |
| `russian` | ``$STRING`` |  |
| `score` | ``$STRING`` |  |
| `status` | ``$STRING`` |  |
| `synonym` | ``$ARRAY`` |  |
| `thread_id` | ``$INTEGER`` |  |
| `topic_id` | ``$INTEGER`` |  |
| `url` | ``$STRING`` |  |

#### Example: List

```ts
const animes = await client.Anime().list()
```


## Explanation

### The operation pipeline

Every entity operation (load, list, create, update, remove) follows a
six-stage pipeline. Each stage fires a feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage returns an error, the pipeline short-circuits and the
error is returned to the caller as the second element in the return tuple.

### Features and hooks

Features are the extension mechanism. A feature is a Python class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as dicts

The Python SDK uses plain dicts throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `helpers.to_map()` to safely validate that a value is a dict.

### Module structure

```
py/
├── shikimori_sdk.py         -- Main SDK module
├── config.py                    -- Configuration
├── features.py                  -- Feature factory
├── core/                        -- Core types and context
├── entity/                      -- Entity implementations
├── feature/                     -- Built-in features (Base, Test, Log)
├── utility/                     -- Utility functions and struct library
└── test/                        -- Test suites
```

The main module (`shikimori_sdk`) exports the SDK class.
Import entity or utility modules directly only when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```python
moon = client.Moon()
moon.load({"planet_id": "earth", "id": "luna"})

# moon.data_get() now returns the loaded moon data
# moon.match_get() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
