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

	def test_find_index_first_even
		assert_equal 3, processor.find_index { |x| x.even? }
	end

	def test_find_index_first_positive
		assert_equal 0, processor.find_index { |x| x > 0 }
	end

	def test_find_index_none_match
		assert_nil processor.find_index { |x| x > 50 }
	end

	def test_min_max_absolute
		assert_equal [1, 33], processor.min_max { |a, b| a.abs <=> b.abs }
	end

	def test_min_max_natural_order
		assert_equal [-7, 33], processor.min_max { |a, b| a <=> b }
	end

	def test_none_positive
		assert_equal false, processor.none? { |x| x > 0 }
	end

	def test_none_negative
		assert_equal false, processor.none? { |x| x < 0 }
	end

	def test_none_all_positive
		assert_equal true, processor.none? { |x| x > 50 }
	end

	def test_reduce_product
		assert_equal -83160, processor.reduce(1) { |prod, x| prod * x }
	end

	def test_reduce_sum
		assert_equal 45, processor.reduce(0) { |sum, x| sum + x }
	end

	def test_reduce_min
		assert_equal -7, processor.reduce { |min, x| min < x ? min : x }
	end

	private

	attr_writer :processor
end
