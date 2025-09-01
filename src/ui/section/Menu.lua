local Menu = {}
local Options = {}

function Options.load(std, data)
    data.ui_grid = std.ui.grid('1x2')
        :gap(25)
        :add(std.node.load('src/ui/components/Button.lua'))
        :add(std.node.load('src/ui/components/Button.lua'))
        :apply()

    data.ui_grid:get_item(1).data.label = 'Hour'
    data.ui_grid:get_item(1).data.size = 12
    data.ui_grid:get_item(2).data.label = 'Day'
    data.ui_grid:get_item(2).data.size = 12
end

function Menu.load(std, data)
    local index = 1

    local grid = std.ui.grid('14x1')
        :add({})
        :add(Options, 2)
        :add(std.node.load('src/ui/widgets/Calendar.lua'))
        :add(std.node.load('src/ui/widgets/Calendar.lua'))
        :add(std.node.load('src/ui/widgets/Calendar.lua'))
        :add(std.node.load('src/ui/widgets/Calendar.lua'))
        :add(std.node.load('src/ui/widgets/Calendar.lua'))
        :add(std.node.load('src/ui/widgets/Calendar.lua'))
        :add(std.node.load('src/ui/widgets/Calendar.lua'))
        :add(std.node.load('src/ui/widgets/Calendar.lua'))
        :add(std.node.load('src/ui/widgets/Wind.lua'), 2)
        :apply()

    while index <= 8 do
        grid:get_item(index + 2).data.pattern = string.format('put_%d_%%d_calendar', index)
        index = index + 1
    end

    grid:get_item(3).data.inverse = true
end
function Menu.draw(std, data)
    std.draw.color(0x333333AA)
    std.draw.rect(0, 0, 0, data.width, data.height)
end

return Menu
