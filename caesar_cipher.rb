def caesar_cipher(message, shift)
    message.split('').each do |letter|
        puts letter.ord
    end
    puts shift
end

caesar_cipher("AZaz", 1)
# caesar_cipher("What a string!", 5) 
# "Bmfy f xywnsl!"
# a = 97
# z = 122
# A = 65
# Z = 90