require "minitest/autorun"
require_relative "../app.rb"

class Mars_test < Minitest::Test

	def test_boolean
		assert_equal(true, true)
	end

end
