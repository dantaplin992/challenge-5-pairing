require 'board'

RSpec.describe Board do

  context 'the class is initialized' do
    it 'initializes with an empty board' do
      board = Board.new
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
        "..........",
      ]
    end
  end

  context 'a location is checked to validate whether it falls within the game board' do
    it 'returns true if a given location is on the board' do
      board = Board.new
      expect(board.on_board?(1, 1)).to eq true
    end

    it 'returns false if given a location with an x coord that is larger than the board' do
      board = Board.new
      expect(board.on_board?(11, 1)).to eq false
    end

    it 'returns false if given a location with a y coord that is larger than the board' do
      board = Board.new
      expect(board.on_board?(4, 12)).to eq false
    end

    it 'returns false if given a location with an x coord that is smaller than the board' do
      board = Board.new
      expect(board.on_board?(0, 1)).to eq false
    end

    it 'returns false if given a location with a y coord that is smaller than the board' do
      board = Board.new
      expect(board.on_board?(1, 0)).to eq false
    end
  end

  context 'a ship, hit or miss is placed at a point on the board' do
    it 'places an "S" at a given location within the board' do
      board = Board.new
      board.place_on_board(2, 3, "S")
      expect(board.show_board).to eq [
        "..........",
        "..........",
        ".S........",
        "..........",
        "..........",
        "..........",
        "..........",
        "..........",
        "..........",
        "..........",
      ]
    end

    it 'places an "X" at a given location within the board' do
      board = Board.new
      board.place_on_board(4, 6, "X")
      expect(board.show_board).to eq [
        "..........",
        "..........",
        "..........",
        "..........",
        "..........",
        "...X......",
        "..........",
        "..........",
        "..........",
        "..........",
      ]
    end

    it 'places an "O" at a given location within the board' do
      board = Board.new
      board.place_on_board(10, 10, "O")
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
        ".........O",
      ]
    end
  end

  context 'a board location is checked for whether it has already been shot' do
    it 'returns false if a given location contains "." ' do
      board = Board.new
      expect(board.already_shot_at?(1, 1)).to eq false
    end

    it 'returns true if a given location contains "X" ' do
      board = Board.new
      board.place_on_board(2, 2, "X")
      expect(board.already_shot_at?(2, 2)).to eq true
    end

    it 'returns true if a given location contains "O" ' do
      board = Board.new
      board.place_on_board(2, 2, "O")
      expect(board.already_shot_at?(2, 2)).to eq true
    end
  end

  context 'a location is checked for whether it contains a ship' do
    it 'returns true if a given location contains "S" ' do
      board = Board.new
      board.place_on_board(2, 2, "S")
      expect(board.ship_at?(2, 2)).to eq true
    end

    it 'returns false if a given location does not contain "S" ' do
      board = Board.new
      expect(board.ship_at?(2, 2)).to eq false
    end
  end

end