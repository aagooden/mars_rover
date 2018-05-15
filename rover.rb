class Rover

  attr_accessor :name, :position, :direction, :moves

  def initialize(name="rover1", position=[1,2], direction="N", moves="moves")
    @name = name
    @position = position
    @direction = direction
    @moves = moves
  end

  def rotate(rotation)
    compass = ["N","E","S","W"]
    if rotation == "R"
      new_direction = compass[(compass.index(@direction)+1) - compass.length]
    else
      new_direction = compass[compass.index(@direction)-1]
    end
    @direction = new_direction
    return new_direction
  end

  def move()
    new_coordinates = []
    case @direction
      when "N"
        new_coordinates = [@position[0], @position[1]+1]
      when "E"
        new_coordinates = [@position[0]+1, @position[1]]
      when "S"
        new_coordinates = [@position[0], @position[1]-1]
      when "W"
        new_coordinates = [@position[0]-1, @position[1]]
    end
    return new_coordinates
  end




end
