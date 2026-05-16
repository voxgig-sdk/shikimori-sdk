# Shikimori SDK exists test

require "minitest/autorun"
require_relative "../Shikimori_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = ShikimoriSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
