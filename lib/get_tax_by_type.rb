# frozen_string_literal: true

# lib/get_type_by_type
class GetTaxByType
  ZERO_TAX_PRODUCT_TYPES = ['BOOK', 'FOOD', 'MEDICAL']
  BASIC_TAX_PRODUCT_TYPES = ['GOOD']

  def self.call(product_type)
    return 0.0 if ZERO_TAX_PRODUCT_TYPES.include? product_type

    0.1 if BASIC_TAX_PRODUCT_TYPES.include? product_type
    0.1
  end
end
