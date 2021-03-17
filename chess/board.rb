require_relative "piece"
require_relative "bishop"
require_relative "king"
require_relative "knight"
require_relative "queen"
require_relative "rook"
require_relative "pawn"
require_relative "nullpiece"
require "byebug"

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
        raise "Error" unless self[start_pos].class == Piece
        # raise "Error" unless valid_move?(end_pos)

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
        @grid.each_with_index do |row, idx1|
            if idx1 == 0
                row.map.each_with_index do |ele,idx2|
                    if idx2 == 0 || idx2 == 7
                        ele = Rook.new(:black, [idx1,idx2], self)
                    elsif idx2 == 1 || idx2 == 6
                        ele = Knight.new(:black, [idx1,idx2], self)
                    elsif idx2 == 2 || idx2 == 5
                        ele = Bishop.new(:black, [idx1, idx2], self)
                    elsif idx2 == 3
                        ele = Queen.new(:black, [idx1, idx2], self)
                    else
                        ele == King.new(:black, [idx1, idx2], self)
                    end
                end
            elsif idx1 == 1
                row.map do |pos|
                    Pawn.new(:black, pos, self)
                end
            elsif idx1 == 6
                row.map do |pos|
                    Pawn.new(:white, pos, self)
                end
            elsif idx1 == 7
                row.map.each_with_index do |ele,idx2|
                    if idx2 == 0 || idx2 == 7
                        ele = Rook.new(:white, [idx1,idx2], self)
                    elsif idx2 == 1 || idx2 == 6
                        ele = Knight.new(:white, [idx1,idx2], self)
                    elsif idx2 == 2 || idx2 == 5
                        ele = Bishop.new(:white, [idx1, idx2], self)
                    elsif idx2 == 3
                        ele = Queen.new(:white, [idx1, idx2], self)
                    else
                        ele == King.new(:white, [idx1, idx2], self)
                    end
                end
            else
                row.map do |pos|
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
