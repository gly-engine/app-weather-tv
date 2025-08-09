local BigDay = {}

function BigDay:load(std)
    local grid = std.ui.grid('3x3')
        :dir(1)
        :add(std.node.load('src/ui/elements/TextSimple.lua'), 3)
        :add({}, 3)
        :add(std.node.load('src/ui/elements/TextSimple.lua'))
        :add(std.node.load('src/ui/elements/TextSimple.lua'))
        :add(std.node.load('src/ui/elements/TextSimple.lua'))
    
    local index = 1
    local order = {1, 3, 4, 5}
    local hem = self.height/4

    while index <= #order do
        local node = grid:get_item(order[index])
        node.data.padding_x = self.info_padding_x or 0
        node.data.padding_y = self.info_padding_y or 0
        node.data.size = hem
        node.data.color = self.color or std.color.white
        node.data.font = self.fonts and self.fonts[index]
        node.data.label = self.labels and self.labels[index]
        node.data.listen = self.listeners and self.listeners[index]
        node.data.right_align = self.right_align
        node.data.center_y = self.center_y
        node.data.center_x = self.center_x
        index = index + 1
    end

    grid:get_item(1).data.size = 100
    grid:get_item(1).data.right_align = false
end

return BigDay