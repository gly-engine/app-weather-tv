local Calendar = {}

function Calendar.load(std, data)
    local color = data.inverse and std.color.darkgray
    local index = 1
    local grid = std.ui.grid('1x3')
        :add(std.node.load('src/ui/components/Icon.lua'))
        -- :add(std.node.load('src/ui/elements/TextSimple.lua'))
        :add(std.node.load('src/ui/elements/TextSimple.lua'))
        :add(std.node.load('src/ui/elements/TextSimple.lua'))
        :apply()

    while index <= 3 do
        local text = grid:get_item(index)
        text.data.listen = string.format(data.pattern, index)
        text.data.color = color
        text.data.label = '.'
        text.data.size = 28
        text.data.center_x = true
        text.data.center_y = true
        index = index + 1
    end

    -- local icon = grid:get_item(1)
    -- icon.data.font = 'Weather'
    -- icon.data.color = color
    -- icon.data.size = 36

    local icon = grid:get_item(1)
    icon.data.format = data.inverse and 'assets/icon-wb%s-40x40.png' or 'assets/icon-ww%s-40x40.png'
    icon.data.center_x = true
    icon.data.center_y = true
    icon.data.img_width = 40
    icon.data.img_height = 40
end

function Calendar.draw(std, data)
    if data.inverse then
        std.draw.color(std.color.lightgray)
        std.draw.rect(0, 0, 0, data.width, data.height)
    end
end

return Calendar
