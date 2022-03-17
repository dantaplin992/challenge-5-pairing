class Game
  def initialize
    # 2 boards
    # 2 players
  end

  def take_shot(x, y) # takes coords of shot
    # calls receive_shot on corresponding board
    # returns "hit" if receive_shot = true, "miss" if false
  end

  def check_win
    # each turn, checks @board.placed_ships to see if all ships have been hit
    # changes @game_over to true if win
    # returns winner if true, nil if false
  end

  def next_turn
    # check_win
    # @turn += 1
    # if @turn is odd, p1's turn; p2's turn if even
    # changes instance variables to reflect whose turn it is
  end

  def current_turn
    # returns player whose turn it is currently
  end

end

class Player
  def initialize(my_board, opponent_board) # takes instances of Board
  end

end

class Board
  def initialize
    # initializes with blank board - 2d array of "."
  end

  def game_board
    # Returns the board with ships, hits and misses
  end

  def rows
    # returns 10
  end

  def cols
    # returns 10
  end

  def unplaced_ships
    # returns array list of ships not placed yet
  end

  def placed_ships
    # returns array of ships that have been placed
    # shows 
  end

  def place_ship(x, y, orientation) # takes x and y coord integers
    # convert_ship_to_coords >> coord list
    # checks if ship_at coords
    # >> fail if true
    # >> changes coord to "S" if false
  end

  def convert_ship_to_coords(x, y, length, orientation)
    # returns list of coords
  end

  def ship_at?(board, x, y) # takes x and y coord integers
    # returns bool if board position is "S"
  end

  def on_board?(coord_list)
    # returns bool if all coords fall within the board
  end

  def receive_shot(x, y)
    # checks ship_at?
    # changes coord to "X" if true, "O" if false
    # returns the bool
  end
end

# > store board *
#   >> 2d array, rows() by cols(), initializes all as "."
# > place ship *
#  >> gets coords of entire ship
#  >> changes all coord spots from "." to "S"
# > view board *
# > ship_at? *
#  >> checks @board at given x and y coords
#  >> returns true if "S", false if "."

#  > 5, 4, 3, 3, 2 *
#  >> place ship() removes from list
# > run() loops until all ships placed

# > expand run() method
#  >> place all ships
#  >> view your board
#  >> view hits/misses
#  >> take a shot
#  >> see whether it hit or miss

# > place ship() *
#  >> if h or v
#  >> place_h() & place_v() methods

# > place ship throws error if x or y coord not present *
#  >> allows to choose again

# > place ship throws error if one of the coords is "S" *
#  >> calls ship_at? for each ship coord
#  >> allows to choose again

# > opponent
#  >> player class?
#  >> board class?
#  >> take_shot() checks other player's board, returns whether hit or miss
#  >> changes other player's board to reflect

# > shows hits and misses
#  >> returns message when ship is sunk
#  >> stores coords of all placed ships, iterates & checks for player's x and y coords when they take a shot
#  >> loops if all coords of a ship are hit, return the message

# > every turn, iterates over all placed ships
#  >> if all are hit, lose
#  >> other player wins
#  >> bool game_over initializes as false

# > displays other player's board, but without ships
#  >> shows "X" and "O", but changes "S" to "."

# > initialize 2 players, 2 boards
# > takes turns
#  >> next turn() method
#   >> if player 1 turn, change to player 2 & vice versa
#   >> OR turn counter, if odd p1, if even p2
#  >> gameplay loop
#   >> both players place ships until all are gone
#   >> while !game_over
#   >> view board, take shot, process shot, check if win, next turn