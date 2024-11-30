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

	def to_a
		self.array.dup
	end

	private

	attr_accessor :array
end
