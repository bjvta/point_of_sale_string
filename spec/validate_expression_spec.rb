# frozen_string_literal: true

require './lib/validate_expression_service'
require './errors/expression_error'


RSpec.describe ValidateExpressionService do
  describe '.call' do
    it 'must do true if the expression is good' do
      expression = '2 book at 12.49'
      result = described_class.call(expression)
      expect(result).to be_truthy
    end

    it 'must raise the ExpresionError if it is not valid' do
      expression = 'book 2 12.49'
      expect do
        described_class.call(expression)
      end.to raise_error(ExpressionError)
    end

    it 'must return true if we have two expressions' do
      expression = '2 book at 12.49
1 music CD at 14.99'
      result = described_class.call(expression)
      expect(result).to be_truthy
    end

    it 'must return true if we have 3 expressions' do
      expression = '2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85'
      result = described_class.call(expression)
      expect(result).to be_truthy
    end
  end
end
