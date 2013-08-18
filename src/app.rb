require 'sinatra'

configure :development do
  require 'rack'

  Sinatra::Application.reset!
  use Rack::Reloader

  enable :dump_errors
  enable :raise_errors
end

set :app_file, __FILE__

require_relative './routes/init.rb'