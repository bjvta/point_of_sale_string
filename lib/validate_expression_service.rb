# frozen_string_literal: true

require './errors/expression_error'

# lib/validate_expression_service.rb
class ValidateExpressionService
  EXPRESSION = /^\d+\s[a-zA-z\s]+.(at)\s\d+.\d*$/.freeze

  def self.call(expression)
    expression_array = expression.split('\n')
    expression_array.each do |single_expression|
      raise ExpressionError, 'Invalid expresion' unless single_expression.match(EXPRESSION)
    end
    true
  end
end
