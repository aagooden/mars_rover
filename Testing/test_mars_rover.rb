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
		assert_equal([1,2], rover.set_rover_position(position))
	end

	def test_set_rover_dirction
		rover = Rover.new("Rover1")
		direction = "N"
		assert_equal("N", rover.set_rover_direction(direction))
	end

	def test_controller_class_initialize
    controller = Controller.new("controller")
    assert_equal("controller", controller.name)
  end

	def test_controller_hash_creation
		function = controller_hash("5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM")
		assert_equal(Hash, function.class)
	end

end
