require "game"
require "cursor"
require "colorize"

class Display < Game

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        @cursor.cursor_pos.colorize(:green)
    end


end