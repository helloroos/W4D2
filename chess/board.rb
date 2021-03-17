require_relative "piece"
require_relative "bishop"
require_relative "king"
require_relative "knight"
require_relative "queen"
require_relative "rook"
require_relative "pawn"
require_relative "nullpiece"
require "byebug"
require "enumerator"

class Board
    attr_accessor :grid

    def initialize
        @grid = Array.new(8) { Array.new(8) }
        @nullpiece = NullPiece.instance
        @grid = fill_board
    end

    def [](pos) 
        row = pos[0] 
        col = pos[1] 
        @grid[row][col] 
    end

    def []=(pos, val)
        row = pos[0]
        col = pos[1]
        @grid[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        
        raise "Error" if self[start_pos].is_a?(NullPiece) || (!start_pos.first.between?(0,7) || !start_pos.last.between?(0,7))

        current_piece = self[start_pos]
        other_piece = self[end_pos]
        # debugger
        if other_piece.is_a?(NullPiece)
            self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
        else
            self[start_pos] = @nullpiece
            self[end_pos] = current_piece
        end 
    end

    private

    def fill_board
        @grid.each_with_index do |row, idx|
            if idx == 0
                i = 0
                while i < row.length
                    row[i] = Rook.new(:blue, [idx,i], self) if i == 0 || i == 7 
                    row[i] = Knight.new(:blue, [idx,i], self) if i == 1 || i == 6 
                    row[i] = Bishop.new(:blue, [idx,i], self) if i == 2 || i == 5 
                    row[i] = Queen.new(:blue, [idx,i], self) if i == 3 
                    row[i] = King.new(:blue, [idx,i], self) if i == 4
                    i += 1
                end
            elsif idx == 1
                i = 0
                while i < row.length
                    row[i] = Pawn.new(:blue, [idx, i], self)
                    i += 1
                end
            elsif idx == 6
                i = 0
                while i < row.length
                    row[i] = Pawn.new(:white, [idx, i], self)
                    i += 1
                end
            elsif idx == 7
                i = 0
                while i < row.length
                    row[i] = Rook.new(:white, [idx,i], self) if i == 0 || i == 7 
                    row[i] = Knight.new(:white, [idx,i], self) if i == 1 || i == 6 
                    row[i] = Bishop.new(:white, [idx,i], self) if i == 2 || i == 5 
                    row[i] = Queen.new(:white, [idx,i], self) if i == 3 
                    row[i] = King.new(:white, [idx,i], self) if i == 4
                    i += 1
                end
            else
                row.map! do |pos|
                    @nullpiece
                end
            end
        end
    end
end

# [
#     [0, 1, 2, 3, 4, 5, 6, 7], 0
#     [0, 1, 2, 3, 4, 5, 6, 7], 1
#     [0, 1, 2, 3, 4, 5, 6, 7], 2
#     [0, 1, 2, 3, 4, 5, 6, 7], 3
#     [0, 1, 2, 3, 4, 5, 6, 7], 4
#     [0, 1, 2, 3, 4, 5, 6, 7], 5
#     [0, 1, 2, 3, 4, 5, 6, 7], 6
#     [0, 1, 2, 3, 4, 5, 6, 7]  7
# ]
