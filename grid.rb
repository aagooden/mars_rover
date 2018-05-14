class Grid

  attr_accessor :name, :size

  def initialize(name="grid", size=[1,1])
    @name = name
    @size = size
  end

  def set_grid_size(grid_size)
    @size = grid_size
  end

  def check_move(move)
    return true
  end

end
