require 'sinatra'
require 'rack/test'

require './app/app'
require_relative './neo_double'

module ComponentTests
  describe "The index page" do
    include Rack::Test::Methods

    before(:each) do
      NeoDouble::inject_neo_double_in_model
    end

    def app
      Comparably
    end

    it "loads successfully" do
      get '/'
      expect(last_response).to be_ok
    end
  end
end