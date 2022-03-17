require 'game'

RSpec.describe Game do
  context 'the game is started' do
    it 'starts on turn 1' do
      new_game = Game.new
      expect(new_game.current_turn).to eq 1
    end
  end

  context 'the game changes turns' do
    it 'changes to turn 2' do
      new_game = Game.new
      new_game.next_turn
      expect(new_game.current_turn).to eq 2
    end
  end

  context 'the game checks to see if either player has won' do
  end
end