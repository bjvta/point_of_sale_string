# frozen_string_literal: true

# lib/get_tax_percentage_service.rb
class GetTaxPercentageService
  def self.call(product_type_tax, is_imported)
    tax_percentage = product_type_tax
    tax_percentage += 0.05 if is_imported

    tax_percentage.round(2)
  end
end
