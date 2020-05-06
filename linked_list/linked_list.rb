# frozen_string_literal: true

require_relative 'node'

class LinkedList
  attr_accessor :name, :head, :tail, :size
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(node)
    node = Node.new(node)
    @head.nil? ? @head = node : @tail.next_node = node
    @tail = node
    @size += 1
  end

  def prepend(node)
    node = Node.new(node)
    node.next_node = @head
    @head = node
    @size += 1
  end

  def at(index)
    return 'Invalid index' if index.is_a?(String)
    return 'nil' if index > size - 1

    node = head
    index.times do
      node = node.next_node
    end
    node
  end

  def pop
    return 'nil' if @size.zero?

    @tail = size > 1 ? at(size - 2) : @head
    @tail.next_node = nil
    @size -= 1
  end

  def contains?(value, index = 0)
    return false if index >= size

    return true if at(index).value == value

    contains?(value, index + 1)
  end

  def find(value, index = 0)
    return 'nil' if index >= size

    return index if at(index).value == value

    find(value, index + 1)
  end

  def to_s
    string = ''
    string_node = head
    loop do
      string += "( #{string_node.value} ) -> "
      break if string_node.next_node.nil?

      string_node = string_node.next_node
    end
    string += 'nil'
  end
end

names = LinkedList.new
puts names.at(0)
names.append('abby')
names.append('becky')
names.append('carl')
names.append('denise')
puts "The first node is #{names.head.value}"
puts "The last node is #{names.tail.value}"
puts names.to_s
names.prepend('ethan')
puts names.to_s
puts "Number of nodes #{names.size}"
puts names.at(2)
puts names.at(5)
puts names.at('ethan')
names.pop
puts names.to_s
puts "The first node is #{names.head.value}"
puts "The last node is #{names.tail.value}"
puts "Number of nodes #{names.size}"
puts names.contains?('carl')
puts names.contains?('sara')
puts names.find('carl')
puts names.find('sara')

# Extra Credit

# insert_at(value, index) that inserts the node with the provided value at the given index

# remove_at(index) that removes the node at the given index. (You will need to update the links of your nodes in the list when you remove a node.) </div>
