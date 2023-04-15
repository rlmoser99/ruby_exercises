def find_even_index(array)
  array.each_with_index do |number, index|
    return index if array[0...index].sum == array[index + 1..-1].sum

    return -1 if index == array.size - 1
  end
end

puts find_even_index([1,2,3,4,3,2,1]) == 3
puts find_even_index([1,100,50,-51,1,1]) == 1
puts find_even_index([1,2,3,4,5,6]) == -1
puts find_even_index([20,10,30,10,10,15,35]) == 3
puts find_even_index([20,10,-80,10,10,15,35]) == 0
puts find_even_index([10,-80,10,10,15,35,20]) == 6
puts find_even_index(Array(1..100)) == -1
puts find_even_index([0,0,0,0,0]) == 0
puts find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
puts find_even_index(Array(-100..-1)) == -1