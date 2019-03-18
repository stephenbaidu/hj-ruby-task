require_relative 'load.rb'
require 'json'

class App
  def self.call(_env)
    result = DetectDiscrepancies.call
    JSON.generate(result)
  end
end
