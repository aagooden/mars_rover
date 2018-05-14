require "minitest/autorun"
require_relative "../app.rb"
require_relative "../methods.rb"


class Mars_test < Minitest::Test

	def test_boolean
		assert_equal(true, true)
	end

  def test_rover_class_initialize
    rover = Rover.new("rover1")
    assert_equal("rover1", rover.name)
  end

	def test_grid_class_initialize
		grid = Grid.new("grid")
		assert_equal("grid", grid.name)
	end

	def test_rover_class_position
		rover = Rover.new("rover1", "position")
		assert_equal("position", rover.position)
	end

	def test_rover_class_direction
		rover = Rover.new("rover1", "position", "direction")
		assert_equal("direction", rover.direction)
	end

	def test_grid_class_size
		grid = Grid.new("grid")
		assert_equal([1,1], grid.size)
	end

	def test_instructions_array_class
		actual = instructions_array()
		assert_equal(Array, actual.class)
	end

	def test_instructions_array_for_correct_splitting
		instructions = "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"
		correct_array_return = ["5 5", "1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM"]
		actual = instructions_array(instructions)
		assert_equal(correct_array_return, actual)
	end

	def test_set_grid_size
		grid = Grid.new("grid")
		grid_size = [5,5]
		assert_equal([5,5], grid.set_grid_size(grid_size))
	end

	def test_set_rover_position
		rover = Rover.new("Rover1")
		position = [1,2]
		assert_equal([1,2], rover.position)
	end

	def test_set_rover_dirction
		rover = Rover.new("Rover1")
		direction = "N"
		assert_equal("N", rover.direction)
	end

	def test_controller_class_initialize
    controller = Controller.new("controller")
    assert_equal("controller", controller.name)
  end

	def test_controller_hash_creation_class
		function = controller_hash_creation("5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM")
		assert_equal(Hash, function.class)
	end

	def test_controller_hash_creation_grid_size
		function = controller_hash_creation_grid_size("5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM")
		assert_equal([5,5], function)
	end

	def test_controller_hash_creation_rover_position_is_an_array
		actual = controller_hash_creation_rover_position("1 2 N")
		assert_equal(Array, actual.class)
	end

	def test_controller_hash_creation_rover_position
		actual = controller_hash_creation_rover_position("1 2 N")
		assert_equal([1,2], actual)
	end

	def test_controller_hash_creation_rover_direction_is_a_string
		actual = controller_hash_creation_rover_direction("1 2 N")
		assert_equal(String, actual.class)
	end

	def test_controller_hash_creation_rover_direction
		actual = controller_hash_creation_rover_direction("1 2 N")
		assert_equal("N", actual)
	end

	def test_controller_hash_creation
		instructions = "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"
		number_of_rovers = 2
		actual = controller_hash_creation(instructions, number_of_rovers)
		expected = {"grid_size" => [5,5], "move1" => [[1,2],"N","LMLMLMLMM"], "move2" => [[3,3],"E","MMRMMRMRRM"]}
		assert_equal(expected, actual)
	end

	def test_controller_hash_creation_3_rovers
		instructions = "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM\n4 4 S\nMMRMMRMRRMLMRMMRRLLMMM"
		number_of_rovers = 3
		actual = controller_hash_creation(instructions, number_of_rovers)
		expected = {"grid_size" => [5,5], "move1" => [[1,2],"N","LMLMLMLMM"], "move2" => [[3,3],"E","MMRMMRMRRM"], "move3" => [[4,4],"S","MMRMMRMRRMLMRMMRRLLMMM"]}
		assert_equal(expected, actual)
	end

	def test_rover_rotate
		rover1 = Rover.new
		new_direction = rover1.rotate("R")
		assert_equal("E", new_direction)
	end

	def test_rover_move_class
		rover1 = Rover.new
		new_coordinates = rover1.move()
		assert_equal(Array, new_coordinates.class)
	end

	def test_rover_move_1
		rover1 = Rover.new
		new_coordinates = rover1.move()
		assert_equal([1,3], new_coordinates)
	end

	def test_grid_check_move_class
		grid = Grid.new("grid1",[5,5])
		possible_coordinates = [4,4]
		checked_move = grid.check_move(possible_coordinates)
		assert_equal(true, checked_move)
	end

	def test_grid_check_move_1
		grid = Grid.new("grid1",[5,5])
		possible_coordinates = [4,4]
		checked_move = grid.check_move(possible_coordinates)
		assert_equal(true, checked_move)
	end

	def test_grid_check_move_2
		grid = Grid.new("grid1",[5,5])
		possible_coordinates = [4,6]
		checked_move = grid.check_move(possible_coordinates)
		assert_equal(false, checked_move)
	end

	def test_grid_check_move_3
		grid = Grid.new("grid1",[5,5])
		possible_coordinates = [-1,5]
		checked_move = grid.check_move(possible_coordinates)
		assert_equal(false, checked_move)
	end

	def test_grid_check_move_4
		grid = Grid.new("grid1",[5,5])
		possible_coordinates = [1,-1]
		checked_move = grid.check_move(possible_coordinates)
		assert_equal(false, checked_move)
	end
end
