class Person
    attr_reader :id, :git

    def validate_git?
		!git.nil?
	end

	def validate_contacts?
		!phone_number.nil? || !telegram.nil? || !email.nil?
	end

	def validate?
		validate_git? && validate_contacts?
	end

    protected

    def self.valid_id?(id)
		id.nil? || id.is_a?(Integer)
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

    def id=(id)
		if self.class.valid_id?(id)
			@id = id
		else
			raise ArgumentError, "Wrong id format."
		end
	end

	def git=(git)
		if self.class.valid_git?(git)
			@git = git
		else
			raise ArgumentError, "Wrong git format."
		end
	end

    def set_contacts
        raise NotImplementedError, "Method not implemented in the Person class"
    end
    
    def get_any_contact
        raise NotImplementedError, "Method not implemented in the Person class"
    end
end