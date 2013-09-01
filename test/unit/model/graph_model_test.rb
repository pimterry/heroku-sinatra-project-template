require 'rspec/mocks'
require './app/model/graph_model'

module Model
  describe GraphModel do
    it 'can be created with a Neo4J instance' do
        neo = double('neo4j')
        graph_model = GraphModel.new(neo)
        expect(graph_model).to_not be_nil
    end
  end
end