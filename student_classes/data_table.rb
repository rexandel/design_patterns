class DataTable
	def initialize(data)
		self.data = data
	end
	
	def row_count
		return self.data.size
	end
	
	def column_count
		if data.empty?
			return 0
		else
			return data[0].size
		end
	end
	
	def get_element(row_index, column_index)
		if row_index < 0 || row_index >= row_count
			raise IndexError, "Row index out of bounds"
		end
		if column_index < 0 || column_index >= column_count
			raise IndexError, "Column index out of bounds"
		end
		
		return self.data[row_index][column_index]
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