local IconWmo = {}
--! @todo: correct lockuptables
local wmo_day = 'bddfhljnpbddfhljnpbddfhljnpbddfhljnpbddfhljnpbddfhljnpbddfhljnpbddfhljnpbddfhljnpbdd'
local wmo_rain = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyzzzyzzzzzzzzzzzzzzzyzzzzyyyyyzzzzzyyyyyyyyyzyzzzyyz'
local wmo_night = 'acegikmoacegikmoacegikmoacegikmoacegikmoacegikmoacegikmoacegikmoacegikmoacegikmoace'

function IconWmo.on_weather_api_response_day(std, data, api)
    local index, count = 1, 1
    local timestamp = os.time()

    if api.current then
        local wmo = api.current.weather_code + 1
        std.bus.emit('put_current_icon_wmo', wmo_rain:sub(wmo, wmo))    
    end
    
    while api.hourly and index <= #api.hourly.time and count <= 8 do
        if api.hourly.time[index] > timestamp then
            local is_day = api.hourly.is_day[index]
            local wmo = api.hourly.weather_code[index] + 1
            local key = string.format('put_%d_1_calendar', count)
            std.bus.emit(key, (is_day and wmo_day or wmo_night):sub(wmo, wmo))
            count = count + 1
        end
        index = index + 1
    end
end

return IconWmo
