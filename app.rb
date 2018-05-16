require "sinatra"
require_relative "methods.rb"
enable :sessions


get "/" do
	erb :welcome
end


post "/mission_info" do
	grid_size_x = params[:grid_x_value].to_i
	grid_size_y = params[:grid_y_value].to_i
	session[:grid_size] = [grid_size_x, grid_size_y]

	rover1_start_x = params[:rover1_x_value].to_i
	rover1_start_y = params[:rover1_y_value].to_i
	rover1_direction = params[:rover1_direction]
	rover1_moves = params[:rover1_moves]

	rover2_start_x = params[:rover2_x_value].to_i
	rover2_start_y = params[:rover2_y_value].to_i
	rover2_direction = params[:rover2_direction]
	rover2_moves = params[:rover2_moves]

	session[:number_of_rovers] = 2

	instructions = "#{grid_size_x} #{grid_size_y}\n#{rover1_start_x} #{rover1_start_y} #{rover1_direction}\n#{rover1_moves}\n#{rover2_start_x} #{rover2_start_y} #{rover2_direction}\n#{rover2_moves}"
	# instructions = "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"
	controller_hash = controller_hash_creation(instructions, session[:number_of_rovers])
	session[:controller1] = Controller.new("controller1", controller_hash, session[:number_of_rovers])
	rover_routes = {}
	for x in (1..session[:number_of_rovers]) do
		current_rover = session[:controller1].rovers["rover#{x}"]
		rover_route = session[:controller1].move_rovers(current_rover)
		rover_route = rover_route["rover#{x}"]
		rover_routes["rover#{x}"] = rover_route
	end
	session[:rover_routes] = rover_routes
	erb :mission
end

# @rovers["rover#{x}"] = Rover.new
