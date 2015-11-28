class Luhn
  attr_accessor :num

  def initialize(num)
    @num = num
  end

  def addends
    digits = num.to_s.chars.map(&:to_i)
    (2..digits.size).each do |i|
      next if i.odd?
      digits[-i] = digits[-i] * 2
      digits[-i] -= 9 if digits[-i] > 9
    end
    digits
  end

  def checksum
    addends.inject(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(num_without_checksum)
    last_digit = 10 - (Luhn.new(num_without_checksum * 10).checksum % 10)
    last_digit = 0 if last_digit == 10
    num_without_checksum * 10 + last_digit
  end
end
