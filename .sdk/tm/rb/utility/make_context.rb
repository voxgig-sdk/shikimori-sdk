# Shikimori SDK utility: make_context
require_relative '../core/context'
module ShikimoriUtilities
  MakeContext = ->(ctxmap, basectx) {
    ShikimoriContext.new(ctxmap, basectx)
  }
end
