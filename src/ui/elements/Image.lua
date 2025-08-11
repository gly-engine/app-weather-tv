local Image = {}

function Image:draw(std)
    local x, y = 0, 0
    if self.center_x and self.img_width then
        x = (self.width/2) - (self.img_width/2)
    end
    if self.center_y and self.img_height then
        y = (self.height/2) - (self.img_height/2)
    end
    std.image.draw(self.src, x, y)
end

return Image

