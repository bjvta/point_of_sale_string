# frozen_string_literal: true

require './lib/convert_basket_to_string'

RSpec.describe ConvertBasketToString do
  describe '.call' do
    it 'given the structure data, return the string' do
      basket = {
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
      expected_result = '2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32'
      result = described_class.call(basket)
      expect(result).to eq(expected_result)
    end
  end
end
