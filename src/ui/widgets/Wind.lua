local Wind = {}

function Wind:draw(std)
    std.draw.color(0x33333399)
    std.draw.rect(0, 0, 0, self.width, self.height)

    std.draw.color(std.color.white)
    std.text.font_name('Weather')
    std.text.font_size(128)
    local text = '\238\152\180'
    local w, h = std.text.mensure(text)
    std.text.print((self.width/2) - (w/2), (self.height/2) - h, text)
    std.text.font_name('Plex')
end

return Wind