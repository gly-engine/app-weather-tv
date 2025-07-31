local Mid = {}

function Mid:load(std)
    local grid = std.ui.grid('14x1')
        :add({},4)
        :add(std.node.load('src/ui/elements/TextSimple.lua'),4)
        :add({},3)
        :add(std.node.load('src/ui/section/MenuInfos.lua'), 3)

    local info = grid:get_item(4)
    info.data.background = false

    self.city = grid:get_item(2)
    self.city.data.listen = 'put_gelocation_str'
    self.city.data.color = std.color.white
    self.city.data.size = 26
    self.city.data.right_align = true
    self.city.data.center_y = true
    self.city.data.padding_y = 50

    -- ## Another way to do it, with a side bar
        
    -- local grid = std.ui.grid('14x1')
    --     :add({},11)
    --     :add(std.node.load('src/ui/widgets/Background.lua'),3)
    --     :add(std.node.load('src/ui/widgets/Background.lua'),3)
    --     :apply()
end

return Mid
