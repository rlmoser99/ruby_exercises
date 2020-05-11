# frozen_string_literal: true

# Chess board game
class Board
  attr_accessor :locations

  def initialize
    @locations = board_locations
  end

  def board_locations
    [0, 1, 2, 3, 4, 5, 6, 7].repeated_permutation(2).to_a
  end

  def board_summary
    puts "locations is #{locations}"
    puts "There are #{locations.size} locations"
  end

  def create_children(queue = [@alpha], destination)
    current = queue[0]
    current.moves.each do |move|
      puts "move is #{move}"
      if find_child(move).nil?
        new_child = Knight.new(move)
        current.children << new_child
        queue << new_child
      else
        current.children << find_child(move)
      end
    end
    puts "current.location is #{current.location} and destination is #{destination}"
    return if find_child(destination)

    queue.shift
    create_children(queue, destination)
  end

  def find_child(coordinates, queue = [@alpha])
    return nil if queue.empty?

    found = nil
    current = queue[0]
    current.children.each do |child|
      queue << child
      found = child if child.location == coordinates
    end
    queue.shift
    return found unless found.nil?

    find_child(coordinates, queue)
  end

  def knight_moves(start, destination)
    puts "start is #{start} & destination is #{destination}"
    @alpha = Knight.new(start)
    puts "@alpha is #{@alpha}"
    create_children(destination)
    test = find_child([1, 4])
    # test = find_child([7, 7])
    puts "test is #{test}" unless test.nil?
  end
end
