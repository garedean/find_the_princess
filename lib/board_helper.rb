class BoardHelper
  attr_accessor :board, :mario, :princess

  def initialize(board)
    @board = board
  end

  def get_player_coodinates(player)
    @board.layout.each_index do |i|
      j = @board.layout[i].index player.board_char;
      break [i, j] if j
    end
  end

  def get_best_move
    possible_moves = get_possible_moves

    move_stats = {}

    possible_moves.each do |direction, potential_coodinates|
      move_stats[direction] = {
        distance:   get_distance_from_princess(direction, potential_coodinates),
        coodinates: potential_coodinates }
    end

    best_move = {direction: "", distance: 9999}

    move_stats.each do |k, v|
      if v[:distance] < best_move[:distance]
        best_move[:direction] = k
        best_move[:distance]  = v[:distance]
      end
    end

    possible_moves.select do |k, v|
      k == best_move[:direction]
    end
  end

  # Example output: {"UP"=>[3, 3], "LEFT"=>[4, 2], "RIGHT"=>[4, 4]}
  def get_possible_moves
    upper_limit = @board.layout.size - 1
    moves = {}

    m_x_coodinate = @mario.location[1]
    m_y_coodinate = @mario.location[0]

    if (m_y_coodinate - 1) >= 0
      moves["UP"]    = [(m_y_coodinate - 1), m_x_coodinate]
    end
    if (m_y_coodinate + 1) <= upper_limit
      moves["DOWN"]  = [(m_y_coodinate + 1), m_x_coodinate]
    end
    if (m_x_coodinate - 1) >= 0
      moves["LEFT"]  = [m_y_coodinate, (m_x_coodinate - 1)]
    end
    if (m_x_coodinate + 1) <= upper_limit
      moves["RIGHT"] = [m_y_coodinate, (m_x_coodinate + 1)]
    end

    moves
  end

  def get_distance_from_princess(direction, potential_coodinates)
    Math.hypot(
      potential_coodinates[1] - princess.location[1],
      potential_coodinates[0] - princess.location[0])
  end
end
