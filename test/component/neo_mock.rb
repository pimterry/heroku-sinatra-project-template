require './app/model/init'
require 'mocha/setup'

module FunctionalTests
  class NeoMock
    def self.mock_neo_in_model
      Model.expects(:neo).returns(NeoMock.new)
    end

    def method_missing(method, *args, &block)
      []
    end
  end
end