// Typed models for the Shikimori SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Achievement {
  id?: number
  level?: number
  neko_id?: string
  progress?: number
  user_id?: number
}

export type AchievementListMatch = Partial<Achievement>

export interface Anime {
  aired_on?: string
  anon?: boolean
  description?: string
  description_html?: string
  duration?: number
  english?: any[]
  episode?: number
  episodes_aired?: number
  favoured?: boolean
  franchise?: string
  id?: number
  image?: Record<string, any>
  japanese?: any[]
  kind?: string
  myanimelist_id?: number
  name?: string
  ongoing?: boolean
  rates_scores_stat?: any[]
  rates_statuses_stat?: any[]
  rating?: string
  released_on?: string
  russian?: string
  score?: string
  status?: string
  synonym?: any[]
  thread_id?: number
  topic_id?: number
  url?: string
}

export type AnimeListMatch = Partial<Anime>

