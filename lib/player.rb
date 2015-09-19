class Player
  attr_accessor :location, :board_char, :board, :board_helper

  def initialize(board, board_helper, character)
    @board        = board
    @board_char   = character
    @board_helper = board_helper
  end
end
