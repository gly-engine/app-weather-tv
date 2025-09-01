local Text = {}

function Text.load(std, data)
    std.bus.listen(data.listen, function(label)
        data.label = label
    end)
end

function Text.draw(std, data)
    if not data.label then return end
    if not data.padding then
        data.padding = 0
    end
    local p2 = data.padding + data.padding
    std.text.font_size(18)
    if not data.label_width then
        data.label_width, data.label_height = std.text.mensure(data.label)
    end
    std.draw.color(std.color.white)
    std.draw.rect(0, 0, 0, data.label_width + p2, data.label_height + p2)
    std.draw.color(std.color.lightgray)
    std.draw.rect(1, 0, 0, data.label_width + p2, data.label_height + p2)
    std.draw.color(std.color.darkgray)
    std.text.print(data.padding, data.padding, data.label)
end

return Text