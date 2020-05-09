# frozen_string_literal: true

require_relative 'node.rb'
require_relative 'tree.rb'

puts '1. Create a binary search tree from an array of random numbers'
random_array = Array.new(15) { rand(1..100) }
puts "Random Array: #{random_array}"
tree = Tree.new(random_array)
puts ''
puts '2. Confirm that the tree is balanced by calling `#balanced?`'
puts tree.balanced?
puts ''
puts '3. Print out all elements in level, pre, post, and in order'
puts 'Level Order:'
p tree.level_order
puts ''
puts 'Pre Order:'
p tree.preorder
puts ''
puts 'Post Order:'
p tree.postorder
puts ''
puts 'In Order:'
p tree.inorder
puts ''
puts '4. Try to unbalance the tree by adding several numbers > 100'
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
puts ''
puts 'Pre Order:'
p tree.preorder
puts ''
puts 'Post Order:'
p tree.postorder
puts ''
puts 'In Order:'
p tree.inorder
puts ''
puts '--------------------------------------------'
puts 'Node List Visualization - data, left & right'
puts '--------------------------------------------'
nodes = tree.node_list
nodes.each { |node| puts node.to_s }
