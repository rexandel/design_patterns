require_relative 'data_list.rb'
require_relative 'data_table.rb'

class DataListStudentShort < DataList
	def get_names
		return ["№", "surname_and_initials", "git", "contact"]
	end
	
	def get_data
		index = 1
		table_data = [self.get_names]
		selected = get_selected
		selected.each do |selected_index|
			selected_obj = self.data[selected_index]
			row = [index, selected_obj.surname_and_initials, selected_obj.git, selected_obj.contact]
			table_data.append(row)
			index += 1
		end
		return DataTable.new(table_data)
	end
end