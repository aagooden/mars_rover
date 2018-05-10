class Rover

  attr_accessor :name, :position, :direction

  def initialize(name, position="position", direction="direction")
    @name = name
    @position = position
    @direction = direction
  end

end


class Grid

  attr_accessor :name

  def initialize(name)
    @name = name
  end

end
