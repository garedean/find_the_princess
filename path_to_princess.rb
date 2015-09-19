require './lib/board'
require './lib/board_helper'
require './lib/mario'
require './lib/player'

moves = []

board        = Board.new

# used for finding Mario and Princess coodinates, distances between them, best moves
board_helper = BoardHelper.new(board)
mario        = Mario.new(board, board_helper, "M")
princess     = Player.new(board, board_helper, "P")
