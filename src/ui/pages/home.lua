local Home = {}

function Home.load(std, data)
    if not love and not canvas then
        local image = std.node.load('src/ui/elements/Image.lua')
        image.data.src = 'clean-day.jpg'
        std.node.spawn(image)
    end

    std.ui.grid('1x4')
        :add(std.node.load('src/ui/section/Top.lua'))
        :add({})
        :add(std.node.load('src/ui/section/Mid.lua'))
        :add(std.node.load('src/ui/section/Menu.lua'))
        :apply()
end

function Home.draw(std, data)
    std.text.font_name('Plex')
end

return Home