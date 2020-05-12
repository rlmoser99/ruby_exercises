# frozen_string_literal: true

# Knight travels the chess board
class Knight
  attr_accessor :location, :moves, :children

  def initialize(location)
    @location = location
    @moves = possible_moves(location)
    @children = []
    # puts "KNIGHT:#{location} => #{moves}"
  end

  def possible_moves(location, result = [])
    moves = [
      [-1, -2], [1, 2], [-1, 2], [1, -2], [-2, -1], [2, 1], [-2, 1], [2, -1]
    ]
    moves.each do |move|
      x = location[0] + move[0]
      y = location[1] + move[1]
      # puts "Rejected [#{x}, #{y}]" unless x.between?(0, 7) && y.between?(0, 7)
      result << [x, y] if x.between?(0, 7) && y.between?(0, 7)
    end
    result
  end
end
