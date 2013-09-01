require 'sinatra'
require 'test/unit'
require 'rack/test'

require './app/app'
require_relative './neo_mock'

module FunctionalTests
  class IndexTest < Test::Unit::TestCase
    include Rack::Test::Methods

    def app
      NeoMock::mock_neo_in_model
      Comparably
    end

    def test_index
      get '/'
      assert last_response.ok?
    end
  end
end