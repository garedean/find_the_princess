class Board
  attr_accessor :layout

  def initialize
    @layout = setup
    print_board_layout
  end

  def setup
    r = Random.new
    grid = []
    n = 0

    while n < 3 || n > 999
      puts ""
      print "How size board would you like (n x n)? Please choose a size between 3 - 999: "
      n = gets.to_i
    end

    display_loading_bar

    # Populate board with blank spaces, "-".
    n.times do |i|
      n.times do |j|
        grid[i] ? grid[i] += "-" : grid[i] = "-"
      end
    end

    # Select random coodinates for Princess.
    p_location = [r.rand(0..n - 1), r.rand(0..n - 1)]
    m_location = nil

    # Select different random coodinates for Mario.
    until m_location && m_location != p_location
      m_location = [r.rand(0..n - 1), r.rand(0..n - 1)]
    end

    # Place Mario and Princess in previously chosen random locations.
    grid[p_location[0]][p_location[1]] = "P"
    grid[m_location[0]][m_location[1]] = "M"

    @layout = grid
  end

  def display_loading_bar
    puts ""
    print "Setting up the board "
    sleep(0.5)
    6.times do
      print ". "
      sleep(0.5)
    end
    sleep 1
    print "\r" + ("\e[K"*10)
  end

  def print_board_layout
    puts "Here's your randomly set up board. Go rescue her, Mario!\n\n"
    sleep 2

    layout.each do |e|
      puts e
    end
  end
end
