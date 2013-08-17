require 'sinatra'

get '/' do
  'hi'
end

set :app_file, __FILE__