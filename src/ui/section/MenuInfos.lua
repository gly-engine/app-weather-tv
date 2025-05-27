local MenuInfos = {}

function MenuInfos.load(std, data)
    
    data.ui_grid = std.ui.grid('5x2')
        :margin(50)
        :add(std.node.load('src/ui/elements/TextSimple.lua'),5)
        :add(std.node.load('src/ui/widgets/BigDay.lua'))
        :apply()

    data.city = data.ui_grid:get_item(1)
    data.city.data.listen = 'put_gelocation_str'
    data.city.data.color = std.color.white
    data.city.data.size = 26
    data.city.data.center_x = true
    data.city.data.center_y = true

    data.ui_grid:get_item(2).data.labels = {
        os.date("%d"),
        os.date("%B"),
        os.date("%H:%M"),
        os.date("%A")
    }
    data.ui_grid:get_item(2).data.info_padding_x = 100
    data.ui_grid:get_item(2).data.int_padding = 15

end


function MenuInfos.draw(std, data)
    if data.background then
        std.draw.color(0x2C292EFF)
        std.draw.rect(0, 0, 0, data.width, data.height)
    end
end

return MenuInfos
