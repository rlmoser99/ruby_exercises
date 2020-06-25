# frozen_string_literal: true

# Use iteration. Takes in a number and returns that many numbers of the fibonacci result.
def fibs(number)
  return 0 if number <= 1

  result = [0, 1]
  until result.length == number
    next_number = result[-1] + result[-2]
    result << next_number
  end
  result
end
puts fibs(11).join(' ')

# Now write another method, to solves the same problem as above recursively.
def fibs_rec(number)
  return [0] if number == 1
  return [0, 1] if number == 2

  result = fibs_rec(number - 1)
  result << result[-1] + result[-2]
end
puts fibs_rec(11).join(' ')

# Bonus: 2-line recursive solution.
def fibonacci(num)
  return [0, 1][0..num - 1] if num <= 2

  fibonacci(num - 1) << fibonacci(num - 1)[-1] + fibonacci(num - 1)[-2]
end
puts fibonacci(11).join(' ')

# Bonus: 1-line recursive solution, but it just provides the nth digit
def fib_digit(n)
  n == 1 || n == 2 ? n - 1 : fib_digit(n - 1) + fib_digit(n - 2)
end
puts fib_digit(11)
