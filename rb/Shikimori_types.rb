# frozen_string_literal: true

# Typed models for the Shikimori SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Achievement entity data model.
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] level
#   @return [Integer, nil]
#
# @!attribute [rw] neko_id
#   @return [String, nil]
#
# @!attribute [rw] progress
#   @return [Integer, nil]
#
# @!attribute [rw] user_id
#   @return [Integer, nil]
Achievement = Struct.new(
  :id,
  :level,
  :neko_id,
  :progress,
  :user_id,
  keyword_init: true
)

# Request payload for Achievement#list.
#
# @!attribute [rw] user_id
#   @return [Integer]
AchievementListMatch = Struct.new(
  :user_id,
  keyword_init: true
)

# Anime entity data model.
#
# @!attribute [rw] aired_on
#   @return [String, nil]
#
# @!attribute [rw] anons
#   @return [Boolean, nil]
#
# @!attribute [rw] description
#   @return [String, nil]
#
# @!attribute [rw] description_html
#   @return [String, nil]
#
# @!attribute [rw] duration
#   @return [Integer, nil]
#
# @!attribute [rw] english
#   @return [Array, nil]
#
# @!attribute [rw] episodes
#   @return [Integer, nil]
#
# @!attribute [rw] episodes_aired
#   @return [Integer, nil]
#
# @!attribute [rw] favoured
#   @return [Boolean, nil]
#
# @!attribute [rw] franchise
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] image
#   @return [Hash, nil]
#
# @!attribute [rw] japanese
#   @return [Array, nil]
#
# @!attribute [rw] kind
#   @return [String, nil]
#
# @!attribute [rw] myanimelist_id
#   @return [Integer, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] ongoing
#   @return [Boolean, nil]
#
# @!attribute [rw] rates_scores_stats
#   @return [Array, nil]
#
# @!attribute [rw] rates_statuses_stats
#   @return [Array, nil]
#
# @!attribute [rw] rating
#   @return [String, nil]
#
# @!attribute [rw] released_on
#   @return [String, nil]
#
# @!attribute [rw] russian
#   @return [String, nil]
#
# @!attribute [rw] score
#   @return [String, nil]
#
# @!attribute [rw] status
#   @return [String, nil]
#
# @!attribute [rw] synonyms
#   @return [Array, nil]
#
# @!attribute [rw] thread_id
#   @return [Integer, nil]
#
# @!attribute [rw] topic_id
#   @return [Integer, nil]
#
# @!attribute [rw] url
#   @return [String, nil]
Anime = Struct.new(
  :aired_on,
  :anons,
  :description,
  :description_html,
  :duration,
  :english,
  :episodes,
  :episodes_aired,
  :favoured,
  :franchise,
  :id,
  :image,
  :japanese,
  :kind,
  :myanimelist_id,
  :name,
  :ongoing,
  :rates_scores_stats,
  :rates_statuses_stats,
  :rating,
  :released_on,
  :russian,
  :score,
  :status,
  :synonyms,
  :thread_id,
  :topic_id,
  :url,
  keyword_init: true
)

# Request payload for Anime#list.
#
# @!attribute [rw] duration
#   @return [String, nil]
#
# @!attribute [rw] franchise
#   @return [String, nil]
#
# @!attribute [rw] genre
#   @return [String, nil]
#
# @!attribute [rw] genre_v2
#   @return [String, nil]
#
# @!attribute [rw] kind
#   @return [String, nil]
#
# @!attribute [rw] limit
#   @return [Integer, nil]
#
# @!attribute [rw] order
#   @return [String, nil]
#
# @!attribute [rw] page
#   @return [Integer, nil]
#
# @!attribute [rw] rating
#   @return [String, nil]
#
# @!attribute [rw] score
#   @return [Float, nil]
#
# @!attribute [rw] season
#   @return [String, nil]
#
# @!attribute [rw] status
#   @return [String, nil]
#
# @!attribute [rw] studio
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
AnimeListMatch = Struct.new(
  :duration,
  :franchise,
  :genre,
  :genre_v2,
  :kind,
  :limit,
  :order,
  :page,
  :rating,
  :score,
  :season,
  :status,
  :studio,
  :type,
  keyword_init: true
)

