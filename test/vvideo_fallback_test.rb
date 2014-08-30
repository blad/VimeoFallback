require 'test/unit'
require 'vvideo_fallback'

class Vvideo_fallbackTest < Test::Unit::TestCase

  def test_getVideo
    videoReq = Vvideo_fallback.new(104495568)
    assert_equal 200, videoReq.getStatus
  end

  def test_getVideo
    xyz = Vvideo_fallback.new(104495568)
    assert_equal true, xyz.url_status
  end
end
