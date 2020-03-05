module Enumerable
    def my_each
        for item in self
            yield(item)
        end
        self
    end
end

puts "my_each vs. each"
[1,2,3,4,5].my_each  { |item| print item * 2 }
puts ""
[1,2,3,4,5].each  { |item| print item * 2 }
puts ""