require 'battleship'

class Player
  def initialize(name)
    @name = name
    @carrier = Battleship.new(5, "Carrier")
    @battleship = Battleship.new(4, "Battleship")
    @cruiser = Battleship.new(3, "Cruiser")
    @submarine = Battleship.new(3, "Submarine")
    @destroyer = Battleship.new(2, "Destroyer")
    @unplaced_ships = [@carrier, @battleship, @cruiser, @submarine, @destroyer]
  end

  def player_name
    @name
  end

  def unplaced_ships
    @unplaced_ships
  end

  def mark_ship_as_placed(name_to_remove)
    for ship in @unplaced_ships do
      if ship.ship_name == name_to_remove
        @unplaced_ships.delete(ship)
        break
      end
    end
  end

  def ships_left?
    for ship in [@carrier, @battleship, @cruiser, @submarine, @destroyer] do
      return true if !ship.sunk?
    end
    return false
  end
end