class Battleship
  def initialize(length, name)
    @length = length
    @placed = false
    @sunk = false
    @coords = Array.new(length) { [] }
    @hits = Array.new(length, false)
    @ship_name = name
  end

  def ship_name
    @ship_name
  end

  def length
    @length
  end

  def coords
    @coords
  end

  def sunk?
    @sunk
  end

  def placed?
    @placed
  end

  def hits
    @hits
  end

  def mark_ship_placed
    @placed = true
  end

  def sink_ship
    @sunk = true
  end

  def fill_coords(coordinates)
    @coords = coordinates
  end

  def take_hit(x, y)
    index = @coords.index([x, y])
    @hits[index] = true
    sink_ship if !@hits.include?(false)
  end
end