class StudentShort
	attr_reader :surname_and_initials, :git, :contact

	private_class_method :new

	def initialize(surname_and_initials:, id: nil, git: nil, contact: nil)
		self.id = id
		self.surname_and_initials = surname_and_initials
		self.git = git
		self.contact = contact
	end
	
	def self.new_from_student_object(student)
		self.new(
			id: student.id,
			surname_and_initials: student.get_surname_with_initials,
			contact: student.get_any_contact
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

	def to_s
		"----------------------------------------\n" \
		"ID: #{@id ? @id : 'Not specified'}\n" \
		"Surname and Initials: #{@surname_and_initials}\n" \
		"Git: #{@git ? @git : 'Not specified'}\n" \
		"Contact: #{@contact ? @contact : 'Not specified'}\n" \
		"----------------------------------------"
	end

	def self.parse_string_surname_and_initials(string)
		surname_and_initials_match = string.match(/Surname and initials: ([\w\s\.]+)/)
		if surname_and_initials_match
			return surname_and_initials_match[1].strip
		else
			raise ArgumentError, "Wrong string format"
		end
	end

	def self.parse_string_git(string)
		git_match = string.match(/Git: (https?:\/\/[\w\.\/\-]+|Not specified)/)
		if git_match[1] == "Not specified"
			return nil
		elsif git_match
			return git_match[1].strip
		else
			raise ArgumentError, "Wrong string format"
		end
	end

	def self.parse_string_contact(string)
		contact_match = string.match(/Contact: ([^\[]+\[[^\]]+\]|Not specified)/)
		if contact_match[1] == "Not specified"
			return nil
		elsif contact_match
			return contact_match[1].strip
		else
			raise ArgumentError, "Wrong string format"
		end
	end

	private

	attr_accessor :id

	def surname_and_initials=(surname_and_initials)
		if self.class.valid_surname_and_initials?(surname_and_initials)
			@surname_and_initials = surname_and_initials
		else
			raise ArgumentError, "Wrong surname and initials format."
		end
	end

	def git=(git)
		if self.class.valid_git?(git)
			@git = git
		else
			raise ArgumentError, "Wrong git format."
		end
	end

	def contact=(contact)
		if self.class.valid_phone_number?(contact) || self.class.valid_telegram?(contact) || self.class.valid_email?(contact)
			@contact = contact
		else
			raise ArgumentError, "Wrong contact format."
		end
	end

	def self.valid_string_format?(string)
		pattern = /^Surname and initials: .+ \| Git: .+ \| Contact: .+$/
		string.match(pattern) != nil
	end

	def self.valid_surname_and_initials?(surname_and_initials)
		if surname_and_initials.match(/^[A-Za-z]/)
			return surname_and_initials.match(/^[A-Za-z][a-z]+(?:[- ][A-Za-z][a-z]+)* \s*([A-Z]\. ?)+$/)
		elsif surname_and_initials.match(/^[А-ЯЁ]/)
			return surname_and_initials.match(/^[А-ЯЁ][а-яё]+(?:[- ][А-ЯЁ][а-яё]+)* \s*([А-ЯЁ]\. ?)+$/)
		else
			return false
		end
	end

	def self.valid_git?(git)
		git.nil? || git.match(/^https?:\/\/(www\.)?github\.com\/[a-zA-Z0-9_-]+\/?$/)
	end

	def self.valid_phone_number?(phone_number)
		phone_number.nil? || phone_number.match(/^\+7\(\d{3}\)-\d{3}-\d{2}-\d{2} \[phone number\]$/)
	end
  
	def self.valid_telegram?(telegram)
		telegram.nil? || telegram.match(/^@[a-zA-Z0-9_]{5,} \[telegram\]$/)
	end
  
	def self.valid_email?(email)
		email.nil? || email.match(/^[\w+_.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,} \[email\]$/)
	end
end