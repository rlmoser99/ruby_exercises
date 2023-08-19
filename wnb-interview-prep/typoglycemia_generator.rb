# Typoglycemia Generator

# def scramble_words(words)
#   symbols = ['-', "'", ',', '.']
#   words_array = words.split(' ')
#   # phrase = ''
#   phrase = words_array.map do |word|
#     middle = word[1..-2].split(//).reject { |letter| symbols.include?(letter) }.sort
#     # p middle
#     word_array = word.split(//)
#     result = ''
#     word_array.each_with_index do |letter, index|
#       if index.zero? || index == word_array.length - 1 || symbols.include?(letter) || (result.length == 1 && symbols.include?(result[0]))
#         result << letter
#       else
#         result << middle.shift
#       end
#       # puts "middle: #{middle} and result: #{result}"
#     end
#     result
#   end
#   phrase.join(' ')
# end

# def scramble_words(words)
#   symbols = ['-', "'", ',', '.']
#   words_array = words.split(' ')
#   phrase = words_array.map do |word|
#     skeleton_word = word.split(//).map { |letter| symbols.include?(letter) ? letter : '' }
#     first_letter_index = skeleton_word.index('')
#     last_letter_index = skeleton_word.length - skeleton_word.reverse.index('') - 1
#     middle = word[(first_letter_index + 1)..(last_letter_index - 1)].split(//).reject { |letter| symbols.include?(letter) }.sort
#     word_array = word.split(//)
#     result = ''
#     skeleton_word.each_with_index do |letter, index|
#       if index == first_letter_index || index == last_letter_index
#         result << word_array[index]
#       elsif letter == ''
#         result << middle.shift
#       else
#         result << letter
#       end
#     end
#     result
#   end
#   phrase.join(' ')
# end

# SOLUTION TO SEND TO CAROLINE
# def scramble_words(words)
#   symbols = ['-', "'", ',', '.']
#   words_array = words.split(' ')
#   phrase = words_array.map do |word|
#     skeleton_word = word.split(//).map { |letter| symbols.include?(letter) ? letter : '' }
#     first_letter_index = skeleton_word.index('')
#     last_letter_index = skeleton_word.length - skeleton_word.reverse.index('') - 1
#     middle = word[(first_letter_index + 1)..(last_letter_index - 1)].split(//).reject { |letter| symbols.include?(letter) }.sort
#     word_array = word.split(//)
#     result = ''
#     skeleton_word.each_with_index do |letter, index|
#       if index == first_letter_index || index == last_letter_index
#         result << word_array[index]
#       elsif letter == ''
#         result << middle.shift
#       else
#         result << letter
#       end
#     end
#     result
#   end
#   phrase.join(' ')
# end

# def scramble_words(words)
#   words_array = words.split(' ')
#   phrase = words_array.map do |word|
#     skeleton_word = word.gsub(/[a-z]/, '?').split(//)
#     first_letter_index = skeleton_word.index('?')
#     last_letter_index = skeleton_word.length - skeleton_word.reverse.index('?') - 1
#     middle_letters = word[(first_letter_index + 1)..(last_letter_index - 1)].gsub(/[-.,']/, '').split(//).sort!
#     result = ''
#     # map.with_index
#     skeleton_word.each_with_index do |letter, index|
#       if index == first_letter_index || index == last_letter_index
#         result << word[index]
#       elsif letter == '?'
#         result << middle_letters.shift
#       else
#         result << letter
#       end
#     end
#     result
#   end
#   phrase.join(' ')
# end

def scramble_words(words)
  words_array = words.split(' ')
  phrase = words_array.map do |word|
    skeleton_word = word.gsub(/[a-z]/, '?').split(//)
    first_letter_index = skeleton_word.index('?')
    last_letter_index = skeleton_word.length - skeleton_word.reverse.index('?') - 1
    middle_letters = word[(first_letter_index + 1)..(last_letter_index - 1)].gsub(/[-.,']/, '').split(//).sort!
    skeleton_word[first_letter_index] = word[first_letter_index]
    skeleton_word[last_letter_index] = word[last_letter_index]
    skeleton_word.map do |letter|
      letter == '?' ? middle_letters.shift : letter
    end.join('')
  end
  phrase.join(' ')
end

puts scramble_words('ruby ruby-on-rails') == 'rbuy rabi-ln-oruys'
puts scramble_words('professionals') == 'paefilnoorsss'
puts scramble_words('i') == 'i'
puts scramble_words('') == ''
puts scramble_words('me') == 'me'
puts scramble_words('you') == 'you'
puts scramble_words('card-carrying') == 'caac-dinrrryg'
puts scramble_words("shan't") == "sahn't"
puts scramble_words('-dcba') == '-dbca'
puts scramble_words('dcba.') == 'dbca.'
puts scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."