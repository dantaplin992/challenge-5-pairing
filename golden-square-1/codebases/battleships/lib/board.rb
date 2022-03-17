class Board
  def initialize
    @game_board = Array.new(10) { ".........." }
  end

  def show_board
    @game_board
  end

  def on_board?(x, y)
    (1..10) === x && (1..10) === y
  end

  def place_on_board(x, y, str)
    @game_board[(y - 1)][(x - 1)]= str
  end

  def already_shot_at?(x, y)
    loc = @game_board[(y - 1)][(x - 1)]
    loc == "X" || loc == "O"
  end

  def ship_at?(x, y)
    @game_board[(y - 1)][(x - 1)] == "S"
  end

end