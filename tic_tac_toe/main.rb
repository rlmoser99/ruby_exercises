require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'game.rb'

Game.new.play

# CLASS: Game Board
    # Method: Fill in valid move turn
        # example, for 1: board = [X, 2, 3, 4, 5, 6, 7, 8, 9]

# CLASS: Game
    # Method: Prompt player turn
        # Subtract 1 from "game board area" for board[index]
    # Method: Check turn if valid move
        # Input is number 1-9
        # Input is not already "filled"
        # Re-Prompt player turn if needed
    # Method: Check for winning sequence before prompting another player turn
        # [1,2,3]
        # [4,5,6]
        # [7,8,9]
        # [1,5,9]
        # [3,5,7]
        # [1,4,7]
        # [2,5,8]
        # [3,6,9]
    # Method: Ending the Game - After 9th turn (or check to see if the board is full) or after winning sequence
    # Method: Ask to Play Again?