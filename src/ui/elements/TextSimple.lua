local Text = {}

function Text:load(std)
    std.bus.listen(self.listen, function(label)
        self.label = label
    end)
end

function Text:draw(std)
    std.draw.color(self.color or std.color.white)
    if self.font then
        std.text.font_name(self.font)
    end
    if self.size and self.label then
        local alignx = self.center_x and 0 or 1
        local aligny = self.center_y and 0 or 1
        aligny = self.bottom_align and -1 or aligny
        alignx = self.right_align and -1 or alignx
        local x = self.center_x and (self.width/2) or 0
        local y = self.center_y and (self.height/2) or 0
        x = self.right_align and self.width or x
        std.text.font_size(self.size)
        if self.padding_x then
            x = x + self.padding_x
        end
        if self.padding_y then
            y = y + self.padding_y
        end
        std.text.print_ex(x, y, self.label, alignx, aligny)
    end
    if self.font then
        std.text.font_name('Plex')
    end
end

return Text