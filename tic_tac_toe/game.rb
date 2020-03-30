class Game

    def start
        puts "Name of Player #1:"
        player1_name = gets.chomp
        @player_1 = Player.new(player1_name, "X")
        puts "Name of Player #2:"
        player2_name = gets.chomp
        @player_2 = Player.new(player2_name, "O")
        @board = GameBoard.new
        @board.show
    end

end



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