require 'net/http'
require 'uri'

class VimeoFallback
  attr_accessor :response
  attr_accessor :url
  attr_accessor :url_status

  def initialize(id)
    @id = id
    getVideoURL(id)
  end

  def getVideoURL(id)
    uri = URI.parse("http://player.vimeo.com/video/#{id}/fallback?noscript")

    req = Net::HTTP::Get.new(uri.path)
    req.add_field("Referer","http://player.vimeo.com/video/#{id}")
    req.add_field("User-Agent","Ruby-2.0.0")

    @response = Net::HTTP.new(uri.hostname, uri.port).start {|http|
        http.request(req)
    }

    if (@response.is_a?(Net::HTTPSuccess))
      processResponse(@response.body)
    else
      @url = "connection error"
    end

    @url
  end

  def getStatus
    @response.code.to_i
  end

  private

  def processResponse(responseBody)
    match = /id=try-link href="(?<url>.*?)"/.match(responseBody)
    if (match != nil)
      @url = "http://player.vimeo.com"+match[:url]
      @url_status = true
    else
      @url = "error occurred"
      @url_status = false
    end
  end
end
