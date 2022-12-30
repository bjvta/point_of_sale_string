# frozen_string_literal: true

require './lib/create_detail_structure_service'

# lib/create_basket_service.rb
class CreateBasketService
  def self.call(expression)
    expression_array = expression.split("\n")
    basket = []
    expression_array.each do |single_expression|
      detail = CreateDetailStructureService.new(single_expression).call
      basket.append(detail)
    end
    basket
  end
end
