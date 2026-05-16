package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewAchievementEntityFunc func(client *ShikimoriSDK, entopts map[string]any) ShikimoriEntity

var NewAnimeEntityFunc func(client *ShikimoriSDK, entopts map[string]any) ShikimoriEntity

