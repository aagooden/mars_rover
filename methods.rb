require_relative "rover.rb"
require_relative "grid.rb"
require_relative "controller.rb"



def instructions_array(instructions="5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM")
  instructions = instructions.split("\n")
  return instructions
end

def controller_hash_creation(instructions,number_of_rovers=2)
  instructions_hash = {}
  information_array = instructions_array(instructions)
  puts "Information array is #{information_array}"
  instructions_hash["grid_size"] = controller_hash_creation_grid_size(instructions)
  for x in (1..number_of_rovers) do
    instructions_hash["move#{x}"] = [controller_hash_creation_rover_position(information_array[2 * x - 1]), controller_hash_creation_rover_direction(information_array[2 * x - 1]), information_array[2 * x]]
  end
  puts instructions_hash
  return instructions_hash
end

def controller_hash_creation_grid_size(instructions)
  grid_size = []
  information_array = instructions_array(instructions)
  grid_size = information_array[0.to_i].split(" ")
  grid_size = grid_size.map(&:to_i)
  return grid_size
end

def controller_hash_creation_rover_position(instructions)
  rover_position = []
  temp_array = instructions.split(" ")
  rover_position[0] = temp_array[0].to_i
  rover_position[1] = temp_array[1].to_i
  return rover_position
end

def controller_hash_creation_rover_direction(instructions)
  rover_direction = ""
  temp_array = instructions.split(" ")
  rover_direction = temp_array[2]
end
