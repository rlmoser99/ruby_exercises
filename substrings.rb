dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings (string, dictionary)
    matches = {}
    dictionary.each do |word|
        if string.downcase.include?(word)
            matches[word] = 1
        end
    end
    puts matches
end

substrings("Below low it sit", dictionary)
# substrings("Howdy partner, sit down! How's it going?", dictionary)