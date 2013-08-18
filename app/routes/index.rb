class Comparably < Sinatra::Base
  get '/' do
    "Welcome to Comparably. Model = #{@graph_model.all_nodes}"
  end
end