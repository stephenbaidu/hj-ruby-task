require 'open-uri'
require 'json'

class RemoteJsonData < ServiceBase
  def initialize(url)
    @url = url
  end

  def call
    response = open(@url).read
    JSON.parse(response)
  end
end
