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

array_roman_string.each_with_index do |l, index|
  if array_roman_string[index+1] != nil
    if hash[array_roman_string[index+1]] > hash[array_roman_string[index]]
      total -= hash[l]
    else
      total += hash[l]
    end
  else
    total += hash[l]
  end
end

return total

end

# testing your program
puts roman_to_integer('IV') == 4 # => true
puts roman_to_integer('XII') == 12 # => true
puts roman_to_integer('XIX') == 19 # => true

