local Btn = {}

function Btn:load(std)
    self.ui_grid = std.ui.grid('1x1')
        :add(std.node.load('src/ui/elements/TextSimple.lua'))

    self.text = self.ui_grid:get_item(1)
    self.text.data.label = self.label
    self.text.data.size = self.size
    self.text.data.font = self.font
    self.text.data.center_x = true
    self.text.data.center_y = true
end

function Btn:draw(std)
    local function animation(ms, min, max, duration)
        local range  = max - min
        local period = duration * 2
        local pos    = (ms % period) / duration
        if pos < 1 then
            return min + pos * range
        else
            return max - (pos - 1) * range
        end
    end
    local x, y = 0, 0

    if self.selected then
        local t = animation(std.milis, 0, 1, 1000)
        -- Start: 0x2C292EFF (r=0x2c, g=0x29, b=0x2e, a=0xFF)
        -- End:   0x66BFFFFF (r=0x66, g=0xBF, b=0xFF, a=0xFF)
        local r = math.floor(0x2c * (1 - t) + 0x66 * t)
        local g = math.floor(0x29 * (1 - t) + 0xBF * t)
        local b = math.floor(0x2e * (1 - t) + 0xFF * t)
        local a = 0xFF
        local color = r * 2^24 + g * 2^16 + b * 2^8 + a

        std.draw.color(color)
        std.draw.rect(0, 0, 0, self.width, self.height)
        std.draw.color(std.color.white)
        std.draw.rect(1, -1, -1, self.width+2, self.height+2)
    else
        std.draw.color(std.color.skyblue)
        std.draw.rect(0, 0, 0, self.width, self.height)
    end
    if self.center_x and self.img_width then
        x = (self.width/2)  - (self.img_width/2)
    end
    if self.center_y and self.img_height then
        y = (self.height/2) - (self.img_height/2)
    end
    if self.src and #self.src > 0 then
        std.image.draw(self.src, x, y)
    end
end

return Btn
