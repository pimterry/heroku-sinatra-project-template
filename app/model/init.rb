require 'neography'
require_relative 'graph_model'

module Model
  def graph_model
    GraphModel.new(neo)
  end

  def neo
    neo4j_url = ENV['NEO4J_URL'].to_s
    Neography::Rest.new(neo4j_url)
  end

  extend self
end