require_relative './student.rb'
require_relative './student_short.rb'

class StudentsListError < StandardError; end

class StudentsListBase
	attr_accessor :file_path, :strategy
	
	def initialize(file_path, strategy)
		self.file_path = file_path
		self.strategy = strategy
		self.students = []
	end
	
	def get_student_by_id(required_id)
		return self.students.find { |student| student.id == required_id }
	end
	
	def get_k_n_student_short_list(page_number, page_size, previous_data_list = nil)
		begin
			if page_number < 1 || page_size <= 0
				raise StudentsListError, "Invalid arguments. 'page_number' must be greater than 0 and 'page_size' must be positive."
			end
			
			start_index = (page_number - 1) * page_size
			paginated_students = self.students[start_index, page_size]
			
			if paginated_students.nil?
				paginated_students = []
			end
			
			student_short_objects = paginated_students.map { |student| StudentShort.new_from_student_object(student) }
			
			if previous_data_list.nil?
				return DataListStudentShort.new(student_short_objects)
			else
				previous_data_list.data = student_short_objects
				return previous_data_list 
			end
		rescue StudentsListError => e
			raise StudentsListError, "Invalid operation: #{e.message}"
		rescue StandardError => e
			raise StudentsListError, "Unexpected error while fetching the requested page: #{e.message}"
		end
	end
	
	def sort_by_surname_and_initials!
		self.students.sort_by! { |student| student.surname_and_initials }
	end
	
	def add_student(student_to_add)
		begin
			if !student_to_add.is_a?(Student)
				raise StudentsListError, "Invalid argument: Expected a Student object."
			end
			
			if self.students.any? { |existing_student| existing_student == student_to_add }
				raise StudentsListError, "Cannot add student: A student with the same git or contact already exists."
			end
			
			current_ids = self.students.map { |student| student.id }
			new_student_id = current_ids.empty? ? 1 : current_ids.max + 1
			
			student_to_add.id = new_student_id
			self.students << student_to_add
		rescue StudentsListError => e
			raise StudentsListError, "Failed to add student: #{e.message}"
		rescue StandardError => e
			raise StudentsListError, "Unexpected error while adding a student: #{e.message}"
		end
	end
	
	def replace_student_by_id(required_id, new_student)
		index = self.students.find_index { |student| student.id == required_id }
		
		if index.nil?
			raise StudentsListError, "Student with ID #{required_student_id} not found."
		end
		
		new_student.id = required_id
		self.students[index] = new_student
	end
	
	def delete_student_by_id(required_id)
		index = self.students.find_index { |student| student.id == required_id }
		
		if index.nil?
			raise StudentsListError, "Student with ID #{student_id} not found."
		end
		
		self.students.delete_at(index)
	end
	
	def get_student_short_count
		return self.students.size
	end
	
	def read_from_file
		read_students = self.strategy.read_from_file(self.file_path)
		
		read_students.map { |student| add_student(student) }
	end
	
	def write_to_file
		self.strategy.write_to_file(self.file_path, self.students)
	end
	
	private
	
	attr_accessor :students
end
