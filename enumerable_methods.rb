module Enumerable
    def my_each
        for item in self
            yield(item)
        end
    end

    def my_each_with_index
        for index in (0..self.length - 1)
            yield(self[index], index)
        end
    end

    def my_select
        result = []
        my_each do |item|
          result << item if yield(item)
        end
        result
    end

    def my_all?
        result = true
        my_each do |item|
            result = false if !yield(item)
        end
        result
    end

    def my_any?
        result = false
        my_each do |item|
            result = true if yield(item)
        end
        result
    end

    def my_none?
        result = false
        my_each do |item|
            result = true if !yield(item)
        end
        result
    end

    def my_count
        return self.length unless block_given?
        result = 0
        my_each do |item|
            result += 1 if yield(item)
        end
        result
    end

    def my_map proc=nil
            result = []
            self.my_each do |item|
                unless block_given?
                    result << proc.call(item)
                else
                    result << yield(item)
                end
            end
            result
    end

    def my_inject initial=nil
        initial.nil? ? result = self[0] : result = initial
        initial.nil? ? index = 1 : index = 0
        self[index...self.length].my_each do |item|
            result = yield(result, item)
        end
        result
    end

end

def multiply_els array
    array.inject { |result, item| result * item }
end

# puts "my_each vs. each"
# [1,2,3,4,5].my_each  { |item| print item * 2 }
# puts ""
# [1,2,3,4,5].each  { |item| print item * 2 }
# puts ""

# puts "my_each_with_index vs. each_with_index"
# [1,2,3,4,5].my_each_with_index   { |item, index| print [item, index] }
# puts ""
# [1,2,3,4,5].each_with_index  { |item, index| print [item, index] }
# puts ""

# puts "my_select vs. select"
# print [1,2,3,4,5].my_select { |num|  num.even?  }
# puts ""
# print [1,2,3,4,5].select { |num|  num.even?  }
# puts ""

# puts "my_all? vs. all?"
# puts [1,2,3,4,5].my_all? { |num| num < 10 }
# puts [1,2,3,4,5].all? { |num| num < 10 }

# puts "my_any? vs. any?"
# puts [1,2,3,4,5].my_any? { |num| num > 3 }
# puts [1,2,3,4,5].any? { |num| num > 3 }

# puts "my_none? vs. none?"
# puts [1,2,3,4,5].my_none? { |num| num < 10 }
# puts [1,2,3,4,5].none? { |num| num < 10 }

# puts "my_count vs. count"
# puts [1,2,3,4,5].my_count {|x| x % 2 == 0}
# puts [1,2,3,4,5].my_count
# puts [1,2,3,4,5].count {|num| num % 2 == 0}
# puts [1,2,3,4,5].count

# puts "my_map vs. map"
# print [1,2,3,4,5].my_map { |num| num * 2 }
# puts ""
# print [1,2,3,4,5].map { |num| num * 2 }
# puts ""
# puts "my_map with my_proc"
# my_proc = Proc.new {|num| num * 3 } 
# print [1,2,3,4,5].my_map my_proc
# puts ""
# puts "my_map with a block and my_proc"
# print [1,2,3,4,5].my_map {|num| num * 4 }.my_map my_proc
# puts ""

# puts "my_inject vs. inject"
# puts [1,2,3,4,5].my_inject { |sum, num| sum + num }
# puts [1,2,3,4,5].inject { |sum, num| sum + num }
# puts "initial = 2"
# puts [1,2,3,4,5].my_inject(2) { |sum, num| sum + num }
# puts [1,2,3,4,5].inject(2) { |sum, num| sum + num }
# puts "multiplication"
# puts [1,2,3,4,5].my_inject { |sum, num| sum * num }
# puts [1,2,3,4,5].inject { |sum, num| sum * num }
# puts "initial = 2"
# puts [1,2,3,4,5].my_inject(2) { |sum, num| sum * num }
# puts [1,2,3,4,5].inject(2) { |sum, num| sum * num }

# puts "multiply_els"
# puts multiply_els([2,4,5])