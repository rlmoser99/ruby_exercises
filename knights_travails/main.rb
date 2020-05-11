# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'knight.rb'

game = Board.new
# game.board_summary
game.knight_moves([3, 3], [0, 0])
