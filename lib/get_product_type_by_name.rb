# frozen_string_literal: true

require 'byebug'

# lib/get_product_type_by_name.rb
class GetProductTypeByName
  PRODUCTS_BY_CATEGORY = {
    BOOK: %w[book news paper],
    FOOD: %w[rice steak meat onion carrot chocolate],
    MEDICAL: ['pill'],
    GOOD: %w[music perfume]
  }.freeze

  def self.call(product_name)
    PRODUCTS_BY_CATEGORY[:BOOK].each do |product|
      return 'BOOK' if product_name.include? product
    end

    PRODUCTS_BY_CATEGORY[:FOOD].each do |product|
      return 'FOOD' if product_name.include? product
    end

    PRODUCTS_BY_CATEGORY[:MEDICAL].each do |product|
      return 'MEDICAL' if product_name.include? product
    end

    PRODUCTS_BY_CATEGORY[:GOOD].each do |product|
      return 'GOOD' if product_name.include? product
    end

    'no registered product type'
  end
end
