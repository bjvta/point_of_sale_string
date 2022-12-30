# frozen_string_literal: true

require './lib/create_detail_structure_service'

RSpec.describe CreateDetailStructureService do
  describe '#call' do
    it 'given the string element, should return the struct data' do
      single_expression = '2 book at 12.49'
      result = described_class.new(single_expression).call
      expect(result.quantity).to eq(2)
      expect(result.product_name).to eq('book')
      expect(result.is_imported).to eq(false)
      expect(result.unit_price).to eq(12.49)
      expect(result.tax_percentage).to eq(0.0)
    end
    it 'given a line with imported product' do
      single_expression = '1 imported bottle of perfume at 27.99'
      result = described_class.new(single_expression).call
      expect(result.quantity).to eq(1)
      expect(result.product_name).to eq('imported bottle of perfume')
      expect(result.is_imported).to eq(true)
      expect(result.unit_price).to eq(27.99)
      expect(result.tax_percentage).to eq(0.1)
    end
  end
end
