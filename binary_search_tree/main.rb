# frozen_string_literal: true

require_relative 'node.rb'
require_relative 'tree.rb'

test_array = [3, 2, 5, 4, 7, 6]
puts "Array: #{test_array}"
tree = Tree.new(test_array)
tree_print = tree.print_all
tree_print.each { |node| puts node.to_s }

# As a bonus in Node class, try including the Comparable module and make nodes compare using their data attribute.

# Write an #insert and #delete method which accepts a value to insert/delete (you’ll have to deal with several cases for delete such as when a node has children or not).

# Write a #find method which accepts a value and returns the node with the given value.

# Write a #level_order method which accepts a block. The method should traverse the tree in breadth-first level order and yield each node to the provided block. This method can be implemented using either iteration or recursion (try implementing both!). As a bonus, make the method return an array of values if no block is given. Tip: You will want to use an array acting as a queue to keep track of all the child nodes that you have yet to traverse and to add new ones to the list (as you saw in the video).

# Write #inorder, #preorder, and #postorder methods which accept a block. Each method should traverse the tree in their respective depth-first order and yield each node to the provided block. As a bonus, make the method return an array of values if no block is given.

# Write a #depth method which accepts a node and returns the depth(number of levels) beneath the node.

# Write a #balanced? method which checks if the tree is balanced. A balanced tree is one where the difference between heights of left subtree and right subtree is not more than 1.

# Write a #rebalance! method which rebalances an unbalanced tree. Tip: You’ll want to create a level-order array of the tree before passing the array back into the #build_tree method.

# Write a simple driver script that does the following:
# 1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
# 2. Confirm that the tree is balanced by calling `#balanced?`
# 3. Print out all elements in level, pre, post, and in order
# 4. try to unbalance the tree by adding several numbers > 100
# 5. Confirm that the tree is unbalanced by calling `#balanced?`
# 6. Balance the tree by calling `#rebalance!`
# 7. Confirm that the tree is balanced by calling `#balanced?`
# 8. Print out all elements in level, pre, post, and in order

# Pat yourself on the back! As a super-duper bonus, notice how all the depth-first methods share a similar signature and are basically just a re-arrangement of the same 3 lines… try dynamically declaring the three methods using metaprogamming techniques like #define_method.