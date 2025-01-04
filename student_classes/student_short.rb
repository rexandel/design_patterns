require_relative 'person.rb'

class StudentShort < Person
	attr_reader :surname_and_initials
	
	private_class_method :new
	
	def initialize(surname_and_initials:, id: nil, git: nil, contact: nil)
		self.id = id
		self.surname_and_initials = surname_and_initials
		self.git = git
		set_contacts(contact)
	end
	
	def self.new_from_student_object(student)
		self.new(
			id: student.id,
			surname_and_initials: student.surname_and_initials,
			git: student.git,
			contact: student.contact
		)
	end
	
	def self.new_from_string(string:, id: nil)
		if valid_string_format?(string)
			self.new(
				id: id,
				surname_and_initials: parse_string_surname_and_initials(string),
				git: parse_string_git(string),
				contact: parse_string_contact(string)
			)
		else
			raise ArgumentError, "String does not match the required format."
		end
	end
	
	def contact
		return @contact
	end
	
	def validate_contacts?
		return !@contact.nil?
	end
	
	def self.valid_string_format?(input_string)
		pattern = /^Surname and initials: .+ \| Git: .+ \| (Contact|Phone number|Telegram|Email): .+$/
		return input_string.match(pattern) != nil
	end
	
	def self.valid_name?(surname_and_initials)
		if surname_and_initials.match(/^[A-Za-z]/)
			return surname_and_initials.match(/^[A-Za-z][a-z]+(?:[- ][A-Za-z][a-z]+)* \s*([A-Z]\. ?)+$/)
		elsif surname_and_initials.match(/^[А-ЯЁ]/)
			return surname_and_initials.match(/^[А-ЯЁ][а-яё]+(?:[- ][А-ЯЁ][а-яё]+)* \s*([А-ЯЁ]\. ?)+$/)
		else
			return false
		end
	end
	
	def to_s
		"----------------------------------------\n" \
		"ID: #{@id ? @id : 'Not specified'}\n" \
		"Surname and Initials: #{@surname_and_initials}\n" \
		"Git: #{@git ? @git : 'Not specified'}\n" \
		"Contact: #{@contact ? @contact : 'Not specified'}\n" \
		"Validation: #{self.validate? ? 'Passed' : 'Failed'}\n" \
		"----------------------------------------"
	end
	
	private
	
	def self.parse_string_surname_and_initials(input_string)
		surname_and_initials_match = input_string.match(/Surname and initials: ([\w\s\.]+)/)
		if surname_and_initials_match
			return surname_and_initials_match[1].strip
		else
			raise ArgumentError, "Wrong string format"
		end
	end
	
	def self.parse_string_git(input_string)
		git_match = input_string.match(/Git: (https?:\/\/[\w\.\/\-]+|Not specified)/)
		if git_match[1] == "Not specified"
			return nil
		elsif git_match
			return git_match[1].strip
		else
			raise ArgumentError, "Wrong string format"
		end
	end
	
	def self.parse_string_contact(input_string)
		contact_match = input_string.match(/(?:Contact|Phone number|Telegram|Email): ([^|]+|Not specified)/)
		if contact_match[1] == "Not specified"
			return nil
		elsif contact_match
			return contact_match[1].strip
		else
			raise ArgumentError, "Wrong string format"
		end
	end
	
	def surname_and_initials=(surname_and_initials)
		if self.class.valid_name?(surname_and_initials)
			@surname_and_initials = surname_and_initials
		else
			raise ArgumentError, "Wrong surname and initials format."
		end
	end
	
	def set_contacts(contact)
		if self.class.valid_phone_number?(contact) || self.class.valid_telegram?(contact) || self.class.valid_email?(contact)
			@contact = contact
		else
			raise ArgumentError, "Wrong contact format."
		end
	end
end
