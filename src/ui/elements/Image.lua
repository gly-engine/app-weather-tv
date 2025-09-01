local Image = {}

function Image.draw(std, data)
    local x, y = 0, 0
    if data.center_x and data.img_width then
        x = (data.width/2) - (data.img_width/2)
    end
    if data.center_y and data.img_height then
        y = (data.height/2) - (data.img_height/2)
    end
    std.draw.image(data.src, x, y)
end

return Image

