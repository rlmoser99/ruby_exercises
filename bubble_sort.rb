def bubble_sort array
    unsorted = true
    while unsorted do
        i = 0
        unsorted = false
        while i < (array.length - 1)
            if array[i] > array[i + 1]
                array[i], array[i + 1] = array[i + 1], array[i]
                unsorted = true
            end
            i += 1
        end
    end
    print array    
end

bubble_sort([4,3,78,2,0,2])
puts ""
# => [0,2,2,3,4,78]

def bubble_sort_by array
    unsorted = true
    while unsorted do
        i = 0
        unsorted = false
        while i < (array.length - 1)
            # If statement that yields to the block of code to calculate the difference of left.length & right.length
            if (yield array[i], array[i + 1]).to_i >= 0
                # If difference >= 0, then second word is shorter and needs to switch places
                array[i], array[i + 1] = array[i + 1], array[i]
                unsorted = true
            end
            i += 1
        end
    end
    print array
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
    left.length - right.length
end
puts ""
# => ["hi", "hey", "hello"]

def bubble_sort_by_explanation array
    puts "The beginning order of the array: #{array}"
    puts ""
    unsorted = true
    while unsorted do
        i = 0
        unsorted = false
        while i < (array.length - 1)
            puts "Yield to calculate the difference of #{array[i]}.length - #{array[i + 1]}.length"
            difference = (yield array[i], array[i + 1]).to_i
            puts "The difference is #{difference}."
            puts "If is < 0 the order second word is longer and nothing changes"
            if (difference >= 0)
                puts "BUT IF THE DIFFERENCE >= 0 the order second word is shorter & needs to be switched!"
                puts "This next line switches the words #{array[i]} and #{array[i + 1]}"
                array[i], array[i + 1] = array[i + 1], array[i]
                unsorted = true
            end
            i += 1
            puts "#{array} is the current array in while loop"
            puts ""
        end
    end
    puts "The ending order of the array: #{array}"
end

puts ""
puts "EXPLANATION:"
bubble_sort_by_explanation(["labrador", "pug", "beagle"]) do |left,right|
    puts "Calculate the difference of #{left}.length - #{right}.length"
    left.length - right.length
end
puts ""
# => ["pug", "beagle", "labrador"]