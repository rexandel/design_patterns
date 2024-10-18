require_relative 'person.rb'

class StudentShort < Person
    attr_reader :surname_and_initials

    def initialize(input, id: nil)
		if input.is_a?(Student)
			self.id = input.id
			student_info = input.get_info
			validate_and_parse_student_info(student_info)
		elsif input.is_a?(String)
			self.id = id
			validate_and_parse_student_info(input)
		else
			raise ArgumentError, "Invalid input type. Must be a Student object or a String."
		end
	end

    def get_any_contact
        @contact
    end

    def validate_contacts?
        !@contact.nil?
    end

    def self.valid_string_format?(input_string)
        pattern = /^Surname and initials: .+ \| Git: .+ \| (Contact|Phone number|Telegram|Email): .+$/
        input_string.match(pattern) != nil
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

    def validate_and_parse_student_info(info)
		if self.class.valid_string_format?(info)
			self.surname_and_initials = self.class.parse_string_surname_and_initials(info)
			self.git = self.class.parse_string_git(info)
			self.set_contacts(self.class.parse_string_contact(info))
		else
			raise ArgumentError, "Provided information does not match the required format."
		end
	end
end