class PolyTreeNode
    
    attr_accessor :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(node)
        if parent != nil 
            parent.children.delete(self)
        end
        @parent = node
        if node != nil && !node.children.include?(self)
        node.children << self
        end
    end

    # D is B's parent
    # B's new parent is A

    

    
  
end