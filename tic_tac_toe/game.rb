class Game

    def start
        puts "Let's play Tic-Tac-Toe!!!"
        puts "What is the name of player #1:"
        name_1 = gets.chomp
        puts "What 1 letter/character would you like to be your game marker?"
        symbol_1 = gets.chomp until symbol_1.to_s.length == 1
        @player_1 = Player.new(name_1, symbol_1)
        puts "What is the name of player #2:"
        name_2 = gets.chomp
        puts "What 1 letter/character (except '#{symbol_1}') would you like to be your game marker?"
        symbol_2 = gets.chomp until symbol_2.to_s != symbol_1.to_s && !symbol_2.nil?
        @player_2 = Player.new(name_2, symbol_2)
        @board = Board.new
        @board.show
    end

    def turn (player)
        puts "#{player.name}, please enter a number (1-9) that is available to place an '#{player.symbol}'"
        cell = gets.chomp until (@board.cells[cell.to_i - 1] === cell.to_i)
        @board.cells[cell.to_i - 1] = player.symbol
        @board.show
    end

    def end?
        @board.cells.all?{ | cell | cell == "X" || cell == "O"}
    end

    def winner (player)
        three_in_a_row = false
        winning_combinations = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
        ]
        winning_combinations.each do | combination |
            three_in_a_row = true if combination.all? {| cell | @board.cells[cell] == player.symbol}   
        end
        puts "GAME OVER! #{player.name} is the winner!" if three_in_a_row
        three_in_a_row
    end

    def play
        self.start
        until self.end?
            self.turn(@player_1)
            break if self.end? || self.winner(@player_1)
            self.turn(@player_2)
            break if self.winner(@player_2)
        end
        puts "It's a draw." if self.end? && !self.winner(@player_1) && !self.winner(@player_2)
        puts ""
        puts "Would you like to play a new game? Press 'y' for yes or 'n' for no."
        repeat_game = gets.chomp.downcase
        Game.new.play if repeat_game == "y"
        puts "Ok. Have a great day, #{@player_1.name} and #{@player_2.name}!" if repeat_game == "n"
    end

end