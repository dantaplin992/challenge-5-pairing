class Game
  def initialize
    @turn = 1
    @player_1 = Player.new("Player 1")
    @player_2 = Player.new("Player 2")
    @board_1 = Board.new
    @board_2 = Board.new
    @placer_1 = ShipPlacer.new(@board_1)
    @placer_2 = ShipPlacer.new(@board_2)
    @current_player = @player_1
    @current_board = @board_1
    @opponent = @player_2
    @opponent_board = @board_2
  end

  def current_turn
    @turn
  end

  def current_player
    @current_player
  end

  def current_board
    @current_board
  end

  def opponent
    @opponent
  end

  def opponent_board
    @opponent_board
  end

  def placer_1
    @placer_1
  end

  def placer_2
    @placer_2
  end

  def next_turn
    @turn += 1
    @turn.odd? ? @current_player = @player_1 : @current_player = @player_2
  end

  def check_if_win
    !@current_player.ships_left?
  end
end
