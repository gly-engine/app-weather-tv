local IconWmo = {}
local wmo_day = 'bbjrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrfrrurrdrdrdssrrrdrlrlllrrrururururrtttrruurrrrrrrrxxrrx'
local wmo_night = 'aairrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrerrurrcrcrcssrrrcrkrkkkrrrururururrtttrruurrrrrrrrxxrrx'

function IconWmo:on_weather_api_response_day(std, api)
    local index, count = 1, 1
    local timestamp = os.time()

    if api.current and api.current.precipitation_probability then
        local umbrella_needed = api.current.precipitation_probability >= 30
        std.bus.emit('put_current_icon_wmo', umbrella_needed and 'z' or 'y')    
    end
    
    while api.hourly and index <= #api.hourly.time and count <= 8 do
        if api.hourly.time[index] > timestamp then
            local is_day = api.hourly.is_day[index]
            local wmo = api.hourly.weather_code[index] + 1
            local key = string.format('put_%d_1_calendar', count)
            std.bus.emit(key, (is_day == 1 and wmo_day or wmo_night):sub(wmo, wmo))
            count = count + 1
        end
        index = index + 1
    end
end

return IconWmo
