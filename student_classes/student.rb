require_relative 'person.rb'

class Student < Person
	attr_reader :surname, :name, :patronymic, :phone_number, :telegram, :email

	def initialize(surname:, name:, patronymic:, id: nil, phone_number: nil, telegram: nil, email: nil, git: nil)
		self.id = id
		self.surname = surname
		self.name = name
		self.patronymic = patronymic
		self.git = git
		self.set_contacts(phone_number: phone_number, telegram: telegram, email: email)
	end

	def surname_and_initials
		"#{@surname} #{@name[0].upcase}. #{@patronymic[0].upcase}."
	end

	def contact
		if @phone_number
			return @phone_number
		elsif @telegram
			return @telegram
		elsif @email
			return @email
		else
			return nil
		end
	end

	def get_info
		"Surname and initials: #{surname_and_initials} | " \
		"Git: #{git ? git : 'Not specified'} | " \
		"#{determine_contact_type(contact)}: #{contact ? contact : 'Not specified'}"
	end

	def to_s
		"----------------------------------------\n" \
		"ID: #{@id ? @id : 'Not specified'}\n" \
		"Surname: #{@surname ? @surname : 'Not specified'}\n" \
		"Name: #{@name ? @name : 'Not specified'}\n" \
		"Patronymic: #{@patronymic ? @patronymic : 'Not specified'}\n" \
		"Phone number: #{@phone_number ? @phone_number : 'Not specified'}\n" \
		"Telegram: #{@telegram ? @telegram : 'Not specified'}\n" \
		"Email: #{@email ? @email : 'Not specified'}\n" \
		"Git: #{@git ? @git : 'Not specified'}\n" \
		"Validation: #{self.validate? ? 'Passed' : 'Failed'}\n" \
		"----------------------------------------"
	end

	private

	def surname=(surname)
		if self.class.valid_name?(surname)
			@surname = surname
		else
			raise ArgumentError, "Wrong surname format."
		end
	end

	def name=(name)
		if self.class.valid_name?(name)
			@name = name
		else
			raise ArgumentError, "Wrong name format."
		end
	end

	def patronymic=(patronymic)
		if self.class.valid_name?(patronymic)
			@patronymic = patronymic
		else
			raise ArgumentError, "Wrong patronymic format."
		end
	end

	def set_contacts(phone_number: nil, telegram: nil, email: nil)
		if self.class.valid_phone_number?(phone_number)
			@phone_number = phone_number
		else
			raise ArgumentError, "Wrong phone number format."
		end

		if self.class.valid_telegram?(telegram)
			@telegram = telegram
		else
			raise ArgumentError, "Wrong telegram format."
		end

		if self.class.valid_email?(email)
			@email = email
		else
			raise ArgumentError, "Wrong email format."
		end
	end
end
