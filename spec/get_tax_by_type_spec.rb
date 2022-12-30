# frozen_string_literal: true

require './lib/get_tax_by_type'

RSpec.describe GetTaxByType do
  describe '.call' do
    it 'should return 0.0 if product type is BOOK' do
      result = described_class.call('BOOK')
      expected = 0.0
      expect(result).to eq(expected)
    end
    it 'should return 0.0 if product type is FOOD' do
      result = described_class.call('FOOD')
      expected = 0.0
      expect(result).to eq(expected)
    end
    it 'should return 0.0 if product type is MEDICAL' do
      result = described_class.call('MEDICAL')
      expected = 0.0
      expect(result).to eq(expected)
    end
    it 'should return 0.1 if product type is GOOD' do
      result = described_class.call('GOOD')
      expected = 0.1
      expect(result).to eq(expected)
    end
  end
end
