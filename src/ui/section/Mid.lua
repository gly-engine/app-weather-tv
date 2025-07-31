local Mid = {}

function Mid.load(std, data)
    local grid = std.ui.grid('14x1')
        :add({},11)
        :add(std.node.load('src/ui/section/MenuInfos.lua'), 3)

    local info = grid:get_item(1)
    info.data.background = false

    -- ## Another way to do it, with a side bar
        
    -- local grid = std.ui.grid('14x1')
    --     :add({},11)
    --     :add(std.node.load('src/ui/widgets/Background.lua'),3)
    --     :add(std.node.load('src/ui/widgets/Background.lua'),3)
    --     :apply()
end

return Mid
