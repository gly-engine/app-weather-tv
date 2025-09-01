local Top = {}

function Top.load(std, data)
    data.ui_grid = std.ui.grid('5x2')
        :margin(50)
        :add(std.node.load('src/ui/elements/TextOutline.lua'), 5)
        :add(std.node.load('src/ui/widgets/BigDay.lua'))
        :apply()

    data.city = data.ui_grid:get_item(1)
    data.city.data.listen = 'put_gelocation_str'
    data.city.data.padding = 8

    data.ui_grid:get_item(2).data.labels = {
        os.date("%d"),
        os.date("%B"),
        os.date("%H:%M"),
        os.date("%A")
    }
end

return Top
