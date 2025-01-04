class DataList
	def initialize(data)
		self.data = data
		self.selected = []
	end
	
	def select(number)
		if not number.is_a?(Integer)
			raise ArgumentError, "Index must be an integer"
		end
		if number < 0 || number >= data.size
			raise IndexError, "Element with index #{number} does not exist"
		end
		element = self.data[number]
		if not get_selected.include?(number)
			get_selected << number
		end
		return element
	end
	
	def get_selected
		return @selected
	end
	
	protected
	
	def get_names
		raise NotImplementedError, "Method not implemented in the DataList class"
	end
	
	def get_data
		raise NotImplementedError, "Method not implemented in the DataList class"
	end
	
	private
	
	attr_reader :data
	attr_writer :selected
	
	def data=(data)
		if data.is_a?(Array)
			@data = data.map { |element| element.dup }
		else
			raise ArgumentError, "Data must be an array"
		end
	end
end