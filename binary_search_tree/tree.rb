# frozen_string_literal: true

class Tree
  def initialize(array)
    result = array.sort.uniq
    puts "Tree will be built with: #{result}"
    @root = build_tree(array)
    # puts "@root is #{@root}"
  end

  def build_tree(array)
    return if array.empty?
    return Node.new(array[0]) if array.length <= 1

    middle = array.length / 2
    root = Node.new(array[middle])
    root.left = build_tree(array[0...middle])
    root.right = build_tree(array[middle + 1..-1])
    root
  end

  def print_all(current = @root, queue = [], result = [])
    # puts 'At the start of the method:'
    # puts "current is #{current}"
    # puts "queue is #{queue}"
    # puts "result is #{result}"
    # puts ''

    # node = [current.data, current.left.data, current.right.data]
    return result if current.nil?

    node = [current.data]
    unless current.left.nil?
      node << "L: #{current.left.data}"
      queue << current.left
    end
    unless current.right.nil?
      node << "R: #{current.right.data}"
      queue << current.right
    end
    # puts "node is [node, left, right] = #{node}"
    result << node
    # puts "result is #{result}"
    # puts "queue is #{queue}"
    # return if queue.empty?

    queue.shift unless result.length == 1
    print_all(current = queue[0], queue, result)
  end
end
