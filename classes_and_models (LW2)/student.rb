class Student
	attr_accessor :id, :surname, :name, :patronymic, :phone_number, :telegram, :email, :git

	def initialize(surname:, name:, patronymic:, **params)
		@id = params[:id]
		@surname = surname
		@name = name
		@patronymic = patronymic
		@phone_number = params[:phone_number]
		@telegram = params[:telegram]
		@email = params[:email]
		@git = params[:git]
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
	