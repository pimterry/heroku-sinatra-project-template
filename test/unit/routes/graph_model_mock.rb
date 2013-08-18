require 'mocha/setup'

module UnitTests
  class GraphModelMock
    def self.mock_model_in_(appClass)
      Class.new(appClass) do
        def initialize
          super
          @graph_model = GraphModelMock.new
        end
      end
    end

    def method_missing(m, *args, &block)
      nil
    end
  end
end