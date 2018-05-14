class Rover

  attr_accessor :name, :position, :direction

  def initialize(name="rover1", position=[1,2], direction="N")
    @name = name
    @position = position
    @direction = direction
  end

  def rotate(rotation)
  end


end
