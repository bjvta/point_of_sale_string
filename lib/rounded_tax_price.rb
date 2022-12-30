# frozen_string_literal: true

# lib/rounded_tax_price.rb
class RoundedTaxPrice
  def self.call(number)
    number = (number * 100).round(2)
    return number / 100 if (number % 5).zero?

    rounded = number.round(-1)
    if rounded > number
      rounded.to_f / 100
    else
      (rounded + 5).to_f / 100
    end
  end
end
