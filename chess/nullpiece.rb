require_relative "piece"
require "singleton"

class NullPiece < Piece

    include Singleton
    attr_reader :value
    def initialize
        @value = :N
        super
    end

    def inspect
        :N
    end

end