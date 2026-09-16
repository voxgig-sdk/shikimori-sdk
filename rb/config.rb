# Shikimori SDK configuration

module ShikimoriConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "Shikimori",
        "slug" => "shikimori",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "ratelimit" => {
          "options" => {
            "active" => false,
            "burst" => 5,
            "rate" => 5,
          },
          "optspec" => {
            "now" => "`$FUNCTION`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "retry" => {
          "options" => {
            "active" => false,
            "factor" => 2,
            "maxDelay" => 2000,
            "minDelay" => 50,
            "retries" => 2,
            "statuses" => [
              408,
              425,
              429,
              500,
              502,
              503,
              504,
            ],
          },
          "optspec" => {
            "jitter" => "`$BOOLEAN`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "test" => {
          "options" => {
            "active" => false,
          },
          "optspec" => {
            "entity" => "`$MAP`",
            "net" => "`$MAP`",
          },
          "strict" => false,
          "transport" => "base",
        },
        "timeout" => {
          "options" => {
            "active" => false,
            "ms" => 30000,
          },
          "optspec" => {
            "clearTimer" => "`$FUNCTION`",
            "setTimer" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
      },
      "options" => {
        "base" => "https://shikimori.one/api",
        "auth" => {
          "prefix" => "Bearer",
        },
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "achievement" => {},
          "anime" => {},
        },
      },
      "entity" => {
        "achievement" => {
          "fields" => [
            {
              "name" => "id",
              "short" => "Achievement ID",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "level",
              "short" => "Achievement level",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "neko_id",
              "short" => "Neko achievement identifier",
              "type" => "`$STRING`",
            },
            {
              "name" => "progress",
              "short" => "Progress towards next level",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "user_id",
              "short" => "User ID",
              "type" => "`$INTEGER`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
          "name" => "achievement",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "user_id",
                        "orig" => "user_id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/achievements",
                  "segments" => [
                    {
                      "lit" => "achievements",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "user_id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "achievements",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "anime" => {
          "fields" => [
            {
              "format" => "date",
              "name" => "aired_on",
              "short" => "Aired date",
              "type" => "`$STRING`",
            },
            {
              "name" => "anons",
              "short" => "Is in anons state",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "description",
              "short" => "Anime description",
              "type" => "`$STRING`",
            },
            {
              "name" => "description_html",
              "short" => "HTML formatted description",
              "type" => "`$STRING`",
            },
            {
              "name" => "duration",
              "short" => "Episode duration in minutes",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "english",
              "short" => "English names",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "episodes",
              "short" => "Number of episodes",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "episodes_aired",
              "short" => "Number of aired episodes",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "favoured",
              "short" => "Favoured by user",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "franchise",
              "short" => "Franchise name",
              "type" => "`$STRING`",
            },
            {
              "name" => "id",
              "short" => "Anime ID",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "image",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "japanese",
              "short" => "Japanese names",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "kind",
              "short" => "Anime type",
              "type" => "`$STRING`",
            },
            {
              "name" => "myanimelist_id",
              "short" => "MyAnimeList ID",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "name",
              "short" => "Anime name",
              "type" => "`$STRING`",
            },
            {
              "name" => "ongoing",
              "short" => "Is ongoing",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "rates_scores_stats",
              "short" => "Rating statistics",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "rates_statuses_stats",
              "short" => "Status statistics",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "rating",
              "short" => "Age rating",
              "type" => "`$STRING`",
            },
            {
              "format" => "date",
              "name" => "released_on",
              "short" => "Released date",
              "type" => "`$STRING`",
            },
            {
              "name" => "russian",
              "short" => "Russian name",
              "type" => "`$STRING`",
            },
            {
              "name" => "score",
              "short" => "Anime score",
              "type" => "`$STRING`",
            },
            {
              "name" => "status",
              "short" => "Anime status",
              "type" => "`$STRING`",
            },
            {
              "name" => "synonyms",
              "short" => "Alternative names",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "thread_id",
              "short" => "Thread ID",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "topic_id",
              "short" => "Topic ID",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "url",
              "short" => "Anime URL",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
          "name" => "anime",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "duration",
                        "orig" => "duration",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "franchise",
                        "orig" => "franchise",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "genre",
                        "orig" => "genre",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "genre_v2",
                        "orig" => "genre_v2",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "kind",
                        "orig" => "kind",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "limit",
                        "orig" => "limit",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "order",
                        "orig" => "order",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "page",
                        "orig" => "page",
                        "type" => "`$INTEGER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "rating",
                        "orig" => "rating",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "score",
                        "orig" => "score",
                        "type" => "`$NUMBER`",
                      },
                      {
                        "kind" => "query",
                        "name" => "season",
                        "orig" => "season",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "status",
                        "orig" => "status",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "studio",
                        "orig" => "studio",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "type",
                        "orig" => "type",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/animes",
                  "segments" => [
                    {
                      "lit" => "animes",
                    },
                  ],
                  "select" => {
                    "exist" => [
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
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "animes",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    ShikimoriFeatures.make_feature(name)
  end
end
