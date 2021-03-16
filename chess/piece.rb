class Piece

    attr_reader :value
    def initialize(color, pos, board)
        @value = :P
    end

    def inspect
        :P
    end
end