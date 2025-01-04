class DataTable
	def initialize(header, data)
		self.header = header
		self.data = [header] + data
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
	
	def to_s
		if data.empty?
			return "Table is empty"
		else
			output = "---------------------------------------------------------------------------------------------------------\n"
			data.each do |row|
				formatted_row = row.map.with_index do |cell, index|
					if index == 0
						format('%-3s', cell)
					else
						format('%-35s', cell)
					end
				end
			output += " #{formatted_row.join(' | ')}\n"
			end
			output += "---------------------------------------------------------------------------------------------------------"
		end
		return output
	end
	
	def update_data(data)
		if data.is_a?(Array) && data.all? { |row| row.is_a?(Array) }
			@data[1..-1] = data.map { |element| element.dup }
		else
			raise ArgumentError, "Data must be a two-dimensional array"
		end
	end
	
	private
	
	attr_reader :data
	attr_accessor :header
	
	def data=(data)
		if data.is_a?(Array) && data.all? { |row| row.is_a?(Array) }
			@data = data.map { |element| element.dup }
		else
			raise ArgumentError, "Data must be a two-dimensional array"
		end
	end
end