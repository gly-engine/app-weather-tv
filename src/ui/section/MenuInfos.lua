local MenuInfos = {}

function MenuInfos:load(std)

    self.ui_grid = std.ui.grid('3x2')
        :add({},3)
        :add(std.node.load('src/ui/widgets/BigDay.lua'),3)

    std.ui.style('left_right', {left = 20, right = 10})
        :add_items(self.ui_grid:get_items())

    self.ui_grid:get_item(2).data.labels = {
        os.date("%d"),
        os.date("%B"),
        os.date("%H:%M"),
        os.date("%A")
    }
    self.ui_grid:get_item(2).data.right_align = true
    self.ui_grid:get_item(2).data.center_y = true

end


function MenuInfos:draw(std)
    if self.background then
        std.draw.color(0x2C292EFF)
        std.draw.rect(0, 0, 0, self.width, self.height)
    end
end

return MenuInfos
