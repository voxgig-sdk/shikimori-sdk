# Shikimori SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module ShikimoriFeatures
  def self.make_feature(name)
    case name
    when "base"
      ShikimoriBaseFeature.new
    when "test"
      ShikimoriTestFeature.new
    else
      ShikimoriBaseFeature.new
    end
  end
end
