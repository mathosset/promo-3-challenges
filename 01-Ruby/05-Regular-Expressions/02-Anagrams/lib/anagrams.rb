def anagrams?(a_string, another_string)
  #TODO: implement the obvious method to test if two words are anagrams

  if a_string.downcase.scan(/\w/).sort == another_string.downcase.scan(/\w/).sort
    return true
  else
    return false
  end

end

def anagrams_on_steroids?(a_string, another_string)
  #TODO: implement the improved method

  hash_a_string = Hash.new
  array_a_string = a_string.downcase.scan(/\w/)
  array_a_string.each { |letter| hash_a_string[letter] = array_a_string.count(letter) }

  hash_another_string = Hash.new
  array_another_string = another_string.downcase.scan(/\w/)
  array_another_string.each { |letter| hash_another_string[letter] = array_another_string.count(letter) }

  hash_a_string == hash_another_string

end
