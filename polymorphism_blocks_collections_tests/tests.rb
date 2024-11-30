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

	def test_find_all_even
		assert_equal [4, 6], processor.find_all { |x| x.even? }
	end

	def test_find_all_positive
		assert_equal [1, 3, 4, 5, 33, 6], processor.find_all { |x| x > 0 }
	end

	def test_find_all_empty_array
		empty_processor = ArrayProcessor.new([])
		assert_equal [], empty_processor.find_all { |x| x > 0 }
	end

	private

	attr_writer :processor
end
