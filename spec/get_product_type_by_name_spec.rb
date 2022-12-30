# frozen_string_literal: true

require './lib/get_product_type_by_name'

RSpec.describe GetProductTypeByName do
  describe '.call' do
    it 'given book, must return a BOOK' do
      product_name = 'book'
      expected = 'BOOK'
      result = described_class.call(product_name)
      expect(result).to eq(expected)
    end
    it 'given pills, must return MEDICAL' do
      product_name = 'pill'
      expected = 'MEDICAL'
      result = described_class.call(product_name)
      expect(result).to eq(expected)
    end
    it 'given rice, must return FOOD' do
      product_name = 'rice'
      expected = 'FOOD'
      result = described_class.call(product_name)
      expect(result).to eq(expected)
    end
    it 'given chocolate bar, must return GOOD' do
      product_name = 'chocolate bar'
      expected = 'FOOD'
      result = described_class.call(product_name)
      expect(result).to eq(expected)
    end

    it 'given imported bottle of perfume, must return GOOD' do
      product_name = 'imported bottle of perfume'
      expected = 'GOOD'
      result = described_class.call(product_name)
      expect(result).to eq(expected)
    end
    it 'given packet of headache pills, must return MEDICAL' do
      product_name = 'packet of headache pills'
      expected = 'MEDICAL'
      result = described_class.call(product_name)
      expect(result).to eq(expected)
    end
    it 'given imported boxes of chocolates, must return FOOD' do
      product_name = 'imported boxes of chocolates'
      expected = 'FOOD'
      result = described_class.call(product_name)
      expect(result).to eq(expected)
    end
  end
end
