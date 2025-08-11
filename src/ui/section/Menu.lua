local Menu = {}
local Options = {}
local Home_btn = {}

function Options:load(std)
    self.ui_grid = std.ui.grid('1x2')
        :add(std.node.load('src/ui/components/Button.lua'))
        :add(std.node.load('src/ui/components/Button.lua'))

    std.ui.style('margin10', {margin = 10})
        :add_items(self.ui_grid:get_items())

    self.ui_grid:get_item(1).data.label = 'Hour'
    self.ui_grid:get_item(1).data.size = 32
    self.ui_grid:get_item(2).data.label = 'Day'
    self.ui_grid:get_item(2).data.size = 32
end

function Home_btn:load(std)
    self.ui_grid = std.ui.grid('1x1')
        :add(std.node.load('src/ui/components/Button.lua'))

    std.ui.style('margin10')
        :add_items(self.ui_grid:get_items())

    self.ui_grid:get_item(1).data.src = 'assets/home_icon.png'
    self.ui_grid:get_item(1).data.center_x = true
    self.ui_grid:get_item(1).data.center_y = true
    self.ui_grid:get_item(1).data.img_width = 97
    self.ui_grid:get_item(1).data.img_height = 97
    self.ui_grid:get_item(1).data.selected = true

end

function Menu:load(std)
    local index = 1

    local grid = std.ui.grid('14x1')
        :add(Home_btn)
        :add(Options, 2)
        :add(std.node.load('src/ui/widgets/Calendar.lua'))
        :add(std.node.load('src/ui/widgets/Calendar.lua'))
        :add(std.node.load('src/ui/widgets/Calendar.lua'))
        :add(std.node.load('src/ui/widgets/Calendar.lua'))
        :add(std.node.load('src/ui/widgets/Calendar.lua'))
        :add(std.node.load('src/ui/widgets/Calendar.lua'))
        :add(std.node.load('src/ui/widgets/Calendar.lua'))
        :add(std.node.load('src/ui/widgets/Calendar.lua'))
        :add(std.node.load('src/ui/section/CurrentTemp.lua'), 3)

    grid:get_item(11).data.label = 'In This Moment'
    grid:get_item(11).data.size = 38
    
    while index <= 8 do
        grid:get_item(index + 2).data.pattern = string.format('put_%d_%%d_calendar', index)
        index = index + 1
    end

    grid:get_item(3).data.inverse = true
end
function Menu:draw(std)
    std.draw.color(0x28242AFF)
    std.draw.rect(0, 0, 40, self.width, self.height)
    std.image.draw('assets/opening_background.png',0,-479)
    std.image.draw('assets/navigation.png',10,-135)
end

return Menu
