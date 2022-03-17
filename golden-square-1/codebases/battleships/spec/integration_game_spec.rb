require 'game'
require 'player'
require 'board'

RSpec.describe 'Game integrations' do
  context 'the game starts' do
    it 'initializes player 1, and starts on their turn' do
      game = Game.new
      expect(game.current_player.class).to eq Player
      expect(game.current_player.player_name).to eq "Player 1"
    end

    it 'initializes player 2, with them as the opponent' do
      game = Game.new
      expect(game.opponent.class).to eq Player
      expect(game.opponent.player_name).to eq "Player 2"
    end

    it 'initializes 2 game boards' do
      game = Game.new
      expect(game.current_board.show_board).to eq [
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
      expect(game.opponent_board.show_board).to eq [
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
  end

  context 'the game changes turns' do
    it 'becomes player 2 turn' do
      game = Game.new
      game.next_turn
      expect(game.current_player.player_name).to eq "Player 2"
    end

    it 'alternates turns' do
      game = Game.new
      expect(game.current_player.player_name).to eq "Player 1"
      game.next_turn
      expect(game.current_player.player_name).to eq "Player 2"
      game.next_turn
      expect(game.current_player.player_name).to eq "Player 1"
      game.next_turn
      expect(game.current_player.player_name).to eq "Player 2"
    end
  end

  context 'a winner is chosen' do
    it 'returns false if both players have ships left' do
      game = Game.new
      expect(game.check_if_win).to eq false
    end

    it 'returns true if current player has had all their ships sunk' do
      game = Game.new
      expect(game.current_player).to receive(:ships_left?).and_return(false)
      expect(game.check_if_win).to eq true
    end
  end
end