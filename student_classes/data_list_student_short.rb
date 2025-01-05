require_relative 'data_list.rb'
require_relative 'data_table.rb'

class DataListStudentShort < DataList
	public :data=
	
	def get_names
		return ["№", "surname_and_initials", "git", "contact"]
	end
	
	private
	
	def build_row(student_short_object)
		return [student_short_object.id, student_short_object.surname_and_initials, student_short_object.git, student_short_object.contact]
	end
end
