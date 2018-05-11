class Grid

  attr_accessor :name, :size

  def initialize(name="grid", size=[1,1])
    @name = name
    @size = size
  end

  def set_grid_size(information_array)
    grid_size = information_array[0.to_i].split(" ")
    grid_size = grid_size.map(&:to_i)#converts array of string digits to array of integers
  end

end
