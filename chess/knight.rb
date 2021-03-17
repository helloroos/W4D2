require_relative "piece"
require_relative "stepable"
require "colorize"

class Knight < Piece
    include Stepable

    def symbol
        '♞'.colorize(color)
    end

    private

    def move_diffs
        [
            [2, -1],
            [2, 1],
            [-2, -1],
            [-2, 1],
            [1, -2],
            [1, 2],
            [-1, -2],
            [-1, 2]
        ]
    end
end