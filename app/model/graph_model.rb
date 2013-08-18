module Model
  class GraphModel
    def initialize(neo)
      @neo = neo
    end

    def all_nodes
      @neo.execute_query("start n=node(*) return n")
    end

    def to_s
      "graphs!"
    end
  end
end