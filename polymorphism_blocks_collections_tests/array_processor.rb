class ArrayProcessor
	def initialize(array)
		self.array = array.dup
	end

	def any?
		self.array.each do |element|
			return true if yield(element)
		end
		false
	end

	def find_all
		result = []
		self.array.each do |element|
			result << element if yield(element)
		end
		result
	end

	def find_index
		self.array.each_with_index do |element, index|
			return index if yield(element)
		end
		nil
	end

	def min_max
		return [nil, nil] if self.array.empty?

		min_element = max_element = self.array[0]
		self.array.each do |element|
			min_element = element if yield(element, min_element) < 0
			max_element = element if yield(element, max_element) > 0
		end
		[min_element, max_element]
	end

	def to_a
		self.array.dup
	end

	private

	attr_accessor :array
end
