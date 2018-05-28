require "sinatra"
require_relative "methods.rb"
enable :sessions


get "/" do
	erb :welcome
end




post "/mission_info" do

	grid_x_value = params[:grid_x_value]
	grid_y_value = params[:grid_y_value]

	rover_x_values_arr = params[:rover_x_values]
	rover_y_values_arr = params[:rover_y_values]
	rover_directions_arr = params[:roverDirection]
	rover_moves_arr = params[:rover_moves]

	puts "grid_x_value is #{grid_x_value}, AND grid_y_value is #{grid_y_value}, AND rover_x_values_arr is #{rover_x_values_arr}, rover_y_values_arr is #{rover_y_values_arr} rover_directions_arr is #{rover_directions_arr}, AND rover_moves_arr is #{rover_moves_arr}"


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

	session[:number_of_rovers] = rover_x_values_arr.length

	instructions = multiple_instructions_array(grid_x_value, grid_y_value, rover_x_values_arr, rover_y_values_arr, rover_directions_arr, rover_moves_arr)

	# instructions = "#{grid_size_x} #{grid_size_y}\n#{rover1_start_x} #{rover1_start_y} #{rover1_direction}\n#{rover1_moves}\n#{rover2_start_x} #{rover2_start_y} #{rover2_direction}\n#{rover2_moves}"
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
	p session[:rover_routes]
	erb :mission2
end

post "/again" do
	erb :welcome
end
