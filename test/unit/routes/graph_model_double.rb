module Routes
  class GraphModelDouble
    def self.extend_to_inject_double(appClass)
      # Extend the app constructor to override the graph_model var
      # with an instance of GraphModelDouble
      Class.new(appClass) do
        def initialize
          super
          @graph_model = GraphModelDouble.new
        end
      end
    end

    def method_missing(m, *args, &block)
      nil
    end
  end
end