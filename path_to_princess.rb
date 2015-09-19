require './lib/board'
require './lib/board_helper'
require './lib/mario'
require './lib/player'

moves = []

board                 = Board.new
board_helper          = BoardHelper.new(board)

mario                 = Mario.new(board, board_helper, "M")
board_helper.mario    = mario
mario.location        = board_helper.get_player_coodinates(mario)

princess              = Player.new(board, board_helper, "P")
board_helper.princess = princess
princess.location     = board_helper.get_player_coodinates(princess)

until mario.found_princess?(princess)
  moves << mario.move_toward_princess
end

puts "\nWould you like to see the quickest way to get to Princess? Hit 'Enter' to see the moves"

if gets == "\n"
  puts "The quickest way to get to the princess is with #{moves.size} moves:"
  moves.each do |move|
    puts move
    sleep(0.2)
  end
end
