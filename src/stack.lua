local stack = {}
stack.__index = stack

function stack.new(capacity)
    local new = setmetatable({}, stack)
    
    new.Array = {}
    new.Top = 0
    
    new.Capacity = capacity
    
    return new
end

function stack:IsEmpty()
    if self.Top < 1 then
        return true
    end
end

function stack:IsFull()
    if self.Top == self.Capacity then
        return true
    end
end

function stack:Peek()
    if self:IsEmpty() then return nil end
    
    return self.Array[self.Top]
end


function stack:Push(value)
    if not self:IsFull() then
        self.Top = self.Top + 1
        self.Array[self.Top] = value
    end
end

function stack:Pop()
    if not self:IsEmpty() then
        local value = self:Peek()
        
        self.Array[self.Top] = nil
        self.Top = self.Top - 1
        
        return value
    end
end

return stack
