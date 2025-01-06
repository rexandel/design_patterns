class FileStrategy
	def self.read_from_file
		raise NotImplementedError, "Method not implemented in the FileStrategy Interface"
	end
	
	def self.write_to_file
		raise NotImplementedError, "Method not implemented in the FileStrategy Interface"
	end
end