# Two Sum (CodeWars)
https://www.codewars.com/kata/52c31f8e6605bcc646000082/train/ruby

## Summary
Write a function that takes an array of numbers (integers for the tests) and a target number. It should find two different items in the array that, when added together, give the target value. The indices of these items should then be returned in a tuple / list (depending on your language) like so: (index1, index2).

## My solution
```rb
def two_sum(numbers, target)
  numbers.each_with_index do |number, index|
    second_number = target - number
    next unless numbers.include?(second_number)

    second_index = numbers.rindex(second_number)
    next unless second_index != index

    return [index, second_index]
  end
end

puts two_sum([1, 2, 3], 4).sort == [0, 2]
puts two_sum([1234, 5678, 9012], 14690).sort == [1, 2]
puts two_sum([2, 2, 3], 4).sort == [0, 1]
```

## Favorite Submitted Solutions

```rb
def two_sum(numbers, target)
  pair = numbers.combination(2).find{ |(a,b)| a+b == target }
  [numbers.index(pair[0]), numbers.rindex(pair[1])]
end
```
