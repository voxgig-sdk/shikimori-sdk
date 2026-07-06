// Typed models for the Shikimori SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import "encoding/json"

// Achievement is the typed data model for the achievement entity.
type Achievement struct {
	Id *int `json:"id,omitempty"`
	Level *int `json:"level,omitempty"`
	NekoId *string `json:"neko_id,omitempty"`
	Progress *int `json:"progress,omitempty"`
	UserId *int `json:"user_id,omitempty"`
}

// AchievementListMatch is the typed request payload for Achievement.ListTyped.
type AchievementListMatch struct {
	Id *int `json:"id,omitempty"`
	Level *int `json:"level,omitempty"`
	NekoId *string `json:"neko_id,omitempty"`
	Progress *int `json:"progress,omitempty"`
	UserId *int `json:"user_id,omitempty"`
}

// Anime is the typed data model for the anime entity.
type Anime struct {
	AiredOn *string `json:"aired_on,omitempty"`
	Anon *bool `json:"anon,omitempty"`
	Description *string `json:"description,omitempty"`
	DescriptionHtml *string `json:"description_html,omitempty"`
	Duration *int `json:"duration,omitempty"`
	English *[]any `json:"english,omitempty"`
	Episode *int `json:"episode,omitempty"`
	EpisodesAired *int `json:"episodes_aired,omitempty"`
	Favoured *bool `json:"favoured,omitempty"`
	Franchise *string `json:"franchise,omitempty"`
	Id *int `json:"id,omitempty"`
	Image *map[string]any `json:"image,omitempty"`
	Japanese *[]any `json:"japanese,omitempty"`
	Kind *string `json:"kind,omitempty"`
	MyanimelistId *int `json:"myanimelist_id,omitempty"`
	Name *string `json:"name,omitempty"`
	Ongoing *bool `json:"ongoing,omitempty"`
	RatesScoresStat *[]any `json:"rates_scores_stat,omitempty"`
	RatesStatusesStat *[]any `json:"rates_statuses_stat,omitempty"`
	Rating *string `json:"rating,omitempty"`
	ReleasedOn *string `json:"released_on,omitempty"`
	Russian *string `json:"russian,omitempty"`
	Score *string `json:"score,omitempty"`
	Status *string `json:"status,omitempty"`
	Synonym *[]any `json:"synonym,omitempty"`
	ThreadId *int `json:"thread_id,omitempty"`
	TopicId *int `json:"topic_id,omitempty"`
	Url *string `json:"url,omitempty"`
}

// AnimeListMatch is the typed request payload for Anime.ListTyped.
type AnimeListMatch struct {
	AiredOn *string `json:"aired_on,omitempty"`
	Anon *bool `json:"anon,omitempty"`
	Description *string `json:"description,omitempty"`
	DescriptionHtml *string `json:"description_html,omitempty"`
	Duration *int `json:"duration,omitempty"`
	English *[]any `json:"english,omitempty"`
	Episode *int `json:"episode,omitempty"`
	EpisodesAired *int `json:"episodes_aired,omitempty"`
	Favoured *bool `json:"favoured,omitempty"`
	Franchise *string `json:"franchise,omitempty"`
	Id *int `json:"id,omitempty"`
	Image *map[string]any `json:"image,omitempty"`
	Japanese *[]any `json:"japanese,omitempty"`
	Kind *string `json:"kind,omitempty"`
	MyanimelistId *int `json:"myanimelist_id,omitempty"`
	Name *string `json:"name,omitempty"`
	Ongoing *bool `json:"ongoing,omitempty"`
	RatesScoresStat *[]any `json:"rates_scores_stat,omitempty"`
	RatesStatusesStat *[]any `json:"rates_statuses_stat,omitempty"`
	Rating *string `json:"rating,omitempty"`
	ReleasedOn *string `json:"released_on,omitempty"`
	Russian *string `json:"russian,omitempty"`
	Score *string `json:"score,omitempty"`
	Status *string `json:"status,omitempty"`
	Synonym *[]any `json:"synonym,omitempty"`
	ThreadId *int `json:"thread_id,omitempty"`
	TopicId *int `json:"topic_id,omitempty"`
	Url *string `json:"url,omitempty"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedFrom decodes a runtime value (a map[string]any produced by the op
// pipeline) into a typed model T via a JSON round-trip. On any error it
// returns the zero value of T; the op's own (value, error) tuple carries the
// real error.
func typedFrom[T any](v any) T {
	var out T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value ([]any of maps) into a typed
// slice []T via a JSON round-trip, for list ops.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
