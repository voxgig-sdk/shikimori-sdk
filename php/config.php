<?php
declare(strict_types=1);

// Shikimori SDK configuration

class ShikimoriConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "Shikimori",
                "slug" => "shikimori",
                "version" => "0.0.1",
                "target" => "php",
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
                "auth" => [
                    "prefix" => "Bearer",
                ],
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
              'short' => 'Achievement ID',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'level',
              'short' => 'Achievement level',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'neko_id',
              'short' => 'Neko achievement identifier',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'progress',
              'short' => 'Progress towards next level',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'user_id',
              'short' => 'User ID',
              'type' => '`$INTEGER`',
            ],
          ],
          'name' => 'achievement',
          'op' => [
            'list' => [
              'input' => 'data',
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
                      ],
                    ],
                  ],
                  'kind' => 'http',
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
                ],
              ],
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
              'short' => 'Aired date',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'anons',
              'short' => 'Is in anons state',
              'type' => '`$BOOLEAN`',
            ],
            [
              'name' => 'description',
              'short' => 'Anime description',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'description_html',
              'short' => 'HTML formatted description',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'duration',
              'short' => 'Episode duration in minutes',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'english',
              'short' => 'English names',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'episodes',
              'short' => 'Number of episodes',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'episodes_aired',
              'short' => 'Number of aired episodes',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'favoured',
              'short' => 'Favoured by user',
              'type' => '`$BOOLEAN`',
            ],
            [
              'name' => 'franchise',
              'short' => 'Franchise name',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'id',
              'short' => 'Anime ID',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'image',
              'type' => '`$OBJECT`',
            ],
            [
              'name' => 'japanese',
              'short' => 'Japanese names',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'kind',
              'short' => 'Anime type',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'myanimelist_id',
              'short' => 'MyAnimeList ID',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'name',
              'short' => 'Anime name',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'ongoing',
              'short' => 'Is ongoing',
              'type' => '`$BOOLEAN`',
            ],
            [
              'name' => 'rates_scores_stats',
              'short' => 'Rating statistics',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'rates_statuses_stats',
              'short' => 'Status statistics',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'rating',
              'short' => 'Age rating',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'released_on',
              'short' => 'Released date',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'russian',
              'short' => 'Russian name',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'score',
              'short' => 'Anime score',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'status',
              'short' => 'Anime status',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'synonyms',
              'short' => 'Alternative names',
              'type' => '`$ARRAY`',
            ],
            [
              'name' => 'thread_id',
              'short' => 'Thread ID',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'topic_id',
              'short' => 'Topic ID',
              'type' => '`$INTEGER`',
            ],
            [
              'name' => 'url',
              'short' => 'Anime URL',
              'type' => '`$STRING`',
            ],
          ],
          'name' => 'anime',
          'op' => [
            'list' => [
              'input' => 'data',
              'name' => 'list',
              'points' => [
                [
                  'args' => [
                    'query' => [
                      [
                        'kind' => 'query',
                        'name' => 'duration',
                        'orig' => 'duration',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'franchise',
                        'orig' => 'franchise',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'genre',
                        'orig' => 'genre',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'genre_v2',
                        'orig' => 'genre_v2',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'kind',
                        'orig' => 'kind',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'limit',
                        'orig' => 'limit',
                        'type' => '`$INTEGER`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'order',
                        'orig' => 'order',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'page',
                        'orig' => 'page',
                        'type' => '`$INTEGER`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'rating',
                        'orig' => 'rating',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'score',
                        'orig' => 'score',
                        'type' => '`$NUMBER`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'season',
                        'orig' => 'season',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'status',
                        'orig' => 'status',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'studio',
                        'orig' => 'studio',
                        'type' => '`$STRING`',
                      ],
                      [
                        'kind' => 'query',
                        'name' => 'type',
                        'orig' => 'type',
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
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
                ],
              ],
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
