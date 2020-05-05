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
    # puts "#{node.value} was appended. (head: #{head.value} tail: #{tail.value})"
  end

  def prepend(node)
    node = Node.new(node)
    node.next_node = @head
    @head = node
    @size += 1
    puts "#{node.value} was prepended. (head: #{head.value} tail: #{tail.value})"
  end

  def at(index)
    return 'Invalid index' if index.is_a?(String) || index > size - 1

    node = head
    index.times do
      node = node.next_node
    end
    node.value
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
puts "The first node is #{names.head}"
puts "The last node is #{names.tail}"
puts names.to_s
names.prepend('ethan')
puts names.to_s
puts "Number of nodes #{names.size}"
puts names.at(5)
puts names.at('ethan')

# pop removes the last element from the list

# contains?(value) returns true if the passed in value is in the list and otherwise returns false.

# find(value) returns the index of the node containing value, or nil if not found.

# to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil

# Extra Credit

# insert_at(value, index) that inserts the node with the provided value at the given index

# remove_at(index) that removes the node at the given index. (You will need to update the links of your nodes in the list when you remove a node.) </div>
