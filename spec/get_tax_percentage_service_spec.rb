# frozen_string_literal: true

require './lib/get_tax_percentage_service'

RSpec.describe GetTaxPercentageService do
  describe '.call' do
    it 'given a book and it is not imported' do
      product_type_tax = 0.0
      is_imported = false
      expected_result = 0.00
      result = described_class.call(product_type_tax, is_imported)
      expect(result).to eq(expected_result)
    end
    it 'given a music CD and it is not imported' do
      product_type_tax = 0.1
      is_imported = false
      expected_result = 0.10
      result = described_class.call(product_type_tax, is_imported)
      expect(result).to eq(expected_result)
    end
    it 'given a book and it is imported' do
      product_type_tax = 0.0
      is_imported = true
      expected_result = 0.05
      result = described_class.call(product_type_tax, is_imported)
      expect(result).to eq(expected_result)
    end
  end
end
