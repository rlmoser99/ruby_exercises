def bubble_sort array
    i = 0
    while i < (array.length - 1)
        puts array[i]
        if array[i] > array[i + 1]
            array[i], array[i + 1] = array[i + 1], array[i]
        end
        i += 1
        print array
        puts ""
    end
    array
    puts ""
end

print bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]