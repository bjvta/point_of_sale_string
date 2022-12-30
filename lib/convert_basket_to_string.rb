# frozen_string_literal: true

# lib/convert_hash_to_string.rb
class ConvertBasketToString
  def self.call(basket)
    details = basket[:details]
    final_string = ''
    details.each do |detail|
      line_2_decimal_places = '%.2f' % detail[:total_line]

      final_string += "#{detail[:quantity]} #{detail[:product_name]}: #{line_2_decimal_places}\n"
    end
    taxes = '%.2f' % basket[:taxes]
    total = '%.2f' % basket[:total]
    final_string += "Sales Taxes: #{taxes}\n"
    final_string += "Total: #{total}"
    final_string
  end
end
