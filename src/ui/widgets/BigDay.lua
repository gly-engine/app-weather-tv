local BigDay = {}

function BigDay.load(std, data)
    local grid = std.ui.grid('3x3')
        :dir(1)
        :add(std.node.load('src/ui/elements/TextSimple.lua'), 3)
        :add({}, 3)
        :add(std.node.load('src/ui/elements/TextSimple.lua'))
        :add(std.node.load('src/ui/elements/TextSimple.lua'))
        :add(std.node.load('src/ui/elements/TextSimple.lua'))
    
    local index = 1
    local order = {1, 3, 4, 5}
    local hem = data.height/4

    while index <= #order do
        local node = grid:get_item(order[index])
        node.data.padding_x = data.info_padding_x or 0
        node.data.padding_y = data.info_padding_y or 0
        node.data.size = hem
        node.data.color = data.color or std.color.white
        node.data.font = data.fonts and data.fonts[index]
        node.data.label = data.labels and data.labels[index]
        node.data.listen = data.listeners and data.listeners[index]
        node.data.right_align = data.right_align
        node.data.center_y = data.center_y
        node.data.center_x = data.center_x
        index = index + 1
    end

    grid:get_item(1).data.size = 90
    grid:get_item(1).data.right_align = false
end

return BigDay