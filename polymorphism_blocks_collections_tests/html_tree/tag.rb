class Tag
	attr_reader :name, :attributes, :children, :content
	attr_writer :content

	SELF_CLOSING_HTML_ELEMENTS = %w[area base br col embed hr img input link meta param source track wbr].freeze

	def initialize(name:, attributes: {}, children: [], content: "")
		self.name = name
		self.attributes = attributes
		self.children = children
		self.content = content
	end

	def opening_tag
		str_of_attr = self.attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")

		if str_of_attr.empty?
			return self.self_closing_tag? ? "<#{self.name} />" : "<#{self.name}>"
		else
			return self.self_closing_tag? ? "<#{self.name} #{str_of_attr} />" : "<#{self.name} #{str_of_attr}>"
		end
	end

	def closing_tag
		return self.self_closing_tag? ? "" : "</#{self.name}>"
	end

	def self_closing_tag?
		return SELF_CLOSING_HTML_ELEMENTS.include?(name)
	end

	def to_s
		opening_str = self.opening_tag
		closing_str = self.closing_tag
		return opening_str + closing_str
	end

	def append_child(child)
		self.children << child
	end

	def self.parse_attributes(str_of_attr)
		if str_of_attr.nil?
			return {}
		end
		hash_of_attr = {}
		str_of_attr.scan(/([a-zA-Z]+)="([^" >]*)"/) do |key, value|
			hash_of_attr[key] = value
		end
		return hash_of_attr
	end

	private

	attr_writer :name, :attributes, :children
end
