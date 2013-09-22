require 'sinatra'
require 'rack/test'

require './app/app'

module ComponentTests
  describe "The index page" do
    include Rack::Test::Methods

    before(:each) do
      # TODO: Add whatever's required to mock out actual DB accesses in your application
    end

    def app
      UnnamedApp
    end

    it "loads successfully" do
      get '/'
      expect(last_response).to be_ok
    end
  end
end