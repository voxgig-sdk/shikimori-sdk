-- Shikimori SDK error

local ShikimoriError = {}
ShikimoriError.__index = ShikimoriError


function ShikimoriError.new(code, msg, ctx)
  local self = setmetatable({}, ShikimoriError)
  self.is_sdk_error = true
  self.sdk = "Shikimori"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function ShikimoriError:error()
  return self.msg
end


function ShikimoriError:__tostring()
  return self.msg
end


return ShikimoriError
