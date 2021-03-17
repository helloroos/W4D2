require_relative "game"
require_relative "cursor"
require "colorize"

class Display # < Game

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        @cursor.cursor_pos.colorize(:green)
    end
    
    def test
        testing = true
        while testing 
            render
            @cursor.get_input
        end
    end

end