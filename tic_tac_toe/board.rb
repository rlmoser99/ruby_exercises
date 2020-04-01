class Board
    attr_accessor :cells
    def initialize
        @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def show
        puts ""
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]}"
        puts "---+---+---"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]}"
        puts "---+---+---"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]}"
        puts ""
    end

end