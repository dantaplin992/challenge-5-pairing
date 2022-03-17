class ShipPlacer
  def initialize(board)
    @board = board
    @lengths = {
      "Carrier" => 5,
      "Battleship" => 4,
      "Cruiser" => 3,
      "Submarine" => 3,
      "Destroyer" => 2
    }
  end

  def board
    @board
  end

  def convert_coords(x, y, length, orientation)
    coords = []
    if orientation == "v"
      (0..(length - 1)).each do |i|
        coords << [(x + i), y]
      end
    else
      (0..(length - 1)).each do |i|
        coords << [x, (y + i)]
      end
    end
    return coords
  end

  def place_ship(y, x, name, orientation)
    len = @lengths[name]
    ship_coords = convert_coords(x, y, len, orientation)
    success = true
    for coord in ship_coords do
      success = false if !@board.on_board?(coord[1], coord[0]) || @board.ship_at?(coord[1], coord[0])
    end
    if success
      for coord in ship_coords do
        @board.place_on_board(coord[1], coord[0], "S")
      end
    end
    return success
  end
end