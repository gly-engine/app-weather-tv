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
    local hem = data.height/2

    while index <= #order do
        local node = grid:get_item(order[index])
        node.data.padding_x = data.info_padding_x or 0
        node.data.padding_y = data.info_padding_y or 0
        node.data.size = hem
        node.data.font = data.fonts and data.fonts[index]
        node.data.label = data.labels and data.labels[index]
        node.data.listen = data.listeners and data.listeners[index]
        node.data.right_align = data.right_align
        index = index + 1
    end

    grid:get_item(1).data.size = 88
    grid:get_item(1).data.padding_x = data.int_padding or 0
end

return BigDay