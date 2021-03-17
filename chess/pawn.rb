require_relative "piece"
require "colorize"

class Pawn < Piece

    def symbol
        "♟︎".colorize(color)
    end

    def moves
        final_moves = []

        #logic
        #if row[i] == 1 or 6
            #shovel in forward_steps + forward_direction
        #elseif if piece at self.pos + [1,1] or [1,-1]

        #elsif if pos[+1] || pos[-1] == empty?(nullpiece)
            #shovel in forward_direction


        final_moves
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
        col, row = @pos #@pos = [4,5]
        if color == :black && (@board[[col+1,row+1]].color == :white &&  @board[[col+1,row-1]].color == :white)
            return [[1,1],[1,-1]]
        elsif color == :black && @board[[col+1,row+1]].color == :white #[5,6]
            return [[1, 1]]
        elsif color == :black && @board[[col+1,row-1]].color == :white #[5,3]
            return [[1, -1]]
        end
    end

end