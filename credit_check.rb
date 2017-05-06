class LuhnValidator
  def validate(card_number)
    sum = 0
    card_number.to_i.digits.each_with_index do |digit, index|
      index.even? ? sum += digit : sum += double_digit(digit)
    end
      is_legit(sum)
  end

  def double_digit(num)
    double = num * 2
    double = double.digits.reduce(:+) if double > 9
    double
  end

  def is_legit(num)
    num%10 == 0 ? "The number is valid!" : "The number is invalid!"
  end

  def interface()
    while true
      puts "Enter a card number to validate, or enter quit to exit: "
      input = gets.chomp
      break if input.downcase == 'quit'
      puts validate(input)
    end
  end
end

validator = LuhnValidator.new
validator.interface
