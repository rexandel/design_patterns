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

	def to_a
		self.array.dup
	end

	private

	attr_accessor :array
end
