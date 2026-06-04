# Shikimori SDK

Read anime, manga, character and user data from the Shikimori Russian anime/manga tracker

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About Shikimori API

[Shikimori](https://shikimori.one) is a Russian-language anime and manga tracker that lets users catalogue what they have watched or read, rate titles, and participate in clubs, forums and reviews. The platform exposes its catalogue and user-activity data through a public API.

Shikimori offers three API surfaces: a recommended GraphQL endpoint and two older REST versions (v1 and v2). The REST API is documented at `/api/doc/1.0` and covers, among other things:

- Anime and manga listings, details, roles, related and similar titles, screenshots, franchise graphs and external links
- Characters and people search
- User profiles, anime/manga rate lists, favourites and achievements
- Social features such as comments, topics, forums, messages and reviews

Access is rate-limited to 5 requests per second and 90 requests per minute, and OAuth2 applications must identify themselves in the `User-Agent` header. HTTPS is required and CORS is disabled on the public endpoints.

## Try it

**TypeScript**
```bash
npm install shikimori
```

**Python**
```bash
pip install shikimori-sdk
```

**PHP**
```bash
composer require voxgig/shikimori-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/shikimori-sdk/go
```

**Ruby**
```bash
gem install shikimori-sdk
```

**Lua**
```bash
luarocks install shikimori-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { ShikimoriSDK } from 'shikimori'

const client = new ShikimoriSDK({})

// List all achievements
const achievements = await client.Achievement().list()
```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o shikimori-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "shikimori": {
      "command": "/abs/path/to/shikimori-mcp"
    }
  }
}
```

## Entities

The API exposes 2 entities:

| Entity | Description | API path |
| --- | --- | --- |
| **Achievement** | User achievement records earned on Shikimori, exposed via the achievements endpoints documented at `/api/doc/1.0` | `/achievements` |
| **Anime** | Anime titles in the Shikimori catalogue, with list and detail operations under `/api/animes` plus related sub-resources for roles, similar titles, related works, screenshots, franchise info and external links | `/animes` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from shikimori_sdk import ShikimoriSDK

client = ShikimoriSDK({})

# List all achievements
achievements, err = client.Achievement(None).list(None, None)
```

### PHP

```php
<?php
require_once 'shikimori_sdk.php';

$client = new ShikimoriSDK([]);

// List all achievements
[$achievements, $err] = $client->Achievement(null)->list(null, null);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/shikimori-sdk/go"

client := sdk.NewShikimoriSDK(map[string]any{})

// List all achievements
achievements, err := client.Achievement(nil).List(nil, nil)
```

### Ruby

```ruby
require_relative "Shikimori_sdk"

client = ShikimoriSDK.new({})

# List all achievements
achievements, err = client.Achievement(nil).list(nil, nil)
```

### Lua

```lua
local sdk = require("shikimori_sdk")

local client = sdk.new({})

-- List all achievements
local achievements, err = client:Achievement(nil):list(nil, nil)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = ShikimoriSDK.test()
const result = await client.Achievement().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = ShikimoriSDK.test(None, None)
result, err = client.Achievement(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = ShikimoriSDK::test(null, null);
[$result, $err] = $client->Achievement(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Achievement(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = ShikimoriSDK.test(nil, nil)
result, err = client.Achievement(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Achievement(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the Shikimori API

- Upstream: [https://shikimori.one](https://shikimori.one)
- API docs: [https://shikimori.one/api/doc/1.0](https://shikimori.one/api/doc/1.0)

- Access requires OAuth2 authentication
- Requests must send an `User-Agent` header naming your OAuth2 application; mimicking browsers can lead to IP bans
- The site asks integrators to fetch data via the API rather than scraping the main site

---

Generated from the Shikimori API OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
