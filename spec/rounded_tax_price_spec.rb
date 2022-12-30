# frozen_string_literal: true

require './lib/rounded_tax_price'

RSpec.describe RoundedTaxPrice do
  describe '.call' do
    it 'given 19.35, it must return 19.35' do
      given = 19.35
      expected = 19.35
      result = described_class.call(given)
      expect(result).to eq(expected)
    end
    it 'given 19.33, it must return 19.35' do
      given = 19.33
      expected = 19.35
      result = described_class.call(given)
      expect(result).to eq(expected)
    end
    it 'given 19.67, it must return 19.70' do
      given = 19.67
      expected = 19.70
      result = described_class.call(given)
      expect(result).to eq(expected)
    end
    it 'given 19.00, it must return 19.00' do
      given = 19.00
      expected = 19.00
      result = described_class.call(given)
      expect(result).to eq(expected)
    end
  end
end
