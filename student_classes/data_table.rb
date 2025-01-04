class DataTable
	def initialize(data)
		self.data = data
	end
	
	private
	
	attr_reader :data
	
	def data=(data)
		if data.is_a?(Array) && data.all? { |row| row.is_a?(Array) }
			@data = data.map { |element| element.dup }
		else
			raise ArgumentError, "Data must be a two-dimensional array"
		end
	end
end