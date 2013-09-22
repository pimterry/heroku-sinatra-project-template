require 'sinatra'
require 'rack/test'

require './app/routes/index'

module Routes
  describe 'The index route' do
    include Rack::Test::Methods

    def app
      UnnamedApp
    end

    it "loads successfully" do
      get '/'
      expect(last_response).to be_ok
    end
  end
end