# frozen_string_literal: true

require './lib/create_basket_service'

RSpec.describe CreateBasketService do
  describe '.call' do
    it 'given the line, should return an array with one DetailStructure' do
      expression = '2 book at 12.49'
      result = described_class.call(expression)
      expect(result.count).to eq(1)
    end
    it 'given 2 lines, should return an array with 2 DetailStructure' do
      expression = '2 book at 12.49
1 music CD at 14.99'
      result = described_class.call(expression)
      expect(result.count).to eq(2)
    end
  end
end
