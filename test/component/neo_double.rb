require './app/model/init'
require 'rspec'
require 'rspec/mocks'

module ComponentTests
  class NeoDouble
    def self.inject_neo_double_in_model
      Model.stub(:neo) { NeoDouble.new }
    end

    def method_missing(method, *args, &block)
      []
    end
  end
end