require_relative "piece"
require_relative "nullpiece"
class Board

    def initialize
        @grid = Array.new(8) { Array.new(8) }
        @grid.each_with_index do |row, idx1|
            if idx1 == 0 || idx1 == 1 || idx1 = 6 || idx1 == 7
                row.map! { |pos| Piece.new }
            else
                row.map! { |pos| NullPiece.new }
            end
        end
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

