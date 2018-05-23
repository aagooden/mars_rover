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
		controller_hash = {"grid_size"=>[5, 5], "move1"=>[[1, 2], "N", "LMLMLMLMM"], "move2"=>[[3, 3], "E", "MMRMMRMRRM"]}
		number_of_rovers = 2
    controller = Controller.new("controller", controller_hash, number_of_rovers)
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

	# def test_grid_check_move_class
	# 	grid = Grid.new("grid1",[5,5])
	# 	possible_coordinates = [4,4]
	# 	checked_move = grid.check_move(possible_coordinates)
	# 	assert_equal(true, checked_move)
	# end
	#
	# def test_grid_check_move_1
	# 	grid = Grid.new("grid1",[5,5])
	# 	possible_coordinates = [4,4]
	# 	checked_move = grid.check_move(possible_coordinates)
	# 	assert_equal(true, checked_move)
	# end
	#
	# def test_grid_check_move_2
	# 	grid = Grid.new("grid1",[5,5])
	# 	possible_coordinates = [4,6]
	# 	checked_move = grid.check_move(possible_coordinates)
	# 	assert_equal(false, checked_move)
	# end
	#
	# def test_grid_check_move_3
	# 	grid = Grid.new("grid1",[5,5])
	# 	possible_coordinates = [-1,5]
	# 	checked_move = grid.check_move(possible_coordinates)
	# 	assert_equal(false, checked_move)
	# end
	#
	# def test_grid_check_move_4
	# 	grid = Grid.new("grid1",[5,5])
	# 	possible_coordinates = [1,-1]
	# 	checked_move = grid.check_move(possible_coordinates)
	# 	assert_equal(false, checked_move)
	# end

	def test_controller_rover_creation
		number_of_rovers = 2
		controller_hash = {"grid_size"=>[5, 5], "move1"=>[[1, 2], "N", "LMLMLMLMM"], "move2"=>[[3, 3], "E", "MMRMMRMRRM"]}
		controller1 = Controller.new("controller1", controller_hash, number_of_rovers)
		rovers = controller1.rovers
		name = rovers["rover2"].name
		assert_equal("rover2", name)
	end

	def test_controller_rover_creation_testing_for_correct_position
		number_of_rovers = 2
		controller_hash = {"grid_size"=>[5, 5], "move1"=>[[1, 2], "N", "LMLMLMLMM"], "move2"=>[[3, 3], "E", "MMRMMRMRRM"]}
		controller1 = Controller.new("controller1", controller_hash, number_of_rovers)
		rovers = controller1.rovers
		position = rovers["rover2"].position
		assert_equal([3,3], position)
	end

	def test_controller_rover_creation_testing_for_correct_dirction
		number_of_rovers = 2
		controller_hash = {"grid_size"=>[5, 5], "move1"=>[[1, 2], "N", "LMLMLMLMM"], "move2"=>[[3, 3], "E", "MMRMMRMRRM"]}
		controller1 = Controller.new("controller1", controller_hash, number_of_rovers)
		rovers = controller1.rovers
		direction = rovers["rover2"].direction
		assert_equal("E", direction)
	end

	def test_controller_rover_creation_testing_for_correct_moves
		number_of_rovers = 2
		controller_hash = {"grid_size"=>[5, 5], "move1"=>[[1, 2], "N", "LMLMLMLMM"], "move2"=>[[3, 3], "E", "MMRMMRMRRM"]}
		controller1 = Controller.new("controller1", controller_hash, number_of_rovers)
		rovers = controller1.rovers
		moves = rovers["rover2"].moves
		assert_equal("MMRMMRMRRM", moves)
	end

	def test_controller_move_rovers_class
		number_of_rovers = 1
		controller_hash = {"grid_size"=>[5, 5], "move1"=>[[1, 2], "N", "LMLMLMLMM"]}
		controller1 = Controller.new("controller1", controller_hash, number_of_rovers)
		current_rover = controller1.rovers["rover1"]
		actual = controller1.move_rovers(current_rover)
		assert_equal(Hash, actual.class)
	end

	def test_controller_move_rovers_M_only
		number_of_rovers = 1
		controller_hash = {"grid_size"=>[5, 5], "move1"=>[[1, 2], "N", "MMM"]}
		controller1 = Controller.new("controller1", controller_hash, number_of_rovers)
		current_rover = controller1.rovers["rover1"]
		actual = controller1.move_rovers(current_rover)
		expected = {"rover1"=>[[1,2,"N"],[1,3,"N"],[1,4,"N"],[1,5,"N"]]}
		assert_equal(expected, actual)
	end

	def test_controller_move_rovers_1
		number_of_rovers = 1
		controller_hash = {"grid_size"=>[5, 5], "move1"=>[[1, 2], "N", "LMLMLMLMM"]}
		controller1 = Controller.new("controller1", controller_hash, number_of_rovers)
		current_rover = controller1.rovers["rover1"]
		actual = controller1.move_rovers(current_rover)
		expected = {"rover1"=>[[1,2,"N"],[1,2,"W"],[0,2,"W"],[0,2,"S"],[0,1,"S"],[0,1,"E"],[1,1,"E"],[1,1,"N"],[1,2,"N"],[1,3,"N"]]}
		assert_equal(expected, actual)
	end

	def test_controller_move_rovers_2_rovers
		number_of_rovers = 2
		controller_hash = {"grid_size"=>[5, 5], "move1"=>[[1, 2], "N", "LMLMLMLMM"], "move2"=>[[3, 3], "E", "MMRMMRMRRM"]}
		controller1 = Controller.new("controller1", controller_hash, number_of_rovers)
		current_rover = controller1.rovers["rover2"]
		actual = controller1.move_rovers(current_rover)
		expected = {"rover2"=>[[3,3,"E"],[4,3,"E"],[5,3,"E"],[5,3,"S"],[5,2,"S"],[5,1,"S"],[5,1,"W"],[4,1,"W"],[4,1,"N"],[4,1,"E"],[5,1,"E"]]}
		assert_equal(expected, actual)
	end

	def test_controller_move_rovers_2_rovers_checking_rover1
		number_of_rovers = 2
		controller_hash = {"grid_size"=>[5, 5], "move1"=>[[1, 2], "N", "LMLMLMLMM"], "move2"=>[[3, 3], "E", "MMRMMRMRRM"]}
		controller1 = Controller.new("controller1", controller_hash, number_of_rovers)
		current_rover = controller1.rovers["rover1"]
		actual = controller1.move_rovers(current_rover)
		expected = {"rover1"=>[[1,2,"N"],[1,2,"W"],[0,2,"W"],[0,2,"S"],[0,1,"S"],[0,1,"E"],[1,1,"E"],[1,1,"N"],[1,2,"N"],[1,3,"N"]]}
		assert_equal(expected, actual)
	end

	# OLD def test_controller_move_rovers_2_rovers_checking_off_grid
	# 	number_of_rovers = 2
	# 	controller_hash = {"grid_size"=>[5, 5], "move1"=>[[1, 2], "N", "LMLMLMLMM"], "move2"=>[[5, 4], "E", "MLMLM"]}
	# 	controller1 = Controller.new("controller1", controller_hash, number_of_rovers)
	# 	current_rover = controller1.rovers["rover2"]
	# 	actual = controller1.move_rovers(current_rover)
	# 	expected = {"rover2"=>[[5,4,"E"],[6,4,"E",404],[6,4,"N",404],[6,5,"N",404],[6,5,"W",404],[5,5,"W"]]}
	# 	assert_equal(expected, actual)
	# end
	#
	# OLD def test_controller_move_rovers_2_rovers_checking_off_grid_south
	# 	number_of_rovers = 2
	# 	controller_hash = {"grid_size"=>[5, 5], "move1"=>[[1, 2], "N", "LMLMLMLMM"], "move2"=>[[3,0], "S", "MRMRM"]}
	# 	controller1 = Controller.new("controller1", controller_hash, number_of_rovers)
	# 	current_rover = controller1.rovers["rover2"]
	# 	actual = controller1.move_rovers(current_rover)
	# 	expected = {"rover2"=>[[3,0,"S"],[3,-1,"S",404],[3,-1,"W",404],[2,-1,"W",404],[2,-1,"N",404],[2,0,"N"]]}
	# 	assert_equal(expected, actual)
	# end

	def test_controller_move_rovers_2_rovers_checking_off_grid_pacman
		number_of_rovers = 2
		controller_hash = {"grid_size"=>[5, 5], "move1"=>[[1, 2], "N", "LMLMLMLMM"], "move2"=>[[5, 4], "E", "MLMLM"]}
		controller1 = Controller.new("controller1", controller_hash, number_of_rovers)
		current_rover = controller1.rovers["rover2"]
		actual = controller1.move_rovers(current_rover)
		expected = {"rover2"=>[[5,4,"E"],[0,4,"E"],[0,4,"N"],[0,5,"N"],[0,5,"W"],[5,5,"W"]]}
		assert_equal(expected, actual)
	end

	def test_controller_move_rovers_2_rovers_checking_off_grid_south_pacman
		number_of_rovers = 2
		controller_hash = {"grid_size"=>[5, 5], "move1"=>[[1, 2], "N", "LMLMLMLMM"], "move2"=>[[3,0], "S", "MRMRM"]}
		controller1 = Controller.new("controller1", controller_hash, number_of_rovers)
		current_rover = controller1.rovers["rover2"]
		actual = controller1.move_rovers(current_rover)
		puts actual
		expected = {"rover2"=>[[3, 0, "S"], [3, 5, "S"], [3, 5, "W"], [2, 5, "W"], [2, 5, "N"], [2, 0, "N"]]}
		assert_equal(expected, actual)
	end

	def test_grid_pac_man_move_1
		grid = Grid.new("grid1",[5,5])
		possible_coordinates = [6,4]
		checked_move = grid.pac_man_move(possible_coordinates)
		assert_equal([0,4], checked_move)
	end

	def test_grid_pac_man_move_2
		grid = Grid.new("grid1",[5,5])
		possible_coordinates = [4,6]
		checked_move = grid.pac_man_move(possible_coordinates)
		assert_equal([4,0], checked_move)
	end

	def test_grid_pac_man_move_3
		grid = Grid.new("grid1",[5,5])
		possible_coordinates = [-1,5]
		checked_move = grid.pac_man_move(possible_coordinates)
		assert_equal([5,5], checked_move)
	end

	def test_grid_pac_man_move_4
		grid = Grid.new("grid1",[5,5])
		possible_coordinates = [1,-1]
		checked_move = grid.pac_man_move(possible_coordinates)
		assert_equal([1,5], checked_move)
	end

	def test_multiple_instructions_array
		correct = "5 5\n1 1 N\nMMM\n2 2 E\nRRR"
		actual = multiple_instructions_array("5", "5", ["1", "2"], ["1", "2"], ["N", "E"], ["MMM", "RRR"])
		assert_equal(correct, actual)
	end
end
