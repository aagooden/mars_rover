class Controller

  attr_accessor :name, :rovers

  def initialize(name="controller", controller_hash={}, number_of_rovers=2)
    @name = name
    @controller_hash = controller_hash
    # puts "This is controller hash grid_size !!!!!!! #{controller_hash["grid_size"]}"
    @grid = Grid.new("grid",controller_hash["grid_size"])
    @number_of_rovers = number_of_rovers
    @rovers = {}
    for x in (1..@number_of_rovers) do
      # puts "This is controller_hash #{controller_hash}"
      @rovers["rover#{x}"] = Rover.new("rover#{x}", controller_hash["move#{x}"][0], controller_hash["move#{x}"][1], controller_hash["move#{x}"][2])
    end
  end


  def move_rovers(current_rover)
    route_hash = {}
    route_hash[current_rover.name] = []
    route_hash[current_rover.name].push(current_rover.position + [current_rover.direction])
    p "current_rover"
      rover_moves = current_rover.moves.each_char.to_a
      rover_moves.each do |r_move|
          case r_move
            when "M"
              new_coordinates = current_rover.move
                # if @grid.check_move(new_coordinates)
              new_coordinates = @grid.pac_man_move(new_coordinates)
                  route_hash[current_rover.name].push(new_coordinates + [current_rover.direction])
                  current_rover.position = new_coordinates
                # else
                #   route_hash[current_rover.name].push(new_coordinates + [current_rover.direction])
                #   current_rover.position = new_coordinates
                # end
            else
              new_direction = current_rover.rotate(r_move)
                # if @grid.check_move(current_rover.position) == false
                  route_hash[current_rover.name].push(current_rover.position + [new_direction])
                # else
                  # route_hash[current_rover.name].push(current_rover.position + [new_direction])
                # end
              current_rover.direction = new_direction
              # puts "This is the route_hash in move_rovers when L or R #{route_hash}"
          end
      end
    return route_hash
  end



  # def move_rovers(current_rover)
  #   route_hash = {}
  #   route_hash[current_rover.name] = []
  #   route_hash[current_rover.name].push(current_rover.position + [current_rover.direction])
  #     rover_moves = current_rover.moves.each_char.to_a
  #     rover_moves.each do |r_move|
  #         case r_move
  #           when "M"
  #             new_coordinates = current_rover.move
  #               if @grid.check_move(new_coordinates)
  #                 route_hash[current_rover.name].push(new_coordinates + [current_rover.direction])
  #                 current_rover.position = new_coordinates
  #               else
  #                 route_hash[current_rover.name].push(new_coordinates + [current_rover.direction] + [404])
  #                 current_rover.position = new_coordinates
  #               end
  #           else
  #             new_direction = current_rover.rotate(r_move)
  #               if @grid.check_move(current_rover.position) == false
  #                 route_hash[current_rover.name].push(current_rover.position + [new_direction] + [404])
  #               else
  #                 route_hash[current_rover.name].push(current_rover.position + [new_direction])
  #               end
  #             current_rover.direction = new_direction
  #             # puts "This is the route_hash in move_rovers when L or R #{route_hash}"
  #         end
  #     end
  #   return route_hash
  # end
end

# {"rover1"=>[[1,2,"N"],[0,2,"W"],[0,1,"S"],[1,1,"E"],[1,2,"N"],[1,3,"N"]]}
