package core

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
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 0,
					},
					map[string]any{
						"name": "level",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 1,
					},
					map[string]any{
						"name": "neko_id",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 2,
					},
					map[string]any{
						"name": "progress",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 3,
					},
					map[string]any{
						"name": "user_id",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 4,
					},
				},
				"name": "achievement",
				"op": map[string]any{
					"list": map[string]any{
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
											"active": true,
										},
									},
								},
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
								"active": true,
								"index$": 0,
							},
						},
						"input": "data",
						"key$": "list",
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
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 0,
					},
					map[string]any{
						"name": "anon",
						"req": false,
						"type": "`$BOOLEAN`",
						"active": true,
						"index$": 1,
					},
					map[string]any{
						"name": "description",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 2,
					},
					map[string]any{
						"name": "description_html",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 3,
					},
					map[string]any{
						"name": "duration",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 4,
					},
					map[string]any{
						"name": "english",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 5,
					},
					map[string]any{
						"name": "episode",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 6,
					},
					map[string]any{
						"name": "episodes_aired",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 7,
					},
					map[string]any{
						"name": "favoured",
						"req": false,
						"type": "`$BOOLEAN`",
						"active": true,
						"index$": 8,
					},
					map[string]any{
						"name": "franchise",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 9,
					},
					map[string]any{
						"name": "id",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 10,
					},
					map[string]any{
						"name": "image",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 11,
					},
					map[string]any{
						"name": "japanese",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 12,
					},
					map[string]any{
						"name": "kind",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 13,
					},
					map[string]any{
						"name": "myanimelist_id",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 14,
					},
					map[string]any{
						"name": "name",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 15,
					},
					map[string]any{
						"name": "ongoing",
						"req": false,
						"type": "`$BOOLEAN`",
						"active": true,
						"index$": 16,
					},
					map[string]any{
						"name": "rates_scores_stat",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 17,
					},
					map[string]any{
						"name": "rates_statuses_stat",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 18,
					},
					map[string]any{
						"name": "rating",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 19,
					},
					map[string]any{
						"name": "released_on",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 20,
					},
					map[string]any{
						"name": "russian",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 21,
					},
					map[string]any{
						"name": "score",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 22,
					},
					map[string]any{
						"name": "status",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 23,
					},
					map[string]any{
						"name": "synonym",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 24,
					},
					map[string]any{
						"name": "thread_id",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 25,
					},
					map[string]any{
						"name": "topic_id",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 26,
					},
					map[string]any{
						"name": "url",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 27,
					},
				},
				"name": "anime",
				"op": map[string]any{
					"list": map[string]any{
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "duration",
											"orig": "duration",
											"reqd": false,
											"type": "`$STRING`",
											"active": true,
										},
										map[string]any{
											"kind": "query",
											"name": "franchise",
											"orig": "franchise",
											"reqd": false,
											"type": "`$STRING`",
											"active": true,
										},
										map[string]any{
											"kind": "query",
											"name": "genre",
											"orig": "genre",
											"reqd": false,
											"type": "`$STRING`",
											"active": true,
										},
										map[string]any{
											"kind": "query",
											"name": "genre_v2",
											"orig": "genre_v2",
											"reqd": false,
											"type": "`$STRING`",
											"active": true,
										},
										map[string]any{
											"kind": "query",
											"name": "kind",
											"orig": "kind",
											"reqd": false,
											"type": "`$STRING`",
											"active": true,
										},
										map[string]any{
											"kind": "query",
											"name": "limit",
											"orig": "limit",
											"reqd": false,
											"type": "`$INTEGER`",
											"active": true,
										},
										map[string]any{
											"kind": "query",
											"name": "order",
											"orig": "order",
											"reqd": false,
											"type": "`$STRING`",
											"active": true,
										},
										map[string]any{
											"kind": "query",
											"name": "page",
											"orig": "page",
											"reqd": false,
											"type": "`$INTEGER`",
											"active": true,
										},
										map[string]any{
											"kind": "query",
											"name": "rating",
											"orig": "rating",
											"reqd": false,
											"type": "`$STRING`",
											"active": true,
										},
										map[string]any{
											"kind": "query",
											"name": "score",
											"orig": "score",
											"reqd": false,
											"type": "`$NUMBER`",
											"active": true,
										},
										map[string]any{
											"kind": "query",
											"name": "season",
											"orig": "season",
											"reqd": false,
											"type": "`$STRING`",
											"active": true,
										},
										map[string]any{
											"kind": "query",
											"name": "status",
											"orig": "status",
											"reqd": false,
											"type": "`$STRING`",
											"active": true,
										},
										map[string]any{
											"kind": "query",
											"name": "studio",
											"orig": "studio",
											"reqd": false,
											"type": "`$STRING`",
											"active": true,
										},
										map[string]any{
											"kind": "query",
											"name": "type",
											"orig": "type",
											"reqd": false,
											"type": "`$STRING`",
											"active": true,
										},
									},
								},
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
								"active": true,
								"index$": 0,
							},
						},
						"input": "data",
						"key$": "list",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
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
