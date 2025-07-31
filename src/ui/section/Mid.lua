local Mid = {}

function Mid.load(std, data)
    local grid = std.ui.grid('14x1')
        :add({},4)
        :add(std.node.load('src/ui/elements/TextSimple.lua'),4)
        :add({},3)
        :add(std.node.load('src/ui/section/MenuInfos.lua'), 3)

    local info = grid:get_item(4)
    info.data.background = false

    data.city = grid:get_item(2)
    data.city.data.listen = 'put_gelocation_str'
    data.city.data.color = std.color.white
    data.city.data.size = 26
    data.city.data.right_align = true
    data.city.data.center_y = true
    data.city.data.padding_y = 50

    -- ## Another way to do it, with a side bar
        
    -- local grid = std.ui.grid('14x1')
    --     :add({},11)
    --     :add(std.node.load('src/ui/widgets/Background.lua'),3)
    --     :add(std.node.load('src/ui/widgets/Background.lua'),3)
    --     :apply()
end

return Mid
