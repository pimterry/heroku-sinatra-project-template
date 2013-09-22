require 'rspec/mocks'
require './app/model/empty_model'

module Model
  describe Model do
    it 'can be created' do
        model = EmptyModel.new()
        expect(model).to_not be_nil
    end
  end
end