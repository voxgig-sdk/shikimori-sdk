package voxgigshikimorisdk

import (
	"github.com/voxgig-sdk/shikimori-sdk/go/core"
	"github.com/voxgig-sdk/shikimori-sdk/go/entity"
	"github.com/voxgig-sdk/shikimori-sdk/go/feature"
	_ "github.com/voxgig-sdk/shikimori-sdk/go/utility"
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

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewShikimoriSDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *ShikimoriSDK  { return NewShikimoriSDK(nil) }
func Test() *ShikimoriSDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
