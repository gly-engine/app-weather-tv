local Home = {}

function Home.load(std, data)
    local image = std.node.load('src/ui/elements/Image.lua')
    image.data.src = 'clean-day.jpg'
    std.node.spawn(image)

    std.ui.grid('1x4')
        :add(std.node.load('src/ui/section/Top.lua'))
        :add(std.node.load('src/ui/section/Mid.lua'))
        :add({})
        :add(std.node.load('src/ui/section/Menu.lua'))
        :apply()
end

function Home.draw(std, data)
    std.text.font_name('Plex')
    std.draw.color(std.color.skyblue)
    std.draw.rect(0, 0, 0, data.width, data.height)
end

return Home