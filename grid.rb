class Grid

  attr_accessor :name, :size

  def initialize(name="grid", size=[1,1])
    @name = name
    @size = size
  end

  def set_grid_size(grid_size)
    @size = grid_size
  end

  def pac_man_move(move)
    if move[0] > @size[0]
        new_move = [0,move[1]]
      elsif move[0] < 0
        new_move = [@size[0],move[1]]
      elsif move[1] > @size[1]
        new_move = [move[0],0]
      elsif move[1] < 0
        new_move = [move[0],@size[1]]
      else
        new_move = move
    end
    return new_move

  end

  # This is the function for the original functionality of the app
  # def check_move(move)
  #   if move[0] > @size[0] || move[0] < 0
  #     return false
  #   elsif move[1] > @size[1] || move[1] < 0
  #     return false
  #   else
  #     return true
  #   end
  # end

end
