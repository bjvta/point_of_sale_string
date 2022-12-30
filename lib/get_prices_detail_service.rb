# frozen_string_literal: true

require './lib/get_tax_percentage_service'
require './lib/rounded_tax_price'

# lib/get_prices_detail_service.rb
class GetPricesDetailService
  attr_reader :detail

  def initialize(detail)
    @detail = detail
  end

  def call
    {
      quantity: detail.quantity,
      product_name: detail.product_name,
      unit_price: detail.unit_price,
      line_price: line_price,
      tax_price: tax_price,
      total_line: total_line
    }
  end

  def line_price
    detail.quantity.to_f * detail.unit_price
  end

  def tax_price
    tax_percentage = GetTaxPercentageService.call(detail.tax_percentage, detail.is_imported)
    tax_unit_price = (tax_percentage * detail.unit_price).round(2)
    tax_unit_price_rounded = RoundedTaxPrice.call(tax_unit_price)
    (tax_unit_price_rounded * detail.quantity).round(2)
  end

  def total_line
    (line_price + tax_price).round(2)
  end
end
