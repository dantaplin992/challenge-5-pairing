require 'player'

RSpec.describe Player do
  context 'the class is initialized' do
    it 'returns the player name' do
      player = Player.new("Player 1")
      expect(player.player_name).to eq "Player 1"
    end

    it 'returns the player name' do
      player = Player.new("Player 2")
      expect(player.player_name).to eq "Player 2"
    end

    it 'initializes ships_left? as true' do
      player = Player.new("P1")
      expect(player.ships_left?).to eq true
    end
  end
end