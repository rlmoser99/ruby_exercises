# frozen_string_literal: true

class Tree
  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    return if array.empty?

    result = array.sort.uniq
    return Node.new(result[0]) if result.length <= 1

    middle = result.length / 2
    root = Node.new(result[middle])
    root.left = build_tree(result[0...middle])
    root.right = build_tree(result[middle + 1..-1])
    root
  end

  # THIS IS NOT CORRECT - For it to be balanced, the left and right subtrees of every node must differ in height by no more than 1.
  def balanced?
    (depth(@root.left) - depth(@root.right)).abs <= 1
  end

  def rebalance!
    @root = build_tree(inorder)
  end

  def node_list(current = @root, queue = [], result = [])
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
    node_list(queue[0], queue, result)
  end

  def level_order
    queue = [@root]
    result = []
    until queue.empty?
      node = queue.shift
      block_given? ? yield(node) : result << node.data
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
    result unless block_given?
  end

  ORDERS = %w[preorder inorder postorder].freeze
  ORDERS.each do |method|
    define_method method.to_s do |root = @root, result = [], &block|
      return if root.nil?

      traverse(root, result, &block) if method == 'preorder'
      send(method, root.left, result, &block)
      traverse(root, result, &block) if method == 'inorder'
      send(method, root.right, result, &block)
      traverse(root, result, &block) if method == 'postorder'

      result unless block
    end
  end

  def traverse(root, result, &block)
    block ? block.call(root.data) : result << root.data
  end

  def find_value(value)
    inorder { |node| return node if node == value }
    # preorder { |node| return node if node == value }
    # postorder { |node| return node if node == value }
    # level_order { |node| return node if node.data == value }
  end

  def insert(value, node = @root)
    return if node == value

    insert_left(value, node) if node > value
    insert_right(value, node) if node < value
  end

  def delete(value)
    return nil if find(value).nil?

    parent_node = find_parent(value)
    if find(value).left.nil? && find(value).right.nil?
      delete_leaf_node(parent_node, value)
    elsif find(value).left.nil? || find(value).right.nil?
      delete_single_child_node(parent_node, value)
    else
      delete_double_child_node(parent_node, value)
    end
  end

  def find(value, current = @root)
    return nil if current.nil?
    return current if current == value

    current > value ? find(value, current.left) : find(value, current.right)
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
    return nil if @root == value
    return current if current.left == value || current.right == value

    current > value ? find_parent(value, current.left) : find_parent(value, current.right)
  end

  def delete_leaf_node(parent, value)
    parent > value ? parent.left = nil : parent.right = nil
  end

  def delete_single_child_node(parent, value)
    grandchild = find(value).right if find(value).left.nil?
    grandchild = find(value).left if find(value).right.nil?
    attach_right(parent, grandchild) if parent.right == find(value)
    attach_left(parent, grandchild) if parent.left == find(value)
  end

  def delete_double_child_node(parent, value)
    replace = find_inorder_successor(value)
    delete(replace.data)
    attach_right(replace, find(value).right)
    attach_left(replace, find(value).left)
    attach_right(parent, replace) if parent.right == find(value)
    attach_left(parent, replace)  if parent.left == find(value)
  end

  def attach_right(parent, node)
    parent.right = node
  end

  def attach_left(parent, node)
    parent.left = node
  end

  def find_inorder_successor(value, successor = value)
    result = find(successor + 1)
    return result unless result.nil?

    find_inorder_successor(successor + 1)
  end
end
