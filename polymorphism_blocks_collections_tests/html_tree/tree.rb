require './tag.rb'
require './tree_iterator_dfs.rb'
require './tree_iterator_bfs.rb'

class Tree
	attr_accessor :root

	def initialize(html_string)
		self.root = self.parse_html(html_string)
	end

	def dfs_iterator
		TreeIteratorDFS.new(self.root)
	end

	def bfs_iterator
		TreeIteratorBFS.new(self.root)
	end

	private

	def parse_html(html_string)
		stack_of_tags = []
		curr_parent_tag = nil

		html_string.scan(/<[^>]+>|[^<]+/) do |html_tag|
			html_tag = html_tag.strip
			if html_tag.start_with?("<")
				if is_opening_html_tag?(html_tag)
					curr_parent_tag = process_opening_tag(html_tag, stack_of_tags, curr_parent_tag)
				elsif is_closing_html_tag?(html_tag)
					process_closing_tag(html_tag, stack_of_tags)
					curr_parent_tag = stack_of_tags.last
				elsif is_self_closing_html_tag?(html_tag)
					process_self_closing_tag(html_tag, curr_parent_tag)
				end
			elsif not html_tag.empty?
				process_text(html_tag, curr_parent_tag)
			end
		end

		return self.root
	end

	def is_opening_html_tag?(html_tag)
		match = html_tag.match?(/^<[^\/\s][^>]*>$/)
	end

	def is_closing_html_tag?(html_tag)
		match = html_tag.match?(/^<\/[^>]*>$/)
	end

	def is_self_closing_html_tag?(html_tag)
		match = html_tag.match?(/^<[^\/\s][^>]*\/>$/)
	end

	def process_opening_tag(html_tag, stack_of_tags, curr_parent_tag)
		tag_content = html_tag.slice(1..-2).strip
		name, str_of_attr = tag_content.split(" ", 2)

		attributes = Tag.parse_attributes(str_of_attr)

		tag = Tag.new(name: name, attributes: attributes)

		curr_parent_tag.nil? ? self.root = tag : curr_parent_tag.append_child(tag)
		stack_of_tags.push(tag)
		return tag
	end

	def process_closing_tag(html_tag, stack_of_tags)
		tag_name = html_tag.slice(2..-2).strip

		stack_of_tags.pop if !stack_of_tags.last.nil? && stack_of_tags.last.name == tag_name
	end

	def process_self_closing_tag(html_tag, curr_parent_tag)
		tag_content = html_tag.slice(1..-3).strip
		name, str_of_attr = tag_content.split(" ", 2)

		attributes = Tag.parse_attributes(str_of_attr)

		tag = Tag.new(name: name, attributes: attributes)

		return curr_parent_tag.append_child(tag) if !curr_parent_tag.nil?
	end

	def process_text(html_tag, curr_parent_tag)
		curr_parent_tag.content += html_tag if !curr_parent_tag.nil?
	end
end
