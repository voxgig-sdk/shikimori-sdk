package = "voxgig-sdk-shikimori"
version = "0.0-1"
source = {
  url = "git://github.com/voxgig-sdk/shikimori-sdk.git"
}
description = {
  summary = "Shikimori SDK for Lua",
  license = "MIT"
}
dependencies = {
  "lua >= 5.3",
  "dkjson >= 2.5",
  "dkjson >= 2.5",
}
build = {
  type = "builtin",
  modules = {
    ["shikimori_sdk"] = "shikimori_sdk.lua",
    ["config"] = "config.lua",
    ["features"] = "features.lua",
  }
}
