require_relative "rover.rb"
require_relative "grid.rb"
require_relative "controller.rb"



def instructions_array(instructions="5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM")
  instructions = instructions.split("\n")
  return instructions
end

def controller_hash(instructions)
  instructions_hash = {}
  information_array = instructions_array(instructions)
  grid_size = information_array[0.to_i].split(" ")
  grid_size = grid_size.map(&:to_i)
  instructions_hash["grid_size"] = grid_size
  return instructions_hash
end
