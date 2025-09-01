local BigDay = {}

function BigDay.load(std, data)
    local grid = std.ui.grid('6x3')
        :dir(1)
        :add(std.node.load('src/ui/elements/TextSimple.lua'), 6)
        :add({}, 6)
        :add(std.node.load('src/ui/elements/TextSimple.lua'))
        :add(std.node.load('src/ui/elements/TextSimple.lua'))
        :add(std.node.load('src/ui/elements/TextSimple.lua'))
        :apply()
    
    local index = 1
    local order = {1, 3, 4, 5}
    local hem = data.height/3

    while index <= #order do
        local node = grid:get_item(order[index])
        node.data.size = hem
        node.data.font = data.fonts and data.fonts[index]
        node.data.label = data.labels and data.labels[index]
        node.data.listen = data.listeners and data.listeners[index]
        index = index + 1
    end

    grid:get_item(1).data.size = data.height
end

return BigDay