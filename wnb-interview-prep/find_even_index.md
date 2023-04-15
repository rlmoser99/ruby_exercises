# Find Even Index (CodeWars)
https://www.codewars.com/kata/5679aa472b8f57fb8c000047/train/ruby

## Summary
You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

For example:
Let's say you are given the array {1,2,3,4,3,2,1}:
Your function will return the index 3, because at the 3rd position of the array, the sum of left side of the index ({1,2,3}) and the sum of the right side of the index ({3,2,1}) both equal 6.

## My solution
```rb
def find_even_index(array)
  array.each_with_index do |number, index|
    # After installing rubocop, I learned something cool.
    # For the second half of the array, you don't need -1 for the range
    # return index if array[0...index].sum == array[index + 1..].sum
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
```

## Favorite Submitted Solutions

```rb
# I did not need to use each_with_index
def find_even_index(arr)
  arr.each_index { |i| return i if arr[0...i].sum == arr[(i + 1)..-1].sum }
  -1
end

# I did not need to explictly return -1 inside the each_with_index
def find_even_index(array)
  array.each_with_index do |number, index|
    return index if array[0...index].sum == array[index + 1..-1].sum
  end
  -1
end
```
