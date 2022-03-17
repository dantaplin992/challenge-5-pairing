require 'battleship'

RSpec.describe Battleship do
  context 'object is instantiated' do
    it 'returns false when sunk? is called' do
      ship = Battleship.new(2, "Destroyer")
      expect(ship.sunk?).to eq false
    end

    it 'returns false when placed? is called' do
      ship = Battleship.new(2, "Destroyer")
      expect(ship.placed?).to eq false
    end

    it 'returns a list of hits on the ship, all false' do
      ship = Battleship.new(2, "Destroyer")
      expect(ship.hits).to eq [false, false]
    end

    it 'creates an empty list of the coordinates of all points on the ship' do
      ship = Battleship.new(2, "Destroyer")
      expect(ship.coords).to eq [[], []]
    end
  end

  context 'the ship is placed on the board' do
    it 'changes @placed to true' do
      ship = Battleship.new(2, "Destroyer")
      ship.mark_ship_placed
      expect(ship.placed?).to eq true
    end

    it 'fills the coordinates of each point on the ship' do
      ship = Battleship.new(2, "Destroyer")
      ship.fill_coords([[1, 1], [2, 1]])
      expect(ship.coords).to eq [[1, 1], [2, 1]]
    end
  end

  context 'the ship is sunk' do
    it 'marks @sunk as true' do
      ship = Battleship.new(2, "Destroyer")
      ship.sink_ship
      expect(ship.sunk?).to eq true
    end
  end

  context 'the ship is hit' do
    it 'takes x and y coords and marks the corresponding point on the ship as hit' do
      ship = Battleship.new(2, "Destroyer")
      ship.fill_coords([[1, 1], [2, 1]])
      ship.take_hit(1, 1)
      expect(ship.hits).to eq [true, false]
    end

    it 'takes x and y coords and marks the corresponding point on the ship as hit' do
      ship = Battleship.new(2, "Destroyer")
      ship.fill_coords([[1, 1], [2, 1]])
      ship.take_hit(2, 1)
      expect(ship.hits).to eq [false, true]
    end

    it 'checks whether all pojnts have been hit, and marks the ship as sunk if true' do
      ship = Battleship.new(3, "Submarine")
      ship.fill_coords([[2, 2], [3, 2], [4, 2]])
      ship.take_hit(2, 2)
      ship.take_hit(3, 2)
      ship.take_hit(4, 2)
      expect(ship.sunk?).to eq true
    end
  end
end