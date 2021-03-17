require_relative "piece"
require "colorize"

class Pawn < Piece

    def symbol
        "♟︎".colorize(color)
    end

    def moves

    end

    private

    def at_start_row?
        return true if self.pos[0] == 1 || self.pos[0] == 6
        false
    end

    def forward_dir
        if color == :black 
            return 1
        else
            return -1
        end
    end

    def forward_steps
        if color == :black
            return 2
        else
            return -2
        end
    end

    def side_attacks
        if color == :black
            return [[1, 1], [1, -1]]
    end

end