require_relative "piece"
require "singleton"

class NullPiece < Piece
    include Singleton

    def initialize
        super(nil, nil, board)
    end

    def symbol
        raise NotImplementedError
    end

    def moves
        raise NotImplementedError
    end

    def inspect
        :N
    end

end