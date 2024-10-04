class Student
	attr_reader :phone_number
	attr_accessor :id, :surname, :name, :patronymic, :telegram, :email, :git

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
	