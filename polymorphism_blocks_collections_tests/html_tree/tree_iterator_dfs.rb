require './tree_iterator.rb'

class TreeIteratorDFS < TreeIterator
	private

	def enumerator
		Enumerator.new do |yielder|
			stack = [self.root]
			while not stack.empty?
				current = stack.pop
				yielder << current
				current.children.reverse.each { |child| stack.push(child) } if !current.children.nil?
			end
		end
    end
end
