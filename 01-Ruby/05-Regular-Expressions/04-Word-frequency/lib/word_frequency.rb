def most_common_words(file_name, stop_words_file_name, number_of_word)
  #TODO: return hash of occurences of number_of_word most frequent words

  array_adword = []
  File.open(stop_words_file_name, "r").each_line do |line|
    array_adword += line.scan(/\b[\w']+\b/)
  end

  array = []
  hash = Hash.new(0)
  File.open(file_name, "r").each_line do |line|
    array += line.scan(/\b\w+\b/)
    array_result =  array - array_adword - array_adword.map{|word| word.upcase}
    array_result.each { |word| hash[word.downcase] += 1 }
  end

  return Hash[hash.sort_by{|word, number| -number}.first(number_of_word)]

end

#puts most_common_words('lib/source-text.txt', "stop_words.txt",3)
