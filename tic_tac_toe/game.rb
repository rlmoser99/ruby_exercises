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

    def turn (player)
        puts "#{player.name}, please enter a number (1-9) that is available"
        cell = gets.chomp until (@board.cells[cell.to_i - 1] === cell.to_i)
        @board.cells[cell.to_i - 1] = player.symbol
        @board.show
    end

    def end?
        @board.cells.all?{ | cell | cell == "X" || cell == "O"}
    end

    def winner
        result = []
        winning_combinations = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
        ]
        winning_combinations.each do | combination |
            result << "1" if combination.all? {| cell | @board.cells[cell] == "X"}
            result << "2"  if combination.all? {| cell | @board.cells[cell] == "O"}
        end
        result
    end

    def play
        self.start
        until self.end?
            self.turn(@player_1)
            break if self.winner == ["1"]
            break if self.end?
            self.turn(@player_2)
            break if self.winner == ["2"]
        end
        puts "No winner" if self.end?
        puts "#{@player_1.name} is the winner" if self.winner == ["1"]
        puts "#{@player_2.name} is the winner" if self.winner == ["2"]
    end

end

# CLASS: Game
    # Method: Ask to Play Again?