local Icon = {}

function Icon.load(std, data)
    std.bus.listen(data.listen, function(label)
        data.src = string.format(data.format, label)
    end)
end


function Icon.draw(std, data)
    local x, y = 0, 0
    if data.center_x and data.img_width then
        x = (data.width/2) - (data.img_width/2)
    end
    if data.center_y and data.img_height then
        y = (data.height/2) - (data.img_height/2)
    end
    if data.src and #data.src > 0 then
        std.image.draw(data.src, x, y)
    end
end

return Icon

