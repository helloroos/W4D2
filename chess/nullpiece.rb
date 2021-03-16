require_relative "piece"

class NullPiece < Piece

    attr_reader :value
    def initialize
        @value = :N
    end

    def inspect
        :N
    end

end