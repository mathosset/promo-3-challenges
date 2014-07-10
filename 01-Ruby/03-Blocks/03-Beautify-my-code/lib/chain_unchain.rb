def shuffle_word(a_word)
  #TODO: refactor this method

  a_word.upcase.chars.to_a.shuffle
# chars_enum = cap_word.chars
# array = chars_enum.to_a
# shuffle_array = array.shuffle
#shuffle_array

end


def quote_prime_numbers(n)
  #TODO: refactor this method

  #(1..n).find_all {|i| (2..i-1).select {|k| i % k == 0 }.count == 0 }.map{ |prime_num| "#{prime_num} is prime"}
 (1..n).find_all do |i|
  tab_1 = (2..i-1)
  result = tab_1.select {|k| i % k == 0 }
  result_2 = result.count(0)
  result_2.map{ |prime_num| "#{prime_num} is prime"}
  end
end
