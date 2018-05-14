require_relative "rover.rb"
require_relative "grid.rb"
require_relative "controller.rb"



def instructions_array(instructions="5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM")
  instructions = instructions.split("\n")
  return instructions
end

def controller_hash_creation(instructions)
  instructions_hash = {}
  information_array = instructions_array(instructions)

  return instructions_hash
end

def controller_hash_creation_grid_size(instructions)
end

def controller_hash_creation_rover_position(instructions, controller_hash)
end
