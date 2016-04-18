class Fixnum
  Fixnum::VERSION = 1

  ROMAN_NUMERAL = {
    1 =>"I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M"
  }

  def to_roman
    if ROMAN_NUMERAL.keys.include?(self)
      return ROMAN_NUMERAL[self]
    end

    roman  = ""
    divisor = closest_roman
    quotient = self / divisor
    quotient.times do
      roman.concat(ROMAN_NUMERAL[divisor])
    end

    remainder = self - (quotient * divisor)
    roman.concat(remainder.to_roman) unless remainder == 0
    roman
  end

  def closest_roman
    divisor = 0
    ROMAN_NUMERAL.keys.each do |key|
      divisor = key if self/key > 0
    end
    divisor
  end
end