# frozen_string_literal: true

require_relative 'node'

# LinkedList is a linear collection of data elements called nodes
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

  def insert_at(value, index)
    return 'nil' if index.negative? || index > size

    if index.zero?
      prepend(value)
    else
      node = Node.new(value, at(index))
      at(index - 1).next_node = node
      @size += 1
    end
  end

  def remove_at(index)
    return nil unless index.between?(0, size - 1)

    if index.zero?
      @head = head.next_node
      @size -= 1
    elsif index == size - 1
      pop
    else
      at(index - 1).next_node = at(index).next_node
      @size -= 1
    end
  end
end

names = LinkedList.new
names.append('abby')
names.append('becky')
names.append('carl')
names.append('denise')
puts names.to_s
puts ''
puts "The head's value is #{names.head.value}"
puts names.head
puts "The tails value is #{names.tail.value}"
puts names.tail
puts ''
names.prepend('ethan')
puts names.to_s
puts ''
puts "Number of nodes #{names.size}"
puts ''
puts names.at(2).value
puts names.at(2)
puts ''
puts names.at(5)
puts names.at('ethan')
names.pop
puts names.to_s
puts ''
puts names.contains?('carl')
puts names.contains?('sara')
puts names.find('carl')
puts names.find('sara')
puts names.to_s
puts ''
names.insert_at('ben', 1)
names.insert_at('dave', 4)
names.insert_at('adam', 0)
puts names.to_s
puts ''
puts "The first node is #{names.head.value}"
puts "The last node is #{names.tail.value}"
puts "Number of nodes #{names.size}"
names.remove_at(6)
names.remove_at(0)
puts ''
puts names.to_s
puts "The first node is #{names.head.value}"
puts "The last node is #{names.tail.value}"
puts "Number of nodes #{names.size}"
