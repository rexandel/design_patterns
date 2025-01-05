require 'json'
require_relative './student.rb'
require_relative './student_short.rb'

class StudentsListError < StandardError; end

class StudentsListJSON
	def initialize(file_path)
        self.file_path = file_path
        self.students = []
    end
	
	def read_from_file
		begin
			if !File.exist?(self.file_path)
				return []
			end
			File.open(self.file_path, 'r') do |file|
				file_content = file.read
				
				return [] if file_content.strip.empty?
				
				parsed_data = JSON.parse(file_content, symbolize_names: true)
				
				if parsed_data.is_a?(Array) && parsed_data.all? { |record| record.is_a?(Hash) }
					parsed_data.map { |record| add_student(Student.new(**record)) }
				else
					raise StudentsListError, "Invalid JSON structure. Expected an array of hashes."
				end
			end
		rescue JSON::ParserError => parse_error
			raise StudentsListError, "Error parsing JSON: #{parse_error.message}"
		rescue StudentsListError => custom_error
			raise custom_error
		rescue StandardError => generic_error
			raise StudentsListError, "Unexpected error during file reading: #{generic_error.message}"
		end
	end
	
	def write_to_file
		begin
			if self.students.nil? || !self.students.all? { |student| student.is_a?(Student) }
				raise StudentsListError, "Invalid students list. Ensure all entries are valid Student objects."
			end
			
			if self.file_path.nil? || self.file_path.empty?
				raise StudentsListError, "File path is not defined."
			end
			
			student_records = self.students.map { |student| student.to_h }
			
			File.open(self.file_path, 'w') do |file|
				file.write(JSON.pretty_generate(student_records))
			end
		rescue IOError => io_error
			raise StudentsListError, "Failed to write to file: #{io_error.message}"
		rescue JSON::GeneratorError => json_error
			raise StudentsListError, "Error generating JSON: #{json_error.message}"
		rescue StandardError => generic_error
			raise StudentsListError, "Unexpected error during file writing: #{generic_error.message}"
		end
	end
	
	def get_student_by_id(required_id)
		return self.students.find { |student| student.id == required_id }
	end
	
	def get_k_n_student_short_list(page_number, page_size, previous_data_list  = nil)
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
			raise StandardError, "Student with ID #{required_student_id} not found."
		end
		
		new_student.id = required_id
		self.students[index] = new_student
	end
	
	def delete_student_by_id(required_id)
		index = self.students.find_index { |student| student.id == required_id }
		
		if index.nil?
			raise StandardError, "Student with ID #{student_id} not found."
		end
		
		self.students.delete_at(index)
	end
	
	def get_student_short_count
		return self.students.size
	end
	
	private
	
	attr_accessor :file_path, :students
end