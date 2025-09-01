local Calendar = {}

function Calendar.load(std, data)
    local index = 1
    local color = data.inverse and std.color.darkgray
    local grid = std.ui.grid('1x3')
        :add(std.node.load('src/ui/elements/TextSimple.lua'))
        :add(std.node.load('src/ui/elements/TextSimple.lua'))
        :add(std.node.load('src/ui/elements/TextSimple.lua'))
        :apply()

    while index <= 3 do
        local text = grid:get_item(index)
        text.data.listen = string.format(data.pattern, index)
        text.data.color = color
        text.data.label = '.'
        text.data.size = 16
        text.data.center_x = true
        text.data.center_y = true
        index = index + 1
    end

    local icon = grid:get_item(1)
    icon.data.font = 'Weather'
    icon.data.color = color
    icon.data.size = 36
end

function Calendar.draw(std, data)
    if data.inverse then
        std.draw.color(0xFFFFFF99)
        std.draw.rect(0, 0, 0, data.width, data.height)
    end
end

return Calendar
