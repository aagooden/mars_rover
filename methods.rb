class Rover

  attr_accessor :name, :position, :direction

  def initialize(name, position="position", direction="direction")
    @name = name
    @position = position
    @direction = direction
  end

end


class Grid

  attr_accessor :name, :size

  def initialize(name, size=[1,1])
    @name = name
    @size = size
  end

end
