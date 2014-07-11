def roman_to_integer(roman_string)
  #TODO: translate roman string to integer
hash = {
  "I" => 1,
  "V" => 5,
  "X" => 10,
  "L" => 50,
  "C" => 100
}

array_roman_string = roman_string.split('')

total = 0

array_roman_string.each do |l|
  total += hash[l]
end
return total

end

# testing your program
puts roman_to_integer('IV') == 4 # => true
puts roman_to_integer('XII') == 12 # => true
puts roman_to_integer('XIX') == 19 # => true

