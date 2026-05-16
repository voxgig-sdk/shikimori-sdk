# Shikimori SDK utility: feature_add
module ShikimoriUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
