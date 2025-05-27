local Text = {}

function Text.load(std, data)
    std.bus.listen(data.listen, function(label)
        data.label = label
    end)
end

function Text.draw(std, data)
    std.draw.color(data.color or std.color.white)
    if data.font then
        std.text.font_name(data.font)
    end
    if data.size and data.label then
        local alignx = data.center_x and 0 or 1
        local aligny = data.center_y and 0 or 1
        local x = data.center_x and (data.width/2) or 0
        local y = data.center_y and (data.height/2) or 0
        std.text.font_size(data.size)
        if data.padding_x then
            x = x + data.padding_x
        end
        if data.padding_y then
            y = y + data.padding_y
        end
        std.text.print_ex(x, y, data.label, alignx, aligny)
    end
    if data.font then
        std.text.font_name('Plex')
    end
end

return Text