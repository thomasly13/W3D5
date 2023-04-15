class PolyTreeNode
    
    attr_accessor :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    #instance method for children 
    def parent=(node)
        if parent != nil 
            parent.children.delete(self)
        end
        @parent = node
        if node != nil && !node.children.include?(self)
            # node.add_child(self)
            node.children << self
        end
    end

    #instance method for parents 
    def add_child(child_node)
        # parent=(child_node)
        self.children << child_node
        child_node.parent = self 
    end 

    def remove_child(child_node)
        if self.children.include?(child_node)
            self.children.delete(child_node)
            child_node.parent = nil 
        else 
            raise 'child does not exist'
        end 
    end 

    # create empty array 
    # shovel self into array 
    # check if self is equal to target value 
    #       A root 
    #   B             C
    #D E               F G


    def dfs(target_value)
        return nil if self.value != target_value && self.children.length == 0
        return self if self.value == target_value
        self.children.each do |child| 
            answer = child.dfs(target_value) 
            if answer != nil 
                return answer
            end 
            # return child if child.dfs(target_value) == child
        end
        nil 
    end 


    def bfs(target_value)
        queue = []  
        queue << self #[A]
        until queue.length < 1 
            current = queue.shift #current = "B", queue = [C]
            current.children.each do |child| #interate through children of A 
                queue << child # [C, D, E]
            end 
            return current if current.value == target_value 
        end
     nil
    end

    def inspect 
        "Node:#{self.object_id}/ value=#{self.value} 
        children=#{self.children.map{|child| child.value}}"
    end 

    # D is B's parent
    # B's new parent is A

    

    
  
end