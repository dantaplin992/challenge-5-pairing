require 'player'
require 'board'
require 'battleship'

RSpec.describe 'Player-Board integration' do
  context 'the objects are initialized' do
    it 'instances 5 ships and puts them in the unplaced_ships list' do
      player = Player.new("Player 1")
      expect(player.unplaced_ships[0].class).to eq Battleship
      expect(player.unplaced_ships[1].class).to eq Battleship
      expect(player.unplaced_ships[2].class).to eq Battleship
      expect(player.unplaced_ships[3].class).to eq Battleship
      expect(player.unplaced_ships[4].class).to eq Battleship
    end

    it 'instances the ships with the correct lengths' do
      player = Player.new("Player 1")
      expect(player.unplaced_ships[0].length).to eq 5
      expect(player.unplaced_ships[1].length).to eq 4
      expect(player.unplaced_ships[2].length).to eq 3
      expect(player.unplaced_ships[3].length).to eq 3
      expect(player.unplaced_ships[4].length).to eq 2
    end

    it 'instances the ships with the correct names' do
      player = Player.new("Player 1")
      expect(player.unplaced_ships[0].ship_name).to eq "Carrier"
      expect(player.unplaced_ships[1].ship_name).to eq "Battleship"
      expect(player.unplaced_ships[2].ship_name).to eq "Cruiser"
      expect(player.unplaced_ships[3].ship_name).to eq "Submarine"
      expect(player.unplaced_ships[4].ship_name).to eq "Destroyer"
    end
  end

  context 'one of the ships is placed on the board' do
    it 'removes the named ship from the unplaced_ships list' do
      player = Player.new("Player 1")
      player.mark_ship_as_placed("Carrier")
      expect(player.unplaced_ships.count).to eq 4
      expect(player.unplaced_ships[0].ship_name).to eq "Battleship"
      expect(player.unplaced_ships[1].ship_name).to eq "Cruiser"
      expect(player.unplaced_ships[2].ship_name).to eq "Submarine"
      expect(player.unplaced_ships[3].ship_name).to eq "Destroyer"
    end

    it 'removes one particular named ship from the unplaced_ships list' do
      player = Player.new("Player 1")
      player.mark_ship_as_placed("Battleship")
      expect(player.unplaced_ships.count).to eq 4
      expect(player.unplaced_ships[0].ship_name).to eq "Carrier"
      expect(player.unplaced_ships[1].ship_name).to eq "Cruiser"
      expect(player.unplaced_ships[2].ship_name).to eq "Submarine"
      expect(player.unplaced_ships[3].ship_name).to eq "Destroyer"
    end
  end

  context 'the player checks for whether they still have ships that are not sunk' do
    it 'returns true if all ships are left' do
      player = Player.new("Player 1")
      expect(player.ships_left?).to eq true
    end

    it 'returns true if some ships are left, but not all' do
      player = Player.new("Player 1")
      player.unplaced_ships[0].sink_ship
      expect(player.ships_left?).to eq true
    end

    it 'returns false if all ships have been sunk' do
      player = Player.new("Player 1")
      player.unplaced_ships[0].sink_ship
      player.unplaced_ships[1].sink_ship
      player.unplaced_ships[2].sink_ship
      player.unplaced_ships[3].sink_ship
      player.unplaced_ships[4].sink_ship
      expect(player.ships_left?).to eq false
    end
  end
end