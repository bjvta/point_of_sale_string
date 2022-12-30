# frozen_string_literal: true

require './lib/get_prices_detail_service'
require './lib/create_detail_structure_service'

RSpec.describe GetPricesDetailService do
  describe '.call' do
    it 'given a detail data, must return the hash object with 3 new data' do
      detail = CreateDetailStructureService.new('2 book at 12.49').call
      expected_result = {
        quantity: 2, product_name: 'book', unit_price: 12.49,
        line_price: 24.98, tax_price: 0.0, total_line: 24.98
      }
      result = described_class.new(detail).call
      expect(result).to eq(expected_result)
    end
  end
end
