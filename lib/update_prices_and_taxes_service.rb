# frozen_string_literal: true

require './lib/get_prices_detail_service'
require 'byebug'

# lib/update_prices_and_taxes_service.rb
class UpdatePricesAndTaxesService
  attr_reader :basket

  def initialize(basket)
    @basket = basket
  end

  def call
    basket_details = details
    taxes = basket_details.inject(0) { |sum, hash| sum + hash[:tax_price] }
    total = basket_details.inject(0) { |sum, hash| sum + hash[:total_line] }
    {
      details: basket_details,
      taxes: taxes,
      total: total
    }
  end

  def details
    updated_details = []
    basket.each do |detail|
      prices_detail = GetPricesDetailService.new(detail).call
      obj = {
        quantity: detail.quantity,
        product_name: update_quantifier(detail.product_name),
        unit_price: detail.unit_price,
        line_price: prices_detail[:line_price],
        tax_price: prices_detail[:tax_price],
        total_line: prices_detail[:total_line]
      }
      updated_details.append(obj)
    end
    updated_details
  end

  def update_quantifier(product_name)
    quantifiers = { 'bottles': 'bottle', 'boxes': 'box' }
    new_product_name = product_name
    quantifiers.each do |quantifier|
      if product_name.include? quantifier[0].to_s
        new_product_name = product_name.gsub(quantifier[0].to_s, quantifier[1])
      end
    end
    new_product_name
  end
end
