class Rover

  attr_accessor :name, :position, :direction

  def initialize(name="rover1", position=[1,2], direction="N")
    @name = name
    @position = position
    @direction = direction
  end

  def rotate(rotation)
    compass = ["N","E","S","W"]
    if rotation == "R"
      new_direction = compass[compass.index(@direction)+1]
    else
      new_direction = compass[compass.index(@direction)-1]
    end
    @direction = new_direction
    return new_direction
  end

  def move()
  end




end
