require_relative "rover.rb"
require_relative "grid.rb"
require_relative "controller.rb"



def multiple_instructions_array(grid_x_value, grid_y_value, rover_x_values_arr, rover_y_values_arr, rover_directions_arr, rover_moves_arr)

  # instructions = "#{grid_size_x} #{grid_size_y}\n#{rover1_start_x} #{rover1_start_y} #{rover1_direction}\n#{rover1_moves}\n#{rover2_start_x} #{rover2_start_y} #{rover2_direction}\n#{rover2_moves}"

  multiple_rover_instructions_string = ""

  multiple_rover_instructions_string = "#{grid_x_value} #{grid_y_value}"
  # puts multiple_rover_instructions_string.class
  # puts multiple_rover_instructions_string + rover_x_values_arr[0] + rover_y_values_arr[0] + rover_directions_arr[0] + rover_moves_arr[0]

  for value in (0...rover_x_values_arr.length) do
    multiple_rover_instructions_string = multiple_rover_instructions_string + "\n#{rover_x_values_arr[value]} #{rover_y_values_arr[value]} #{rover_directions_arr[value]}\n#{rover_moves_arr[value]}"
  end
  p "multiple_rover_instructions_string is #{multiple_rover_instructions_string}"
  return multiple_rover_instructions_string

# correct = "5 5\n1 1 N\nMMM\n2 2 E\nRRR"
end


def instructions_array(instructions="5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM")
  instructions = instructions.split("\n")
  return instructions
end

def controller_hash_creation(instructions,number_of_rovers=2)
  instructions_hash = {}
  information_array = instructions_array(instructions)
  # puts "Information array is #{information_array}"
  instructions_hash["grid_size"] = controller_hash_creation_grid_size(instructions)
  for x in (1..number_of_rovers) do
    instructions_hash["move#{x}"] = [controller_hash_creation_rover_position(information_array[2 * x - 1]), controller_hash_creation_rover_direction(information_array[2 * x - 1]), information_array[2 * x]]
  end
  # puts "Instruction hash is #{instructions_hash}"
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
