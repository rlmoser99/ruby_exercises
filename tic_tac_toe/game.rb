class Game

    def start
        puts "Name of Player #1:"
        name_1 = gets.chomp
        @player_1 = Player.new(name_1, "X")
        puts "Name of Player #2:"
        name_2 = gets.chomp
        @player_2 = Player.new(name_2, "O")
        @board = Board.new
        @board.show
    end

    # def turn
    #     puts "#{@player_1.name}, please select a free spot (1-9)"
    #     cell = gets.chomp
    #     if (@board.cells[cell.to_i - 1] === cell.to_i)
    #         @board.cells[cell.to_i - 1] = @player_1.symbol
    #     else
    #         puts "That was an invalid turn."
    #     end
    #     @board.show
    #     puts self.end?
    # end

    def turn (player)
        puts "#{player.name}, please select a free spot (1-9)"
        cell = gets.chomp
        if (@board.cells[cell.to_i - 1] === cell.to_i)
            @board.cells[cell.to_i - 1] = player.symbol
        else
            puts "That was an invalid turn."
        end
        @board.show
        puts self.end?
    end

    def end?
        @board.cells.all?{ | cell | cell == "X" || cell == "O"}
    end

    def play
        self.start
        until self.end?
            self.turn(@player_1)
            self.turn(@player_2)
        end
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