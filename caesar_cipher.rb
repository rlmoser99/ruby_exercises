def caesar_cipher(message, shift)
    result = ""
    message.each_char do |char|
        # Modifies Uppercase
        if char.ord >= 65 && char.ord <= 90
            rotation = (((char.ord - 65) + shift) % 26) + 65
            result += rotation.chr
        # Modifies Lowercase
        elsif char.ord >= 97 && char.ord <= 122
            rotation = (((char.ord - 97) + shift) % 26) + 97
            result += rotation.chr
        # Keeps spaces & punctuation
        else
            result += char
        end
    end
    puts result
end

caesar_cipher("What a string!", 5)