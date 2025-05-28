local Btn = {}

function Btn.load(std, data)
    data.ui_grid = std.ui.grid('1x1')
        :add(std.node.load('src/ui/elements/TextSimple.lua'))
        :apply()

    data.text = data.ui_grid:get_item(1)
    data.text.data.label = data.label
    data.text.data.size = data.size
    data.text.data.font = data.font
    data.text.data.center_x = true
    data.text.data.center_y = true
end

function Btn.draw(std, data)
    std.draw.color(0x4a434dFF)
    std.draw.rect(0, 0, 0, data.width, data.height)
    if data.selected then
        std.draw.color(std.color.white)
        std.draw.rect(1, -2, -2, data.width+2, data.height+2)
    end
end

return Btn
