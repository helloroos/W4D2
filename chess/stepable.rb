module Stepable

    def moves
        final_moves = []

        move_diffs.each do |move|
            row = move[0] + self.pos[0]
            col = move[1] + self.pos[1]
            new_position = [row, col]
            if empty?(new_position)
                final_moves << new_position
            elsif new_position[0] < 0 || new_position[1] < 0
                next
            elsif new_position[0] > 7 || new_position[1] > 7
                next
            elsif @board[new_position].color != self.color
                final_moves << new_position
                next
            else
                next # own, outside the board? 
            end
        end

        final_moves
    end

    private

    def move_diffs
        raise NotImplementedError
        # constant for ki/kn
        # return the constants >> The dir they can move
    end

end