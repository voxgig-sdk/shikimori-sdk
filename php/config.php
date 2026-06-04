<?php
declare(strict_types=1);

// Shikimori SDK configuration

class ShikimoriConfig
{
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "Shikimori",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://shikimori.one/api",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "achievement" => [],
                    "anime" => [],
                ],
            ],
            "entity" => [
        'achievement' => [
          'fields' => [
            [
              'name' => 'id',
              'req' => false,
              'type' => '`$INTEGER`',
              'active' => true,
              'index$' => 0,
            ],
            [
              'name' => 'level',
              'req' => false,
              'type' => '`$INTEGER`',
              'active' => true,
              'index$' => 1,
            ],
            [
              'name' => 'neko_id',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 2,
            ],
            [
              'name' => 'progress',
              'req' => false,
              'type' => '`$INTEGER`',
              'active' => true,
              'index$' => 3,
            ],
            [
              'name' => 'user_id',
              'req' => false,
              'type' => '`$INTEGER`',
              'active' => true,
              'index$' => 4,
            ],
          ],
          'name' => 'achievement',
          'op' => [
            'list' => [
              'name' => 'list',
              'points' => [
                [
                  'args' => [
                    'query' => [
                      [
                        'kind' => 'query',
                        'name' => 'user_id',
                        'orig' => 'user_id',
                        'reqd' => true,
                        'type' => '`$INTEGER`',
                        'active' => true,
                      ],
                    ],
                  ],
                  'method' => 'GET',
                  'orig' => '/achievements',
                  'parts' => [
                    'achievements',
                  ],
                  'select' => [
                    'exist' => [
                      'user_id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'active' => true,
                  'index$' => 0,
                ],
              ],
              'input' => 'data',
              'key$' => 'list',
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
        'anime' => [
          'fields' => [
            [
              'name' => 'aired_on',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 0,
            ],
            [
              'name' => 'anon',
              'req' => false,
              'type' => '`$BOOLEAN`',
              'active' => true,
              'index$' => 1,
            ],
            [
              'name' => 'description',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 2,
            ],
            [
              'name' => 'description_html',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 3,
            ],
            [
              'name' => 'duration',
              'req' => false,
              'type' => '`$INTEGER`',
              'active' => true,
              'index$' => 4,
            ],
            [
              'name' => 'english',
              'req' => false,
              'type' => '`$ARRAY`',
              'active' => true,
              'index$' => 5,
            ],
            [
              'name' => 'episode',
              'req' => false,
              'type' => '`$INTEGER`',
              'active' => true,
              'index$' => 6,
            ],
            [
              'name' => 'episodes_aired',
              'req' => false,
              'type' => '`$INTEGER`',
              'active' => true,
              'index$' => 7,
            ],
            [
              'name' => 'favoured',
              'req' => false,
              'type' => '`$BOOLEAN`',
              'active' => true,
              'index$' => 8,
            ],
            [
              'name' => 'franchise',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 9,
            ],
            [
              'name' => 'id',
              'req' => false,
              'type' => '`$INTEGER`',
              'active' => true,
              'index$' => 10,
            ],
            [
              'name' => 'image',
              'req' => false,
              'type' => '`$OBJECT`',
              'active' => true,
              'index$' => 11,
            ],
            [
              'name' => 'japanese',
              'req' => false,
              'type' => '`$ARRAY`',
              'active' => true,
              'index$' => 12,
            ],
            [
              'name' => 'kind',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 13,
            ],
            [
              'name' => 'myanimelist_id',
              'req' => false,
              'type' => '`$INTEGER`',
              'active' => true,
              'index$' => 14,
            ],
            [
              'name' => 'name',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 15,
            ],
            [
              'name' => 'ongoing',
              'req' => false,
              'type' => '`$BOOLEAN`',
              'active' => true,
              'index$' => 16,
            ],
            [
              'name' => 'rates_scores_stat',
              'req' => false,
              'type' => '`$ARRAY`',
              'active' => true,
              'index$' => 17,
            ],
            [
              'name' => 'rates_statuses_stat',
              'req' => false,
              'type' => '`$ARRAY`',
              'active' => true,
              'index$' => 18,
            ],
            [
              'name' => 'rating',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 19,
            ],
            [
              'name' => 'released_on',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 20,
            ],
            [
              'name' => 'russian',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 21,
            ],
            [
              'name' => 'score',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 22,
            ],
            [
              'name' => 'status',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 23,
            ],
            [
              'name' => 'synonym',
              'req' => false,
              'type' => '`$ARRAY`',
              'active' => true,
              'index$' => 24,
            ],
            [
              'name' => 'thread_id',
              'req' => false,
              'type' => '`$INTEGER`',
              'active' => true,
              'index$' => 25,
            ],
            [
              'name' => 'topic_id',
              'req' => false,
              'type' => '`$INTEGER`',
              'active' => true,
              'index$' => 26,
            ],
            [
              'name' => 'url',
              'req' => false,
              'type' => '`$STRING`',
              'active' => true,
              'index$' => 27,
            ],
          ],
          'name' => 'anime',
          'op' => [
            'list' => [
              'name' => 'list',
              'points' => [
                [
                  'args' => [
                    'query' => [
                      [
                        'kind' => 'query',
                        'name' => 'duration',
                        'orig' => 'duration',
                        'reqd' => false,
                        'type' => '`$STRING`',
                        'active' => true,
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'franchise',
                        'orig' => 'franchise',
                        'reqd' => false,
                        'type' => '`$STRING`',
                        'active' => true,
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'genre',
                        'orig' => 'genre',
                        'reqd' => false,
                        'type' => '`$STRING`',
                        'active' => true,
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'genre_v2',
                        'orig' => 'genre_v2',
                        'reqd' => false,
                        'type' => '`$STRING`',
                        'active' => true,
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'kind',
                        'orig' => 'kind',
                        'reqd' => false,
                        'type' => '`$STRING`',
                        'active' => true,
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'limit',
                        'orig' => 'limit',
                        'reqd' => false,
                        'type' => '`$INTEGER`',
                        'active' => true,
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'order',
                        'orig' => 'order',
                        'reqd' => false,
                        'type' => '`$STRING`',
                        'active' => true,
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'page',
                        'orig' => 'page',
                        'reqd' => false,
                        'type' => '`$INTEGER`',
                        'active' => true,
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'rating',
                        'orig' => 'rating',
                        'reqd' => false,
                        'type' => '`$STRING`',
                        'active' => true,
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'score',
                        'orig' => 'score',
                        'reqd' => false,
                        'type' => '`$NUMBER`',
                        'active' => true,
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'season',
                        'orig' => 'season',
                        'reqd' => false,
                        'type' => '`$STRING`',
                        'active' => true,
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'status',
                        'orig' => 'status',
                        'reqd' => false,
                        'type' => '`$STRING`',
                        'active' => true,
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'studio',
                        'orig' => 'studio',
                        'reqd' => false,
                        'type' => '`$STRING`',
                        'active' => true,
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'type',
                        'orig' => 'type',
                        'reqd' => false,
                        'type' => '`$STRING`',
                        'active' => true,
                      ],
                    ],
                  ],
                  'method' => 'GET',
                  'orig' => '/animes',
                  'parts' => [
                    'animes',
                  ],
                  'select' => [
                    'exist' => [
                      'duration',
                      'franchise',
                      'genre',
                      'genre_v2',
                      'kind',
                      'limit',
                      'order',
                      'page',
                      'rating',
                      'score',
                      'season',
                      'status',
                      'studio',
                      'type',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'active' => true,
                  'index$' => 0,
                ],
              ],
              'input' => 'data',
              'key$' => 'list',
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return ShikimoriFeatures::make_feature($name);
    }
}
