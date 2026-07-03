-- ProjectName SDK configuration

local function make_config()
  return {
    main = {
      name = "Shikimori",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
      },
    },
    options = {
      base = "https://shikimori.one/api",
      auth = {
        prefix = "Bearer",
      },
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["achievement"] = {},
        ["anime"] = {},
      },
    },
    entity = {
      ["achievement"] = {
        ["fields"] = {
          {
            ["active"] = true,
            ["name"] = "id",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 0,
          },
          {
            ["active"] = true,
            ["name"] = "level",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 1,
          },
          {
            ["active"] = true,
            ["name"] = "neko_id",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 2,
          },
          {
            ["active"] = true,
            ["name"] = "progress",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 3,
          },
          {
            ["active"] = true,
            ["name"] = "user_id",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 4,
          },
        },
        ["name"] = "achievement",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {
                  ["query"] = {
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "user_id",
                      ["orig"] = "user_id",
                      ["reqd"] = true,
                      ["type"] = "`$INTEGER`",
                    },
                  },
                },
                ["method"] = "GET",
                ["orig"] = "/achievements",
                ["parts"] = {
                  "achievements",
                },
                ["select"] = {
                  ["exist"] = {
                    "user_id",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["index$"] = 0,
              },
            },
            ["key$"] = "list",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["anime"] = {
        ["fields"] = {
          {
            ["active"] = true,
            ["name"] = "aired_on",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 0,
          },
          {
            ["active"] = true,
            ["name"] = "anon",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["index$"] = 1,
          },
          {
            ["active"] = true,
            ["name"] = "description",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 2,
          },
          {
            ["active"] = true,
            ["name"] = "description_html",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 3,
          },
          {
            ["active"] = true,
            ["name"] = "duration",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 4,
          },
          {
            ["active"] = true,
            ["name"] = "english",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["index$"] = 5,
          },
          {
            ["active"] = true,
            ["name"] = "episode",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 6,
          },
          {
            ["active"] = true,
            ["name"] = "episodes_aired",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 7,
          },
          {
            ["active"] = true,
            ["name"] = "favoured",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["index$"] = 8,
          },
          {
            ["active"] = true,
            ["name"] = "franchise",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 9,
          },
          {
            ["active"] = true,
            ["name"] = "id",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 10,
          },
          {
            ["active"] = true,
            ["name"] = "image",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 11,
          },
          {
            ["active"] = true,
            ["name"] = "japanese",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["index$"] = 12,
          },
          {
            ["active"] = true,
            ["name"] = "kind",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 13,
          },
          {
            ["active"] = true,
            ["name"] = "myanimelist_id",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 14,
          },
          {
            ["active"] = true,
            ["name"] = "name",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 15,
          },
          {
            ["active"] = true,
            ["name"] = "ongoing",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["index$"] = 16,
          },
          {
            ["active"] = true,
            ["name"] = "rates_scores_stat",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["index$"] = 17,
          },
          {
            ["active"] = true,
            ["name"] = "rates_statuses_stat",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["index$"] = 18,
          },
          {
            ["active"] = true,
            ["name"] = "rating",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 19,
          },
          {
            ["active"] = true,
            ["name"] = "released_on",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 20,
          },
          {
            ["active"] = true,
            ["name"] = "russian",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 21,
          },
          {
            ["active"] = true,
            ["name"] = "score",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 22,
          },
          {
            ["active"] = true,
            ["name"] = "status",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 23,
          },
          {
            ["active"] = true,
            ["name"] = "synonym",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["index$"] = 24,
          },
          {
            ["active"] = true,
            ["name"] = "thread_id",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 25,
          },
          {
            ["active"] = true,
            ["name"] = "topic_id",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 26,
          },
          {
            ["active"] = true,
            ["name"] = "url",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 27,
          },
        },
        ["name"] = "anime",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {
                  ["query"] = {
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "duration",
                      ["orig"] = "duration",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "franchise",
                      ["orig"] = "franchise",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "genre",
                      ["orig"] = "genre",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "genre_v2",
                      ["orig"] = "genre_v2",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "kind",
                      ["orig"] = "kind",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "limit",
                      ["orig"] = "limit",
                      ["reqd"] = false,
                      ["type"] = "`$INTEGER`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "order",
                      ["orig"] = "order",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "page",
                      ["orig"] = "page",
                      ["reqd"] = false,
                      ["type"] = "`$INTEGER`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "rating",
                      ["orig"] = "rating",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "score",
                      ["orig"] = "score",
                      ["reqd"] = false,
                      ["type"] = "`$NUMBER`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "season",
                      ["orig"] = "season",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "status",
                      ["orig"] = "status",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "studio",
                      ["orig"] = "studio",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "type",
                      ["orig"] = "type",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["method"] = "GET",
                ["orig"] = "/animes",
                ["parts"] = {
                  "animes",
                },
                ["select"] = {
                  ["exist"] = {
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
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["index$"] = 0,
              },
            },
            ["key$"] = "list",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
