class Rover

  attr_accessor :name, :position

  def initialize(name, position="position")
    @name = name
    @position = position
  end

end


class Grid

  attr_accessor :name

  def initialize(name)
    @name = name
  end

end
