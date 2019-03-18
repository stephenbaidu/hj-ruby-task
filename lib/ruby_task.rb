require 'thin'
require_relative 'app'

app = lambda do |env|
  [200, { 'Content-Type' => 'application/json' }, App.call(env)]
end

Rack::Handler::Thin.run app
