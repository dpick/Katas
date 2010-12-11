require 'pp'

class Roman
  attr_accessor :conversions

  def initialize(convert)
    @conversions = convert
    @keys = convert.keys.sort { |a, b| b <=> a }
  end

  def next_smallest_value(val)
    @keys.each do |key|
      return key if key <= val
    end
  end

  def convert(val, roman_value = "")
    return roman_value if val == 0

    roman_value << @conversions[next_smallest_value(val)]

    convert(val - next_smallest_value(val), roman_value)
  end
end
