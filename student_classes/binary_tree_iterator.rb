class BinaryTreeIterator
	include Enumerable

	attr_accessor :root

	def initialize(root)
		self.root = root
	end

	def each(&block)
		self.enumerator.each(&block)
	end

	private

	def enumerator
		Enumerator.new do |yielder|
			walk_tree(self.root) { |data| yielder << data }
		end
	end

	def walk_tree(node, &block)
		return if node.nil?
		walk_tree(node.left, &block)
		yield node.data
		walk_tree(node.right, &block)
	end
end
