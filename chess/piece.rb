class Piece

    attr_reader :value, :pos, :board, color
    def initialize(color, pos, board)
        @value = :P
        @color = color
        @pos = pos
        @board = board
    end

    def to_s
        @value.to_s
    end

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
        # Check if the children have their symbold meth
        raise NotImplementedError 
    end

    def inspect
        :P
    end

    private

    def move_into_check?(end_pos)
    end

end

piece.empty?([0,0])
