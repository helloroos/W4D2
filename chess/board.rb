require_relative "piece"
require_relative "nullpiece"
require "byebug"

class Board
    attr_accessor :grid

    def initialize
        @grid = Array.new(8) { Array.new(8) }
        @nullpiece = NullPiece.instance
        fill_board
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
                row.each_with_index do |ele,idx2|
                    if idx2 == 0 || idx2 == 7
                        ele = Rook.new(:black, [idx1,idx2], self)
                    elsif idx2 == 1 || idx2 == 6
                        ele = Bishop.new(:black, [idx1,idx2], self)
                end
            elsif idx1 == 1
                row.map! do |pos|
                    Pawn.new(:black, pos, self)
                end
            elsif idx1 == 6
                row.map! do |pos|
                    Pawn.new(:white, pos, self)
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
