# Encoding: utf-8

def louchebemize(sentence)
  #TODO: implement your louche["em", "é", "ji", "oc", "ic", "uche", "ès"]bem translator
  sentence_d = sentence.downcase
  sentence_1 = sentence_d.gsub(/'/," ")
  sentence_2 = sentence_1.gsub(/!!/,"")
  words = sentence_2.split(" ")

  translated_words = words.map { |word| louchebime_word(word) }
  resultat = translated_words.join(" ")
#sentence.split(/\b/).map {|el| el.match(/\W+/) ? "#{el}yo" : el}.join()

  return resultat
end

def louchebime_word(word)
  voyels = %w(a e i o u y)
  consonents = ("a".."z").to_a - voyels
  suffixes = ["em", "é", "ji", "oc", "ic", "uche", "ès"]

    if word.length == 1
      translated_words = word
    elsif voyels.include? word[0]
      translated_words = "l#{word}#{suffixes.sample}"
    elsif consonents.include? word[1]
      translated_words = "l#{word[2..-1]}#{word[0]}#{word[1]}#{suffixes.sample}"
    else
      translated_words = "l#{word[1..-1]}#{word[0]}#{suffixes.sample}"
  end
end

puts louchebemize("chat, fou!!")