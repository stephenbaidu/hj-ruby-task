require 'json'

class App
  def self.call(_env)
    JSON.generate([{ test: 'Test' }])
  end
end
