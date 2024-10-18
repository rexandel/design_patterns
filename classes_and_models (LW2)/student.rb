class Student
	attr_reader :surname, :name, :patronymic, :phone_number, :telegram, :email, :git
	attr_accessor :id

	def initialize(surname:, name:, patronymic:, id: nil, phone_number: nil, telegram: nil, email: nil, git: nil)
		self.id = id
		self.surname = surname
		self.name = name
		self.patronymic = patronymic
		self.git = git
		self.set_contacts(phone_number: phone_number, telegram: telegram, email: email)
	end
	
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

	def git=(git)
		if self.class.valid_git?(git)
			@git = git
		else
			raise ArgumentError, "Wrong git format."
		end
	end

	def validate_git?
		!@git.nil?
	end

	def validate_contacts?
		!@phone_number.nil? || !@telegram.nil? || !@email.nil?
	end

	def validate?
		validate_git? && validate_contacts?
	end

	def get_surname_with_initials
		"#{surname} #{name[0].upcase}. #{patronymic[0].upcase}."
	end

	def get_git
		git
	end

	def get_any_contact
		if phone_number
			return "#{phone_number} [phone number]"
		elsif telegram
			return "#{telegram} [telegram]"
		elsif email
			return "#{email} [email]"
		else
			return nil
		end
	end

	def get_info
		"Surname and initials: #{get_surname_with_initials} | Git: #{get_git ? get_git : 'Not specified'} | Contact: #{get_any_contact ? get_any_contact : 'Not specified'}"
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

	def self.valid_name?(name)
		name.match(/^[A-Za-z]+(?:-[A-Za-z]+)?$/) || name.match(/^[А-ЯЁа-яё]+(?:-[А-ЯЁа-яё]+)?$/)
	end

	def self.valid_phone_number?(phone_number)
		phone_number.nil? || phone_number.match(/^\+7\(\d{3}\)-\d{3}-\d{2}-\d{2}$/)
	end
	
	def self.valid_telegram?(telegram)
		telegram.nil? || telegram.match(/@[a-zA-Z0-9_]{5,}$/)
	end
	
	def self.valid_email?(email)
		email.nil? || email.match(/^[\w+_.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/)
	end
	
	def self.valid_git?(git)
		git.nil? || git.match(/^https?:\/\/(www\.)?github\.com\/[a-zA-Z0-9_-]+\/?$/)
	end
end
