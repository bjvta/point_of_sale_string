# frozen_string_literal: true

require './lib/get_product_type_by_name'
require './lib/get_tax_by_type'
require 'byebug'

# lib/create_detail_structure_service.rb
class CreateDetailStructureService
  Detail = Struct.new(:quantity, :product_name, :tax_percentage, :is_imported, :unit_price)
  attr_reader :single_expression, :split_expression

  def initialize(single_expression)
    @single_expression = single_expression
    @split_expression = single_expression.split(' ')
  end

  def call
    Detail.new(quantity, product_name, tax_percentage, imported?, unit_price)
  end

  def quantity
    split_expression[0].to_i
  end

  def product_name
    index_at_at = split_expression.index 'at'
    split_expression[1..index_at_at - 1].join(' ')
  end

  def imported?
    product_name.include? 'imported'
  end

  def product_type
    GetProductTypeByName.call(product_name)
  end

  def tax_percentage
    GetTaxByType.call(product_type)
  end

  def unit_price
    index_at_at = split_expression.index 'at'
    split_expression[index_at_at + 1].to_f
  end
end
