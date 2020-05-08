# frozen_string_literal: true

require_relative 'node.rb'
require_relative 'tree.rb'

puts '1. Create a binary search tree from an array of random numbers'
# random_array = Array.new(15) { rand(1..100) }
# puts "Random Array: #{random_array}"
# tree = Tree.new(random_array)
example_array = [44, 66, 27, 16, 63, 36, 20, 91, 61, 91, 19, 59, 13, 7, 24]
puts "Array: #{example_array}"
tree = Tree.new(example_array)
puts ''
puts '2. Confirm that the tree is balanced by calling `#balanced?`'
puts tree.balanced?
puts ''
puts '3. Print out all elements in level, pre, post, and in order'
puts 'Level Order:'
p tree.level_order
puts 'Pre Order:'
p tree.preorder
puts 'Post Order:'
p tree.postorder
puts 'In Order:'
p tree.inorder
puts ''
puts '4. try to unbalance the tree by adding several numbers > 100'
tree.insert(107)
tree.insert(115)
tree.insert(101)
tree.insert(109)
puts ''
puts '5. Confirm that the tree is unbalanced by calling `#balanced?`'
puts tree.balanced?
puts ''
puts '6. Balance the tree by calling `#rebalance!`'
tree.rebalance!
puts ''
puts '7. Confirm that the tree is balanced by calling `#balanced?`'
puts tree.balanced?
puts ''
puts '8. Print out all elements in level, pre, post, and in order'
puts 'Level Order:'
p tree.level_order
puts 'Pre Order:'
p tree.preorder
puts 'Post Order:'
p tree.postorder
puts 'In Order:'
p tree.inorder

puts '---------------------------------------'
puts 'Node Visualization - data, left & right'
puts '---------------------------------------'
tree.insert(79)
tree.insert(60)
tree.insert(70)
tree_print = tree.print_all
tree_print.each { |node| puts node.to_s }
puts 'Find a number:'
puts tree.find(20)
puts 'Find a number that does not exist:'
puts tree.find(30).nil?
# puts ''
puts 'Delete 63:'
tree.delete(63)
# puts ''
puts 'Delete 61:'
tree.delete(61)
# puts ''
puts 'Delete 16:'
tree.delete(16)
# puts ''
puts 'Delete 17:'
tree.delete(17)
# puts ''
puts tree.find_node(20)
puts '---------------------------------------'
puts 'Node Visualization - data, left & right'
puts '---------------------------------------'
tree_print = tree.print_all
tree_print.each { |node| puts node.to_s }

# Pat yourself on the back! As a super-duper bonus, notice how all the depth-first methods share a similar signature and are basically just a re-arrangement of the same 3 lines… try dynamically declaring the three methods using metaprogamming techniques like #define_method.

# Remove one of the find methods - find_node or find
