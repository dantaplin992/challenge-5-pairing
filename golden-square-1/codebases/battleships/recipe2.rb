# As a player
# So that I can prepare for the game
# I would like to place a ship in a board location

# As a player
# So that I can play a more interesting game
# I would like to have a range of ship sizes to choose from

# As a player
# So the game is more fun to play
# I would like a nice command line interface that lets me enter ship positions and
# shots using commands (rather than using IRB to interact with objects)

# As a player
# So that I can create a layout of ships to outwit my opponent
# I would like to be able to choose the directions my ships face in

# As a player
# So that I can have a coherent game
# I would like ships to be constrained to be on the board

# As a player
# So that I can have a coherent game
# I would like ships to be constrained not to overlap

# As a player
# So that I can win the game
# I would like to be able to fire at my opponent's board

# As a player
# So that I can refine my strategy
# I would like to know when I have sunk an opponent's ship

# As a player
# So that I know when to finish playing
# I would like to know when I have won or lost

# As a player
# So that I can consider my next shot
# I would like to be able to see my hits and misses so far

# As a player
# So that I can play against a human opponent
# I would like to play a two-player game

# -------------- #

# > place ship
# > choose ship
# > enter shots
# > choose directions/orientations
# > constrain ships to board
# > constrain ships to not overlap
# > sink ships
# > win/lose
# > see hits/misses
# > take turns

# -------------- #

# Flow of the game:
# > initialize stuff
# > P1 place ships
# > P2 place ships
# > Take turns:
#  >> check if win
#  >> see own board
#  >> see other board
#  >> take shot
#  >> check hit or miss
#  >> next turn

# -------------- #

# Each turn:

#  > Game switches current_board and opponent_board
#  > Game asks current Player if it has any ships left
#   >> if false, opponent is the winner
#  > shot input is given (x, y)
#  > intput is given to Board
#   >> validates whether it is on the board
#   >> validates whether it has already been shot at before
#   >> returns whether it is a hit or miss
#   >> writes the result to the board
#   >> if hit, passes x and y to Player
# > Player checks all Battleships to see if coord belongs to any
# > Battleship stores the hit & returns if it is sunk
# > Player asks each Battleship whether it is sunk, updates ships_left

# -------------- #


# interface class => handles messages to/from the players
# => integrates with Game
# => integrates with Board
# => integrates with Player

# game class => controls the flow of the game
# => integrates with Interface
# => integrates with Player
# => integrates with Board
# => integrates with Shooter

# player class => controls player actions
# => integrates with Game
# => integrates with Board
# => integrates with Battleship

# board class => stores the current state of each game board
# => integrates with Player
# => integrates with Interface

# ship placer class => handles ship placement & validation
# => integrates with Interface
# => integrates with Board

# shooter class => handles shots taken by each player

# battleship class => stores the state of each battleship
# => integrates with Player

Integrations:

Interface <=> Game
Interface <=> Player
Interface <=> Board
Interface <=> ShipPlacer

Game <=> Player
Game <=> board

Player <=> Board
Player <=> Battleship

Board <=> ShipPlacer


class UserInterface # gives messages & receives input from players
  def initialize(io, game) # <= takes instances of Kernel and Game
    # initializes current_player as p1 -- gets from Game
    # initializes opponent_player as p2 -- gets from Game
    # initializes Shooter instance
  end

  def run
    # welcome message

    # place ships loop, Player 1
    # >> place_your_ships
    # place ships loop, Player 2

    # while win is false
    # >> main_gameplay_loop

    # else:
    # >> display winner
    # >> prompt for end
  end

  private

  def display_winner(winner) # <= takes Player object of winner
    # puts #{winner} wins!
  end

  def place_your_ships
    # shows the player which ships they have left
    # prompts for input
    # calls ShipPlacer to place the selected ship
  end

  def main_gameplay_loop
    # >> re-assign variables
    # >> show own board
    # >> show hits and misses
    # >> prompt for shot
    # >> display hit or miss message
    # >> next turn
  end 

  def show(message) # <= takes string message
    # puts message with Kernel (io double for testing)
  end

  def prompt(message) # <= takes string message
    # puts the message
    # returns string taken from io.gets
  end

  def ships_unplaced_message
    # returns a list of ships that haven't been placed yet
  end

  def prompt_for_ship_placement
    # prompts the player for x, y, length and orientation of ship to be placed
    # calls ShipPlacer.place_ship with input
    # returns nothing
  end

  def format_board(board) # <= takes which board to format
    # formats the current player's board for viewing in terminal
    # returns the formatted board
  end

  def format_hits_and_misses
  end
