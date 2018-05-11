class Rover

  attr_accessor :name, :position, :direction

  def initialize(name="rover1", position="position", direction="direction")
    @name = name
    @position = position
    @direction = direction
  end

  def set_rover_position(position)
    @position = position
  end

end
