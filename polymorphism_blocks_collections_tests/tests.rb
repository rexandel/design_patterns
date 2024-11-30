require 'minitest/autorun'
require './array_processor.rb'

class Tests < Minitest::Test
	attr_reader :processor

	def setup
		@processor = ArrayProcessor.new([1, -7, 3, 4, 5, 33, 6])
	end

	def test_any_positive
		assert_equal true, processor.any? { |x| x > 0 }
	end

	def test_any_negative
		assert_equal true, processor.any? { |x| x < 0 }
	end

	def test_any_none_match
		assert_equal false, processor.any? { |x| x > 50 }
	end

	private

	attr_writer :processor
end
