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
    if move[0] > @size[0] || move[0] < 0
      return false
    elsif move[1] > @size[1] || move[1] < 0
      return false
    else
      return true
    end
  end

end
