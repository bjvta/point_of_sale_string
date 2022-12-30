# frozen_string_literal: true

require './lib/validate_expression_service'
require './lib/create_basket_service'
require './lib/update_prices_and_taxes_service'
require './lib/convert_basket_to_string'

# lib/checkout_service.rb
class CheckoutService
  attr_reader :basket_expression

  def initialize(basket_expression)
    @basket_expression = basket_expression
  end

  def call
    ValidateExpressionService.call(basket_expression)
    basket_structure = CreateBasketService.call(basket_expression)
    basket_with_taxes_and_total = UpdatePricesAndTaxesService.new(basket_structure).call
    ConvertBasketToString.call(basket_with_taxes_and_total)
  end
end
