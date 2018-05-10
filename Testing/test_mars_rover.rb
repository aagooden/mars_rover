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
    puts "#{rover.name}"
  end

end
