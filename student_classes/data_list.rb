class DataList
	attr_reader :data
	
	def initialize(data)
		self.data = data
	end
	
	private
	
	def data=(data)
		if data.is_a?(Array)
			@data = data.map { |element| element.dup }
		else
			raise ArgumentError, "Data must be an array"
		end
	end
end