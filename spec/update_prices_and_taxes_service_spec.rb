# frozen_string_literal: true

require './lib/update_prices_and_taxes_service'
require './lib/create_detail_structure_service'

RSpec.describe UpdatePricesAndTaxesService do
  describe '#call' do
    it 'given a complete basket with one item, must return other basket with taxes and total' do
      basket = [CreateDetailStructureService.new('2 book at 12.49').call]
      result = described_class.new(basket).call
      expected_result = {
        details: [{ quantity: 2,
                    product_name: 'book',
                    unit_price: 12.49,
                    line_price: 24.98,
                    tax_price: 0.0,
                    total_line: 24.98 }],
        taxes: 0.0,
        total: 24.98
      }
      expect(result).to eq(expected_result)
    end
    it 'given a complete basket with one item with data' do
      basket = [CreateDetailStructureService.new('1 music CD at 14.99').call]
      result = described_class.new(basket).call
      expected_result = {
        details: [{ quantity: 1,
                    product_name: 'music CD',
                    unit_price: 14.99,
                    line_price: 14.99,
                    tax_price: 1.50,
                    total_line: 16.49 }],
        taxes: 1.50,
        total: 16.49
      }
      expect(result).to eq(expected_result)
    end

    it 'given a complete basket with two items with data' do
      basket = [CreateDetailStructureService.new('2 book at 12.49').call,
                CreateDetailStructureService.new('1 music CD at 14.99').call]
      result = described_class.new(basket).call
      expected_result = {
        details: [{ quantity: 2,
                    product_name: 'book',
                    unit_price: 12.49,
                    line_price: 24.98,
                    tax_price: 0.0,
                    total_line: 24.98 },
                  { quantity: 1,
                    product_name: 'music CD',
                    unit_price: 14.99,
                    line_price: 14.99,
                    tax_price: 1.50,
                    total_line: 16.49 }],
        taxes: 1.50,
        total: 41.47
      }
      expect(result).to eq(expected_result)
    end

    it 'given a complete basket with two items with data' do
      basket = [CreateDetailStructureService.new('2 book at 12.49').call,
                CreateDetailStructureService.new('1 music CD at 14.99').call,
                CreateDetailStructureService.new('1 chocolate bar at 0.85').call]
      result = described_class.new(basket).call
      expected_result = {
        details: [{ quantity: 2,
                    product_name: 'book',
                    unit_price: 12.49,
                    line_price: 24.98,
                    tax_price: 0.0,
                    total_line: 24.98 },
                  { quantity: 1,
                    product_name: 'music CD',
                    unit_price: 14.99,
                    line_price: 14.99,
                    tax_price: 1.50,
                    total_line: 16.49 },
                  { quantity: 1,
                    product_name: 'chocolate bar',
                    unit_price: 0.85,
                    line_price: 0.85,
                    tax_price: 0.0,
                    total_line: 0.85 }],
        taxes: 1.50,
        total: 42.32
      }
      expect(result).to eq(expected_result)
    end
    it 'given a specific kind of taxes for chocolates' do
      basket = [CreateDetailStructureService.new('3 imported boxes of chocolates at 11.25').call]
      result = described_class.new(basket).call
      expected_result = {
        details: [{ quantity: 3,
                    product_name: 'imported box of chocolates',
                    unit_price: 11.25,
                    line_price: 33.75,
                    tax_price: 1.80,
                    total_line: 35.55 }],
        taxes: 1.80,
        total: 35.55
      }
      expect(result).to eq(expected_result)
    end
  end
  describe '#update_quantifier' do
    it 'update quantifier from bottles to bottle' do
      given = 'imported bottles of perfume'
      expected = 'imported bottle of perfume'
      result = described_class.new(nil).update_quantifier(given)
      expect(result).to eq(expected)
    end
    it 'update quantifier from boxes to box' do
      given = 'imported boxes of chocolates'
      expected = 'imported box of chocolates'
      result = described_class.new(nil).update_quantifier(given)
      expect(result).to eq(expected)
    end
  end
end
