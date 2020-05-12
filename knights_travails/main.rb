# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'knight.rb'

game = Board.new
game.knight_moves([3, 3], [0, 0])
puts ''
game.knight_moves([6, 3], [0, 0])
puts ''
game.knight_moves([0, 0], [7, 7])
