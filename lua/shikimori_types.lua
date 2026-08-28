-- Typed models for the Shikimori SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Achievement
---@field id? number
---@field level? number
---@field neko_id? string
---@field progress? number
---@field user_id? number

---@class AchievementListMatch
---@field user_id number

---@class Anime
---@field aired_on? string
---@field anons? boolean
---@field description? string
---@field description_html? string
---@field duration? number
---@field english? table
---@field episodes? number
---@field episodes_aired? number
---@field favoured? boolean
---@field franchise? string
---@field id? number
---@field image? table
---@field japanese? table
---@field kind? string
---@field myanimelist_id? number
---@field name? string
---@field ongoing? boolean
---@field rates_scores_stats? table
---@field rates_statuses_stats? table
---@field rating? string
---@field released_on? string
---@field russian? string
---@field score? string
---@field status? string
---@field synonyms? table
---@field thread_id? number
---@field topic_id? number
---@field url? string

---@class AnimeListMatch
---@field duration? string
---@field franchise? string
---@field genre? string
---@field genre_v2? string
---@field kind? string
---@field limit? number
---@field order? string
---@field page? number
---@field rating? string
---@field score? number
---@field season? string
---@field status? string
---@field studio? string
---@field type? string

local M = {}

return M
