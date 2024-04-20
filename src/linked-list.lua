local function createNode(nextNode, val)
    local node = {}
    
    node.Next = nextNode
    node.Value = val
    
    return node
end


local list = {}
list.__index = list

function list.new(size)
    local new = setmetatable({}, list)
    
    local previous = nil
    for i = 1, size, 1 do
        local newNode = createNode(previous, 0)
        previous = newNode
    end
    
    new.Head = previous
    
    return new
end

--Iterate through a list and call fn function on each iteration. Passes information about node as a first argument.
function list:Iterate(fn)
    local previous = self.Head
    
    while previous.Next ~= nil do
        fn(previous)
        previous = previous.Next
    end
    fn(previous)
end

function list:GetIndex(index)
    local i = 1
    local found = nil
    
    self:Iterate(function(node)
        if i == index then 
            found = node
        end
        i = i + 1
    end)
    
    return found
end


function list:Insert(value, atEnd)
    local newnode
    
    if atEnd then 
        newnode = createNode(nil, value)
        self:Iterate(function(node)
            if node.Next == nil then
                node.Next = newnode
            end
        end)
    else
        newnode = createNode(self.Head, value)
        self.Head = newnode
    end
    
   return newnode
end

return list
