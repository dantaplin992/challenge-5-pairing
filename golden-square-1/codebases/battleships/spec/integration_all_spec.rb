require 'user_interface'
require 'game'
require 'player'
require 'board'
require 'battleship'
require 'ship_placer'
require 'shooter'

RSpec.describe 'Battleships game' do
  context 'ship setup scenario' do
    it 'allows player to place a ship on the board' do
      io = double(:io)
      game = Game.new
      interface = UserInterface.new(io, game)
      expect(io).to receive(:puts).with("Welcome to the game!")
      expect(io).to receive(:puts).with("Player 1, Set up your ships first.")
      expect(io).to receive(:puts).with("You have these ships remaining: Carrier (5), Battleship (4), Cruiser (3), Submarine (3), Destroyer (2)")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("Carrier\n")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v\n")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("3\n")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(io).to receive(:puts).with("Ship placed")
      expect(io).to receive(:puts).with("This is your current board:")
      expect(io).to receive(:puts).with([
                "..........",
                "..S.......",
                "..S.......",
                "..S.......",
                "..S.......",
                "..S.......",
                "..........",
                "..........",
                "..........",
                ".........."
              ].join("\n"))
      interface.run
    end

    it 'allows player 1 to place all their ships' do
      io = double(:io)
      game = Game.new
      interface = UserInterface.new(io, game)
      expect(io).to receive(:puts).with("Welcome to the game!")
      expect(io).to receive(:puts).with("Player 1, Set up your ships first.")
      expect(io).to receive(:puts).with("You have these ships remaining: Carrier (5), Battleship (4), Cruiser (3), Submarine (3), Destroyer (2)")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("Carrier\n")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v\n")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("3\n")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(io).to receive(:puts).with("Ship placed")
      expect(io).to receive(:puts).with("This is your current board:")
      expect(io).to receive(:puts).with([
                "..........",
                "..S.......",
                "..S.......",
                "..S.......",
                "..S.......",
                "..S.......",
                "..........",
                "..........",
                "..........",
                ".........."
              ].join("\n"))
      expect(io).to receive(:puts).with("You have these ships remaining: Battleship (4), Cruiser (3), Submarine (3), Destroyer (2)")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("Battleship\n")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v\n")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("4\n")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(io).to receive(:puts).with("Ship placed")
      expect(io).to receive(:puts).with("This is your current board:")
      expect(io).to receive(:puts).with([
                "..........",
                "..SS......",
                "..SS......",
                "..SS......",
                "..SS......",
                "..S.......",
                "..........",
                "..........",
                "..........",
                ".........."
              ].join("\n"))
      expect(io).to receive(:puts).with("You have these ships remaining: Cruiser (3), Submarine (3), Destroyer (2)")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("Cruiser\n")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v\n")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("5\n")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(io).to receive(:puts).with("Ship placed")
      expect(io).to receive(:puts).with("This is your current board:")
      expect(io).to receive(:puts).with([
                "..........",
                "..SSS.....",
                "..SSS.....",
                "..SSS.....",
                "..SS......",
                "..S.......",
                "..........",
                "..........",
                "..........",
                ".........."
              ].join("\n"))
      expect(io).to receive(:puts).with("You have these ships remaining: Submarine (3), Destroyer (2)")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("Submarine\n")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v\n")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("6\n")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(io).to receive(:puts).with("Ship placed")
      expect(io).to receive(:puts).with("This is your current board:")
      expect(io).to receive(:puts).with([
                "..........",
                "..SSSS....",
                "..SSSS....",
                "..SSSS....",
                "..SS......",
                "..S.......",
                "..........",
                "..........",
                "..........",
                ".........."
              ].join("\n"))
      expect(io).to receive(:puts).with("You have these ships remaining: Destroyer (2)")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("Destroyer\n")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v\n")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("5\n")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("2\n")
      expect(io).to receive(:puts).with("Ship placed")
      expect(io).to receive(:puts).with("This is your current board:")
      expect(io).to receive(:puts).with([
                "..........",
                "..SSSSS...",
                "..SSSSS...",
                "..SSSS....",
                "..SS......",
                "..S.......",
                "..........",
                "..........",
                "..........",
                ".........."
              ].join("\n"))
      interface.run
    end
  end
end