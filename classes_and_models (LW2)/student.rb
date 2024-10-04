class Student
	attr_reader :surname, :name, :patronymic, :phone_number, :telegram, :email, :git
	attr_accessor :id

	def initialize(surname:, name:, patronymic:, **params)
		self.id = params[:id]
		self.surname = surname
		self.name = name
		self.patronymic = patronymic
		self.phone_number = params[:phone_number]
		self.telegram = params[:telegram]
		self.email = params[:email]
		self.git = params[:git]
	end
	
	def self.valid_name?(name)
		name.match(/^[A-Za-z]+(?:-[A-Za-z]+)?$/) || name.match(/^[А-ЯЁа-яё]+(?:-[А-ЯЁа-яё]+)?$/)
	end
	
	def surname=(new_value)
		if self.class.valid_name?(new_value)
			@surname = new_value
		else
			raise ArgumentError, "Wrong surname format."
		end
	end
	
	def name=(new_value)
		if self.class.valid_name?(new_value)
			@name = new_value
		else
			raise ArgumentError, "Wrong name format."
		end
	end
	
	def patronymic=(new_value)
		if self.class.valid_name?(new_value)
			@patronymic = new_value
		else
			raise ArgumentError, "Wrong patronymic format."
		end
	end
	
	def self.valid_phone_number?(phone_number)
		phone_number.nil? || phone_number.match(/^\+7\(\d{3}\)-\d{3}-\d{2}-\d{2}$/)
	end

	def phone_number=(new_value)
		if self.class.valid_phone_number?(new_value)
			@phone_number = new_value
		else
			raise ArgumentError, "Wrong phone number format."
		end
	end
	
	def self.valid_telegram?(telegram)
		telegram.nil? || telegram.match(/@[a-zA-Z0-9_]{5,}$/)
	end
	
	def telegram=(new_value)
		if self.class.valid_telegram?(new_value)
			@telegram = new_value
		else
			raise ArgumentError, "Wrong telegram format."
		end
	end
	
	def self.valid_email?(email)
		email.nil? || email.match(/^[\w+_.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/)
	end
	
	def email=(new_value)
		if self.class.valid_email?(new_value)
			@email = new_value
		else
			raise ArgumentError, "Wrong email format."
		end
	end
	
	def self.valid_git?(git)
		git.nil? || git.match(/^https?:\/\/(www\.)?github\.com\/[a-zA-Z0-9_-]+\/?$/)
	end
	
	def git=(new_value)
		if self.class.valid_git?(new_value)
			@git = new_value
		else
			raise ArgumentError, "Wrong git format."
		end
	end
	
	def print_info
		puts "----------------------------------------"
		
		puts "ID: #{@id ? @id : "Not specified"}"
		puts "Surname: #{@surname ? @surname : "Not specified"}"
		puts "Name: #{@name ? @name : "Not specified"}"
		puts "Patronymic: #{@patronymic ? @patronymic : "Not specified"}"
		puts "Phone number: #{@phone_number ? @phone_number : "Not specified"}"
		puts "Telegram: #{@telegram ? @telegram : "Not specified"}"
		puts "Email: #{@email ? @email : "Not specified"}"
		puts "Git: #{@git ? @git : "Not specified"}"
		
		puts "----------------------------------------"
	end
end
	