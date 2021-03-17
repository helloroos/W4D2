require_relative "piece"
require_relative "stepable"

class King < Piece
    include Stepable


    def move_diffs
        #will give back array of move diffs
    end

end