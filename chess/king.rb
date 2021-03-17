require_relative "piece"
require_relative "stepable"

class King < Piece
    include Stepable

    def symbol
        '♚'.colorize(color)
    end

    private

    def move_diffs
        [
            [-1, -1], #up left
            [-1, 0], #up
            [-1, 1], #up right
            [0, 1], #right
            [1, 1],  #down right
            [1, 0],  #down
            [1, -1], #down left
            [0, -1], #left
        ]
    end

end