require "colorize"
class Piece
    
    attr_reader :pos, :board, :color
    def initialize(color, pos, board)
        @color = color
        @pos = pos
        @board = board
    end

    # def to_s
    #     @value.to_s
    # end

    def empty?(pos)
        self.board[pos].is_a?(NullPiece)
    end

    def valid_moves
        moves.select { |move| !move_into_check?(move) }
    end

    # def pos=(val)
    #     # might not need? >> shortcut to change the piece's pos
    # end

    def symbol
        raise NotImplementedError 
    end

    def inspect
        symbol
    end

    private

    def move_into_check?(end_pos)
    end

end

