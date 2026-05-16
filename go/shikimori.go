package voxgigshikimorisdk

import (
	"github.com/voxgig-sdk/shikimori-sdk/core"
	"github.com/voxgig-sdk/shikimori-sdk/entity"
	"github.com/voxgig-sdk/shikimori-sdk/feature"
	_ "github.com/voxgig-sdk/shikimori-sdk/utility"
)

// Type aliases preserve external API.
type ShikimoriSDK = core.ShikimoriSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type ShikimoriEntity = core.ShikimoriEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type ShikimoriError = core.ShikimoriError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewAchievementEntityFunc = func(client *core.ShikimoriSDK, entopts map[string]any) core.ShikimoriEntity {
		return entity.NewAchievementEntity(client, entopts)
	}
	core.NewAnimeEntityFunc = func(client *core.ShikimoriSDK, entopts map[string]any) core.ShikimoriEntity {
		return entity.NewAnimeEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewShikimoriSDK = core.NewShikimoriSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
