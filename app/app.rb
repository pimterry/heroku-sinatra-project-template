require 'sinatra'

class Comparably < Sinatra::Base
  set :app_file, __FILE__

  configure :development do
    require 'rack'

    Comparably.reset!
    use Rack::Reloader

    enable :dump_errors
    enable :raise_errors
  end

  configure :production do
    require 'newrelic_rpm'
  end

  require_relative 'model/init'

  def initialize(app = nil)
    super(app)
    @graph_model = Model.graph_model
  end

  require_relative './routes/init.rb'
end