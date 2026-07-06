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
AchievementListMatch = Struct.new(
  :id,
  :level,
  :neko_id,
  :progress,
  :user_id,
  keyword_init: true
)

# Anime entity data model.
#
# @!attribute [rw] aired_on
#   @return [String, nil]
#
# @!attribute [rw] anon
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
# @!attribute [rw] episode
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
# @!attribute [rw] rates_scores_stat
#   @return [Array, nil]
#
# @!attribute [rw] rates_statuses_stat
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
# @!attribute [rw] synonym
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
  :anon,
  :description,
  :description_html,
  :duration,
  :english,
  :episode,
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
  :rates_scores_stat,
  :rates_statuses_stat,
  :rating,
  :released_on,
  :russian,
  :score,
  :status,
  :synonym,
  :thread_id,
  :topic_id,
  :url,
  keyword_init: true
)

# Request payload for Anime#list.
#
# @!attribute [rw] aired_on
#   @return [String, nil]
#
# @!attribute [rw] anon
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
# @!attribute [rw] episode
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
# @!attribute [rw] rates_scores_stat
#   @return [Array, nil]
#
# @!attribute [rw] rates_statuses_stat
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
# @!attribute [rw] synonym
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
AnimeListMatch = Struct.new(
  :aired_on,
  :anon,
  :description,
  :description_html,
  :duration,
  :english,
  :episode,
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
  :rates_scores_stat,
  :rates_statuses_stat,
  :rating,
  :released_on,
  :russian,
  :score,
  :status,
  :synonym,
  :thread_id,
  :topic_id,
  :url,
  keyword_init: true
)

