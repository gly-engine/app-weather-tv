local Btn = {}

function Btn.load(std, data)
    data.ui_grid = std.ui.grid('1x1')
        :add(std.node.load('src/ui/elements/TextSimple.lua'))

    data.text = data.ui_grid:get_item(1)
    data.text.data.label = data.label
    data.text.data.size = data.size
    data.text.data.font = data.font
    data.text.data.center_x = true
    data.text.data.center_y = true
end

function Btn.draw(std, data)
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

    if data.selected then
        local t = animation(std.milis, 0, 1, 1000)
        -- Start: 0x2C292EFF (r=0x2c, g=0x29, b=0x2e, a=0xFF)
        -- End:   0x66BFFFFF (r=0x66, g=0xBF, b=0xFF, a=0xFF)
        local r = math.floor(0x2c * (1 - t) + 0x66 * t)
        local g = math.floor(0x29 * (1 - t) + 0xBF * t)
        local b = math.floor(0x2e * (1 - t) + 0xFF * t)
        local a = 0xFF
        local color = r * 2^24 + g * 2^16 + b * 2^8 + a

        std.draw.color(color)
        std.draw.rect(0, 0, 0, data.width, data.height)
        std.draw.color(std.color.white)
        std.draw.rect(1, -1, -1, data.width+2, data.height+2)
    else
        std.draw.color(std.color.skyblue)
        std.draw.rect(0, 0, 0, data.width, data.height)
    end
    if data.center_x and data.img_width then
        x = (data.width/2)  - (data.img_width/2)
    end
    if data.center_y and data.img_height then
        y = (data.height/2) - (data.img_height/2)
    end
    if data.src and #data.src > 0 then
        std.image.draw(data.src, x, y)
    end
end

return Btn