end

class Game # controls the flow of the game < -- UNIT TESTED -->
  def initialize
    # initializes the 2 players
    # stores whose turn it is
    # stores bool if winner
  end

  def next_turn
    # changes instance variable of whose turn it is to other player
    # returns nothing
  end

  def current_turn
    # returns the current @turn counter
  end

  def current_player
    # returns the Player object whose turn it is
  end

  def opponent
    # returns the opponent's Player object
  end

  def check_if_win
    # checks players to see if all ships have been sunk
    # returns bool and the winner
  end
end

class Player # represents each player <-- UNIT TESTED -->
  def initialize
  end

  def player_name
    # returns the name given to the player -- "Player 1" or "Player 2"
  end

  def board
    # returns associated instance of Board
  end

  def unplaced_ships
    # returns list of ships yet to be placed
  end

  def placed_ships
    # returns list of ship objects on the board
  end

  def ships_left?
    # returns bool whether the player has any ships that have not been sunk yet
  end
end

class Board # represents each player's game board < -- UNIT TESTED -- >
            # includes a map of blank spaces, ships, hits and misses
  def initialize
  end

  def show_board
    # returns the current game board
  end

  def ship_at?(x, y) # <= takes x and y coords
    # returns bool if there is an "S" at the given location
  end

  def already_shot_at?(x, y) # <= takes x and y coords
    # returns bool if there is an "X" or "O" at the given location
  end

  def on_board?(x, y) # <= takes x and y coords
    # returns bool if all coords fall within the board
  end

  def place_on_board(x, y, str) # <= takes int x and y coord and string S, X or O
    # replaces a given spot on the board with an input
    # valid inpiuts are "S" for ship, "X" for hit, or "O" for miss
  end
end

class Battleship # represents each ship < -- UNIT TESTED -- >
  def initialize(length) # <= takes length of the ship
    # initializes @sunk variable as false
    # initializes @placed variable as false
    # initializes array list of coord points on ship
    # initializes array list of hits on ship
  end

  def placed?
    # returns bool if the ship is on the board
  end

  def sunk?
    # returns @sunk variable
  end

  def sink_ship
    # marks variable of @sunk as true
  end

  def hits
    # returns which of the ship's spaces have been hit
  end

  def mark_ship_placed
    # marks @placed as true, returns nothing
  end

  def take_hit(x, y)
    # marks the corresponding hit point on the ship as true, returns nothing
  end
end

class ShipPlacer # places ships on the board at the start of the game <-- UNIT TESTED -->
                 # an instance per board
                 # validates whether a ship position is valid
  def initialize(board) # <= takes which board to place ships onto
  end

  def convert_coords(x, y, length, orientation) # <= takes coords, ship length and horz/vert orientation
    # converts input into a set of x and y coords for ship placement
    # returns as a list of coords (2d array) [[1, 1], [1, 2]]
  end

  def place_ship(x, y, name, orientation) # <= takes coords, ship length and horz/vert orientation
    # finds length of ship with name
    # calls convert_coords
    # validates with Board.on_board?
    # validates with Board.ship_at?
    # places a ship at each of the list of coords if valid
    # tells player to mark ship as placed
  end
end

class Shooter # fires a shot at the opponent's board with given location <-- REDUNDANT -->

  def shoot_at(opponent, x, y) # <= takes Board instance and int x & y coords of shot
                               # <= input given by interface prompts
    # validates whether target location is on the board with Board.on_board?
    # validates whether shot is a hit or miss with Board.ship_at?
    # places "X" or "O" on the board at target
    # returns "hit" or "miss"
  end
end