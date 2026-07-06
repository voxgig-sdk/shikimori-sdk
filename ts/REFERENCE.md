# Shikimori TypeScript SDK Reference

Complete API reference for the Shikimori TypeScript SDK.


## ShikimoriSDK

### Constructor

```ts
new ShikimoriSDK(options?: object)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `object` | SDK configuration options. |
| `options.apikey` | `string` | API key for authentication. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `object` | Custom headers for all requests. |
| `options.feature` | `object` | Feature configuration. |
| `options.system` | `object` | System overrides (e.g. custom fetch). |


### Static Methods

#### `ShikimoriSDK.test(testopts?, sdkopts?)`

Create a test client with mock features active.

```ts
const client = ShikimoriSDK.test()
```

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `testopts` | `object` | Test feature options. |
| `sdkopts` | `object` | Additional SDK options merged with test defaults. |

**Returns:** `ShikimoriSDK` instance in test mode.


### Instance Methods

#### `Achievement(data?: object)`

Create a new `Achievement` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `AchievementEntity` instance.

#### `Anime(data?: object)`

Create a new `Anime` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `AnimeEntity` instance.

#### `options()`

Return a deep copy of the current SDK options.

**Returns:** `object`

#### `utility()`

Return a copy of the SDK utility object.

**Returns:** `object`

#### `direct(fetchargs?: object)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `GET`). |
| `fetchargs.params` | `object` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `object` | Query string parameters. |
| `fetchargs.headers` | `object` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (objects are JSON-serialized). |
| `fetchargs.ctrl` | `object` | Control options (e.g. `{ explain: true }`). |

**Returns:** `Promise<{ ok, status, headers, data } | Error>`

#### `prepare(fetchargs?: object)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `Promise<{ url, method, headers, body } | Error>`

#### `tester(testopts?, sdkopts?)`

Alias for `ShikimoriSDK.test()`.

**Returns:** `ShikimoriSDK` instance in test mode.


---

## AchievementEntity

```ts
const achievement = client.Achievement()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `number` | No |  |
| `level` | `number` | No |  |
| `neko_id` | `string` | No |  |
| `progress` | `number` | No |  |
| `user_id` | `number` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Achievement().list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `AchievementEntity` instance with the same client and
options.

#### `client()`

Return the parent `ShikimoriSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## AnimeEntity

```ts
const anime = client.Anime()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `aired_on` | `string` | No |  |
| `anon` | `boolean` | No |  |
| `description` | `string` | No |  |
| `description_html` | `string` | No |  |
| `duration` | `number` | No |  |
| `english` | `any[]` | No |  |
| `episode` | `number` | No |  |
| `episodes_aired` | `number` | No |  |
| `favoured` | `boolean` | No |  |
| `franchise` | `string` | No |  |
| `id` | `number` | No |  |
| `image` | `Record<string, any>` | No |  |
| `japanese` | `any[]` | No |  |
| `kind` | `string` | No |  |
| `myanimelist_id` | `number` | No |  |
| `name` | `string` | No |  |
| `ongoing` | `boolean` | No |  |
| `rates_scores_stat` | `any[]` | No |  |
| `rates_statuses_stat` | `any[]` | No |  |
| `rating` | `string` | No |  |
| `released_on` | `string` | No |  |
| `russian` | `string` | No |  |
| `score` | `string` | No |  |
| `status` | `string` | No |  |
| `synonym` | `any[]` | No |  |
| `thread_id` | `number` | No |  |
| `topic_id` | `number` | No |  |
| `url` | `string` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Anime().list()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `AnimeEntity` instance with the same client and
options.

#### `client()`

Return the parent `ShikimoriSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ts
const client = new ShikimoriSDK({
  feature: {
    test: { active: true },
  }
})
```

