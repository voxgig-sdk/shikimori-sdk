# Shikimori SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module ShikimoriFeatures
  def self.make_feature(name)
    case name
    when "base"
      ShikimoriBaseFeature.new
    when "ratelimit"
      ShikimoriRatelimitFeature.new
    when "retry"
      ShikimoriRetryFeature.new
    when "test"
      ShikimoriTestFeature.new
    when "timeout"
      ShikimoriTimeoutFeature.new
    else
      ShikimoriBaseFeature.new
    end
  end
end
