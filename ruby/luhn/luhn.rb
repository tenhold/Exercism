module Luhn
  def self.doubled(number)
    double = number * 2

    double > 9 ? double - 9 : double
  end

  def self.valid?(credit_card)
    credit_card.gsub!(/\s/, '')

    return false if credit_card.length == 1 || !credit_card.match?(/^[0-9]*$/)

    sum = 0
    i = credit_card.length
    other_digit = false
    loop do
      i -= 1

      product = credit_card[i].to_i
      sum += other_digit ? doubled(product) : product

      other_digit = !other_digit
      break if i == 0
    end
    sum % 10 == 0
  end
end
