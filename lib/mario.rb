require './lib/player'

class Mario < Player
  attr_accessor :princess_location

  def move_toward_princess
    move = @board_helper.get_best_move
    self.location = move.values.first
    move.keys.first
  end

  def found_princess?(princess)
    return true if @location == princess.location
  end
end
