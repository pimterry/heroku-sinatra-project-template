require 'sinatra'
require 'test/unit'
require 'rack/test'

require './src/routes/index'

class IndexTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    assert last_response.ok?
  end
end