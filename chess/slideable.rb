require "byebug"

module Slideable

    HORIZONTAL_DIRS = [
        [0, -1], # left
        [-1, 0], # up
        [0, 1], # right
        [1, 0] # down
    ].freeze

    DIAGONAL_DIRS = [
        [-1, -1], # up, left
        [-1, 1], # up, right
        [1, -1], # down, left
        [1, 1] # down, right
    ].freeze

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        possible_moves = []
        move_dirs.each do |move|
            # debugger
            dx, dy = move
            possible_moves += grow_unblocked_moves_in_dir(dx, dy)
        end
        possible_moves
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        final_moves = []
        new_position = self.pos.dup

        7.times do
            new_position[0] += dx 
            new_position[1] += dy
            if empty?(new_position)
                final_moves << new_position.dup
            elsif new_position[0] > 7 || new_position[1] > 7
                break
            elsif new_position[0] < 0 || new_position[1] < 0
                break
            elsif @board[new_position].color != self.color
                final_moves << new_position.dup
                break
            else
                break # own, outside the board? 
            end
        end

        final_moves
    end

end