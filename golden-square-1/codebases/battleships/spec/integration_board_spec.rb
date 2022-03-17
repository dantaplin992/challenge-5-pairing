require 'board'
require 'ship_placer'
require 'player'

RSpec.describe 'ShipPlacer integrations' do

  it 'initializes with an associated Board object' do
    board = Board.new
    placer = ShipPlacer.new(board)
    expect(placer.board).to eq board
  end

  it 'places a ship on the board horizontally with valid coordinates' do
    board = Board.new
    placer = ShipPlacer.new(board)
    placer.place_ship(1, 1, "Destroyer", "h")
    expect(board.show_board).to eq [
      "SS........",
      "..........",
      "..........",
      "..........",
      "..........",
      "..........",
      "..........",
      "..........",
      "..........",
      ".........."
    ]
  end

  it 'places a ship on the board vertically with valid coordinates' do
    board = Board.new
    placer = ShipPlacer.new(board)
    placer.place_ship(9, 9, "Destroyer", "v")
    expect(board.show_board).to eq [
      "..........",
      "..........",
      "..........",
      "..........",
      "..........",
      "..........",
      "..........",
      "..........",
      "........S.",
      "........S."
    ]
  end

  it 'returns true if ship was successfully placed' do
    board = Board.new
    placer = ShipPlacer.new(board)
    expect(placer.place_ship(9, 9, "Destroyer", "v")).to eq true
  end

  it 'fails and returns false if one or more of the ship coordinates are outside the board' do
    board = Board.new
    placer = ShipPlacer.new(board)
    expect(placer.place_ship(9, 9, "Carrier", "v")).to eq false
    expect(board.show_board).to eq [
      "..........",
      "..........",
      "..........",
      "..........",
      "..........",
      "..........",
      "..........",
      "..........",
      "..........",
      ".........."
    ]
  end

  it 'fails and returns false if the new ship overlaps one on the board' do
    board = Board.new
    placer = ShipPlacer.new(board)
    placer.place_ship(2, 2, "Carrier", "v")
    expect(placer.place_ship(1, 2, "Battleship", "h")).to eq false
    expect(board.show_board).to eq [
      "..........",
      ".S........",
      ".S........",
      ".S........",
      ".S........",
      ".S........",
      "..........",
      "..........",
      "..........",
      ".........."
    ]
  end

  it 'places all ships on the board with valid coordinates' do
    board = Board.new
    placer = ShipPlacer.new(board)
    placer.place_ship(1, 1, "Carrier", "h")
    placer.place_ship(2, 2, "Battleship", "v")
    placer.place_ship(6, 4, "Cruiser", "h")
    placer.place_ship(6, 6, "Submarine", "h")
    placer.place_ship(10, 9, "Destroyer", "v")
    expect(board.show_board).to eq [
      "SSSSS.....",
      ".S........",
      ".S........",
      ".S...SSS..",
      ".S........",
      ".....SSS..",
      "..........",
      "..........",
      ".........S",
      ".........S"
    ]
  end
end