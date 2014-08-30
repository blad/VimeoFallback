require 'test/unit'
require 'VimeoFallback'

class VimeoFallbackTest < Test::Unit::TestCase

  def test_getVideo
    videoReq = VimeoFallback.new(104495568)
    assert_equal 200, videoReq.getStatus
    assert_equal true, videoReq.url_status
  end
end
