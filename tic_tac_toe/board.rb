class GameBoard
    attr_accessor :board
    def initialize
        @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def show
        puts ""
        puts " #{board[0]} | #{board[1]} | #{board[2]}"
        puts "---+---+---"
        puts " #{board[3]} | #{board[4]} | #{board[5]}"
        puts "---+---+---"
        puts " #{board[6]} | #{board[7]} | #{board[8]}"
        puts ""
    end

end



# CLASS: Game Board
    # Method: Set-Up 9 Game Board Areas
        # Instance Variable: board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    # Method: Display Game Board
        # board[0] | board[1] | board[2]
        # ---+---+---
        # board[3] | board[4] | board[5]
        # ---+---+---
        # board[6] | board[7] | board[8]
    # Method: Fill in valid move turn
        # example, for 1: board = [X, 2, 3, 4, 5, 6, 7, 8, 9]