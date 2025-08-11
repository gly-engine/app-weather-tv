
local CurrentTemp = {}

function CurrentTemp:load(std)
    local grid = std.ui.grid('3x2')
        :add(std.node.load('src/ui/elements/TextSimple.lua'),3)
        :add(std.node.load('src/ui/widgets/BigDay.lua'),3)
        -- :add(std.node.load('src/ui/widgets/BigDay.lua'))

        std.ui.style('margin_top', {top = 30})
        :add(grid:get_item(1))

        std.ui.style('left_right', {left = 20, right = 10})
        :add_items(grid:get_items())

    local node = grid:get_item(1)
    node.data.size = self.size
    node.data.color = std.color.skyblue
    node.data.label = self.label
    node.data.center_x = true

    local temp = grid:get_item(2)
    temp.data.labels = {'00', '\194\186C'}
    temp.data.listeners = {'put_current_temperature'}
    temp.data.color = std.color.skyblue

    -- local wmo = grid:get_item(3)
    -- wmo.data.fonts = {'Weather'}
    -- wmo.data.labels = {'.'}
    -- wmo.data.listeners = {'put_current_icon_wmo'}
    -- wmo.data.int_padding = 30
end


-- function CurrentTemp:draw(std)
--     std.draw.color(0x2C292EFF)
--     std.draw.rect(0, 0, 0, data.width, data.height)
-- end

return CurrentTemp
