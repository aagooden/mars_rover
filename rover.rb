class Rover

  attr_accessor :name, :position, :direction

  def initialize(name, position="position", direction="direction")
    @name = name
    @position = position
    @direction = direction
  end

end
