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

  def create_children(current = @alpha)
    # puts "current's children are #{current.children}"
    # puts "current's children will be #{current.moves}"
    # puts '----------------------------------------------'
    current.moves.each do |move|
      puts "move is #{move}"
      current.children << Knight.new(move)
    end
    # puts '----------------------------------------------'
    # puts "current's children now are #{current.children}"
  end

  def find_child(coordinates, start = @alpha)
    puts "coordinates is #{coordinates}"
    puts "start is #{start}"
    found = nil
    # puts "start children are #{start.children}"
    start.children.each do |child|
      puts "child is #{child}"
      puts "child.location is #{child.location}"
      found = child if child.location == coordinates
    end
    puts "found is #{found}"
  end

  def knight_moves(start, destination)
    puts "start is #{start} & destination is #{destination}"
    @alpha = Knight.new(start)
    puts "@alpha is #{@alpha}"
    create_children
    find_child([1, 4])
  end
end
