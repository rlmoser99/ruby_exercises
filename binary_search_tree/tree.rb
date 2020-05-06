# frozen_string_literal: true

class Tree
  def initialize(array)
    result = array.sort.uniq
    @root = build_tree(result)
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

  def balanced?
    (depth(@root.left) - depth(@root.right)).abs <= 1
  end

  def print_all(current = @root, queue = [], result = [])
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
    result << node
    queue.shift unless result.length == 1
    print_all(queue[0], queue, result)
  end

  def insert(value, node = @root)
    # puts "value is #{value} and node is #{node}"
    return if node == value

    insert_left(value, node) if node.data > value
    insert_right(value, node) if node.data < value
  end

  def delete(value)
    return nil if find(value).nil?

    parent_node = find_parent(value)
    puts "Parent of #{value} is #{parent_node}"
    if find(value).left.nil? && find(value).right.nil?
      delete_leaf_node(parent_node, value)
    elsif find(value).left.nil? || find(value).right.nil?
      puts 'This deleted node has left or right'
    else
      puts 'This deleted node both a left & right'
    end
    # if there two nodes
    # Node to be deleted has two children: Find inorder successor of the node. Copy contents of the inorder successor to the node and delete the inorder successor. Note that inorder predecessor can also be used.
    # if there is one node it becomes node at old level
  end

  def find(value, current = @root)
    return nil if current.nil?
    return current if current.data == value

    current.data > value ? find(value, current.left) : find(value, current.right)
  end

  private

  def depth(node, current_depth = 0)
    return current_depth if node.nil?
    return current_depth if node.left.nil? && node.right.nil?

    current_depth += 1

    [depth(node.left, current_depth), depth(node.right, current_depth)].max
  end

  def insert_left(value, node)
    node.left ? insert(value, node.left) : node.left = Node.new(value)
  end

  def insert_right(value, node)
    node.right ? insert(value, node.right) : node.right = Node.new(value)
  end

  def find_parent(value, current = @root)
    return nil if @root.data == value
    return current if current.left.data == value || current.right.data == value

    current.data > value ? find_parent(value, current.left) : find_parent(value, current.right)
  end

  def delete_leaf_node(parent, value)
    puts "Delete Leaf Node Parent: #{parent}"
    parent.data > value ? parent.left = nil : parent.right = nil
  end
end
