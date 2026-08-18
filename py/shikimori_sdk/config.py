# Shikimori SDK configuration


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
    return {
        "main": {
            "name": "Shikimori",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://shikimori.one/api",
            "auth": {
                "prefix": "Bearer",
            },
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "achievement": {},
                "anime": {},
            },
        },
        "entity": {
      "achievement": {
        "fields": [
          {
            "name": "id",
            "type": "`$INTEGER`",
          },
          {
            "name": "level",
            "type": "`$INTEGER`",
          },
          {
            "name": "neko_id",
            "type": "`$STRING`",
          },
          {
            "name": "progress",
            "type": "`$INTEGER`",
          },
          {
            "name": "user_id",
            "type": "`$INTEGER`",
          },
        ],
        "name": "achievement",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "user_id",
                      "orig": "user_id",
                      "reqd": True,
                      "type": "`$INTEGER`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/achievements",
                "parts": [
                  "achievements",
                ],
                "select": {
                  "exist": [
                    "user_id",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "anime": {
        "fields": [
          {
            "name": "aired_on",
            "type": "`$STRING`",
          },
          {
            "name": "anons",
            "type": "`$BOOLEAN`",
          },
          {
            "name": "description",
            "type": "`$STRING`",
          },
          {
            "name": "description_html",
            "type": "`$STRING`",
          },
          {
            "name": "duration",
            "type": "`$INTEGER`",
          },
          {
            "name": "english",
            "type": "`$ARRAY`",
          },
          {
            "name": "episodes",
            "type": "`$INTEGER`",
          },
          {
            "name": "episodes_aired",
            "type": "`$INTEGER`",
          },
          {
            "name": "favoured",
            "type": "`$BOOLEAN`",
          },
          {
            "name": "franchise",
            "type": "`$STRING`",
          },
          {
            "name": "id",
            "type": "`$INTEGER`",
          },
          {
            "name": "image",
            "type": "`$OBJECT`",
          },
          {
            "name": "japanese",
            "type": "`$ARRAY`",
          },
          {
            "name": "kind",
            "type": "`$STRING`",
          },
          {
            "name": "myanimelist_id",
            "type": "`$INTEGER`",
          },
          {
            "name": "name",
            "type": "`$STRING`",
          },
          {
            "name": "ongoing",
            "type": "`$BOOLEAN`",
          },
          {
            "name": "rates_scores_stats",
            "type": "`$ARRAY`",
          },
          {
            "name": "rates_statuses_stats",
            "type": "`$ARRAY`",
          },
          {
            "name": "rating",
            "type": "`$STRING`",
          },
          {
            "name": "released_on",
            "type": "`$STRING`",
          },
          {
            "name": "russian",
            "type": "`$STRING`",
          },
          {
            "name": "score",
            "type": "`$STRING`",
          },
          {
            "name": "status",
            "type": "`$STRING`",
          },
          {
            "name": "synonyms",
            "type": "`$ARRAY`",
          },
          {
            "name": "thread_id",
            "type": "`$INTEGER`",
          },
          {
            "name": "topic_id",
            "type": "`$INTEGER`",
          },
          {
            "name": "url",
            "type": "`$STRING`",
          },
        ],
        "name": "anime",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "duration",
                      "orig": "duration",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "franchise",
                      "orig": "franchise",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "genre",
                      "orig": "genre",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "genre_v2",
                      "orig": "genre_v2",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "kind",
                      "orig": "kind",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "limit",
                      "orig": "limit",
                      "type": "`$INTEGER`",
                    },
                    {
                      "kind": "query",
                      "name": "order",
                      "orig": "order",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "page",
                      "orig": "page",
                      "type": "`$INTEGER`",
                    },
                    {
                      "kind": "query",
                      "name": "rating",
                      "orig": "rating",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "score",
                      "orig": "score",
                      "type": "`$NUMBER`",
                    },
                    {
                      "kind": "query",
                      "name": "season",
                      "orig": "season",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "status",
                      "orig": "status",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "studio",
                      "orig": "studio",
                      "type": "`$STRING`",
                    },
                    {
                      "kind": "query",
                      "name": "type",
                      "orig": "type",
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/animes",
                "parts": [
                  "animes",
                ],
                "select": {
                  "exist": [
                    "duration",
                    "franchise",
                    "genre",
                    "genre_v2",
                    "kind",
                    "limit",
                    "order",
                    "page",
                    "rating",
                    "score",
                    "season",
                    "status",
                    "studio",
                    "type",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
