local Text = {}

function Text:load(std)
    std.bus.listen(self.listen, function(label)
        self.label = label
    end)
end

function Text:draw(std)
    if not self.label then return end
    if not self.padding then
        self.padding = 0
    end
    local p2 = self.padding + self.padding
    std.text.font_size(18)
    if not self.label_width then
        self.label_width, self.label_height = std.text.mensure(self.label)
    end
    std.draw.color(std.color.white)
    std.text.print((self.width / 2) - (self.label_width / 2), 2*self.padding, self.label)
end

return Text