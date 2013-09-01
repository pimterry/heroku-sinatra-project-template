require 'sinatra'
require 'rack/test'

require './app/routes/index'
require_relative './graph_model_double'

module Routes
  describe 'The index route' do
    include Rack::Test::Methods

    def app
      GraphModelDouble::extend_to_inject_double(Comparably)
    end

    it "loads successfully" do
      get '/'
      expect(last_response).to be_ok
    end
  end
end