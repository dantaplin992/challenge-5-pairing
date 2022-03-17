require 'ship_placer'

RSpec.describe ShipPlacer do
  context 'the class is initialized' do
    it 'initializes with an instance of board' do
      board = double(:board)
      placer = ShipPlacer.new(board)
      expect(placer.board).to eq board
    end
  end

  it 'converts some input into a set of vertical coordinates' do
    board = double(:board)
    placer = ShipPlacer.new(board)
    expect(placer.convert_coords(1, 1, 4, "v")).to eq [[1, 1], [2, 1], [3, 1], [4, 1]]
  end

  it 'converts some input into a set of vertical coordinates' do
    board = double(:board)
    placer = ShipPlacer.new(board)
    expect(placer.convert_coords(2, 3, 3, "v")).to eq [[2, 3], [3, 3], [4, 3]]
  end

  it 'converts some input into a set of horizontal coordinates' do
    board = double(:board)
    placer = ShipPlacer.new(board)
    expect(placer.convert_coords(2, 3, 3, "h")).to eq [[2, 3], [2, 4], [2, 5]]
  end
end