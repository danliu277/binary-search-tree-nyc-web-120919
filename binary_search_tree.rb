class BST
    include Enumerable

    attr_accessor :data, :left, :right

    def initialize(data)
        @data = data
    end

    def insert(num)
        node = BST.new(num)
        if num <= @data
            if @left
                @left.insert(num)
            else
                @left = node
            end
        else
            if @right
                @right.insert(num)
            else
                @right = node
            end
        end
    end

    def traverse(array, node)
        if(!node)
            return
        end
        if(node.left)
            traverse(array, node.left)
        end
        array.push(node.data)
        if(node.right)
            traverse(array, node.right)
        end
    end

    def each(&block)
        result = []
        self.traverse(result, self)
        result.each(&block)
    end
end