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
	
	def get_data
		header = get_names
		rows = get_info
		return DataTable.new(header, rows)
	end
	
	protected
	
	def get_names
		raise NotImplementedError, "Method not implemented in the DataList class"
	end
	
	def build_row
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
	
	def get_info
		current_index = 1
		result_rows = []
		selected_indexes = get_selected
		selected_indexes.each do |index|
			current_object = self.data[index]
			row = build_row(current_index, current_object)
			result_rows.append(row)
			current_index += 1
		end
		return result_rows
	end
end
