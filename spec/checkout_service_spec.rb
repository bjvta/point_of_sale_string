# frozen_string_literal: true

require './lib/checkout_service'

describe CheckoutService do
  describe '.call' do
    it 'given a only products, should return other data' do
      given_data = '2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85'
      expected_result = '2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32'
      result = described_class.new(given_data).call
      expect(result).to eq(expected_result)
      puts('----')
      puts('Input 1:')
      puts('Given data: ', given_data)
      puts('----')
      puts('Excepted data:', result)
      puts('----')
    end
    it 'give imported products, should return the expected data' do
      given_data = '1 imported box of chocolates at 10.00
1 imported bottle of perfume at 47.50'
      expected_result = '1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15'
      result = described_class.new(given_data).call
      expect(result).to eq(expected_result)
      puts('----')
      puts('Input 2:')
      puts('Given data: ', given_data)
      puts('----')
      puts('Excepted data:', result)
      puts('----')
    end
    it 'given mixed products, should return the expected data' do
      given_data = '1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
3 imported boxes of chocolates at 11.25'
      expected_result = '1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported box of chocolates: 35.55
Sales Taxes: 7.90
Total: 98.38'
      result = described_class.new(given_data).call
      expect(result).to eq(expected_result)
      puts('----')
      puts('Input 3:')
      puts('Given data: ', given_data)
      puts('----')
      puts('Excepted data:', result)
      puts('----')
    end
  end
end
