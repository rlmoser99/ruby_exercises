# frozen_string_literal: true

def merge_sort(array)
  return array if array.length < 2

  middle = (array.length / 2)
  left = merge_sort(array[0..middle - 1])
  right = merge_sort(array[middle..-1])
  merge(left, right)
end

def merge(left, right)
  return right if left.empty?
  return left if right.empty?

  if left[0] < right[0]
    [left[0]] + merge(left[1..-1], right)
  else
    [right[0]] + merge(left, right[1..-1])
  end
end

lost_numbers = [42, 15, 4, 23, 16, 8]
prime_numbers = [11, 31, 3, 19, 37, 5, 29, 13, 2, 17, 41, 7, 23]

p merge_sort(lost_numbers)
p merge_sort(prime_numbers)
