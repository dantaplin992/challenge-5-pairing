class UserInterface
  def initialize(io, game)
    @io = io
    @game = game
  end

  def run
    show "Welcome to the game!"
    show "Player 1, Set up your ships first."
    unless @game.current_player.unplaced_ships.empty?
      ship_placement(@game.current_player, @game.current_board, @game.placer_1)
    end
    
  end

  def ship_placement(player, board, placer)
    show "You have these ships remaining: #{ships_unplaced_message(player)}"
    details = prompt_for_ship_placement
    placement_success = placer.place_ship(details[:row], details[:col], details[:ship_name], details[:orientation])
    if placement_success
      show "Ship placed"
      show "This is your current board:"
      show format_board(board)
    end
    
  end

  private

  def show(message)
    @io.puts(message)
  end

  def prompt(message)
    @io.puts(message)
    return @io.gets.chomp
  end

  def ships_unplaced_message(player)
    remaining_names = []
    remaining_ships = player.unplaced_ships
    for ship in remaining_ships do 
      remaining_names << "#{ship.ship_name} (#{ship.length})"
    end
    return remaining_names.join(", ")
  end

  def prompt_for_ship_placement
    ship_name = prompt "Which do you wish to place?"
    ship_orientation = prompt "Vertical or horizontal? [vh]"
    ship_row = prompt "Which column?"
    ship_col = prompt "Which row?"
    {
      ship_name: ship_name,
      orientation: ship_orientation,
      row: ship_row.to_i,
      col: ship_col.to_i
    }
  end

  def format_board(board)
    return board.show_board.join("\n")
  end
end
