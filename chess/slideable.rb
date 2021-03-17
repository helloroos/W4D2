
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
            dx, dy = move
            possible_moves += grow_unblocked_moves_in_dir(dx, dy)
        end
        possible_moves
    end

    def grow_unblocked_moves_in_dir(dx, dy) # Adds every in the dir until end
        #save self.pos into new_position var
        #until new_position !empty?
            #increment new_position by dx, dy
                #shovel new_position into final_moves arr
            #if occupied
                #occupying piece is opposite color
                    #shovel pos into final_arr
                    #stop lopp
                #occupying piece is same color
                    #don't shovel
                    #stop loop
        final_moves = []
        
        self.pos

        final_moves
    end

end