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
end
