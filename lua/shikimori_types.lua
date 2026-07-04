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

---@class Anime
---@field aired_on? string
---@field anon? boolean
---@field description? string
---@field description_html? string
---@field duration? number
---@field english? table
---@field episode? number
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
---@field rates_scores_stat? table
---@field rates_statuses_stat? table
---@field rating? string
---@field released_on? string
---@field russian? string
---@field score? string
---@field status? string
---@field synonym? table
---@field thread_id? number
---@field topic_id? number
---@field url? string

---@class AnimeListMatch

local M = {}

return M
