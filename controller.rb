class Controller

  attr_accessor :name, :rovers

  def initialize(name="controller", controller_hash={}, number_of_rovers=2)
    @name = name
    @controller_hash = controller_hash
    puts "This is controller hash move1 !!!!!!! #{controller_hash["move1"][0]}"
    @number_of_rovers = number_of_rovers
    @rovers = {}
    for x in (1..@number_of_rovers) do
      puts "This is controller_hash #{controller_hash}"
      @rovers["rover#{x}"] = Rover.new("rover#{x}", controller_hash["move#{x}"][0], controller_hash["move#{x}"][1], controller_hash["move#{x}"][2])
    end
  end



end
