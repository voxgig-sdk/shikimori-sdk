package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "Shikimori",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
			},
		},
		"options": map[string]any{
			"base": "https://shikimori.one/api",
			"auth": map[string]any{
				"prefix": "Bearer",
			},
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"achievement": map[string]any{},
				"anime": map[string]any{},
			},
		},
		"entity": map[string]any{
			"achievement": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "id",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "level",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "neko_id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "progress",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "user_id",
						"type": "`$INTEGER`",
					},
				},
				"name": "achievement",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "user_id",
											"orig": "user_id",
											"reqd": true,
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/achievements",
								"parts": []any{
									"achievements",
								},
								"select": map[string]any{
									"exist": []any{
										"user_id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"anime": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "aired_on",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "anons",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "description",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "description_html",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "duration",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "english",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "episodes",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "episodes_aired",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "favoured",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "franchise",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "image",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "japanese",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "kind",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "myanimelist_id",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "ongoing",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "rates_scores_stats",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "rates_statuses_stats",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "rating",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "released_on",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "russian",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "score",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "status",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "synonyms",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "thread_id",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "topic_id",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "url",
						"type": "`$STRING`",
					},
				},
				"name": "anime",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "duration",
											"orig": "duration",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "franchise",
											"orig": "franchise",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "genre",
											"orig": "genre",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "genre_v2",
											"orig": "genre_v2",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "kind",
											"orig": "kind",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "limit",
											"orig": "limit",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "order",
											"orig": "order",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "page",
											"orig": "page",
											"type": "`$INTEGER`",
										},
										map[string]any{
											"kind": "query",
											"name": "rating",
											"orig": "rating",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "score",
											"orig": "score",
											"type": "`$NUMBER`",
										},
										map[string]any{
											"kind": "query",
											"name": "season",
											"orig": "season",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "status",
											"orig": "status",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "studio",
											"orig": "studio",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "type",
											"orig": "type",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/animes",
								"parts": []any{
									"animes",
								},
								"select": map[string]any{
									"exist": []any{
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
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
