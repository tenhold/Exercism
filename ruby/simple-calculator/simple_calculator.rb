class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)
    raise ArgumentError if first_operand.is_a?(String) || second_operand.is_a?(String)

    begin
      raise DivisonError if operation == "/" && (second_operand == 0 || first_operand == 0)

      if ALLOWED_OPERATIONS.include?(operation)
        result = first_operand.public_send(operation, second_operand)
        return "#{first_operand} #{operation} #{second_operand} = #{result}"
      end

    rescue => e
      e.message
    end
  end

  class UnsupportedOperation < StandardError; end
end

class DivisonError < StandardError
  def message
    'Division by zero is not allowed.'
  end
end
