class Piece

    attr_reader :value, :pos, :board, color
    def initialize(color, pos, board)
        @value = :P
        @color = color
        @pos = pos
        @board = board
    end

    def inspect
        :P
    end

    def empty?(pos)
        self.board[pos].is_a?(NullPiece)
    end
end

piece.empty?([0,0])
