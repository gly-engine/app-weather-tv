local TemperatureDay = {}

function TemperatureDay:on_weather_api_response_day(std, api)
    local index, count = 1, 1
    local timestamp = os.time()

    while index <= #api.hourly.time and count <= 8 do
        if api.hourly.time[index] > timestamp then
            local key_3 = string.format('put_%d_3_calendar', count)
            local key_2 = string.format('put_%d_2_calendar', count)
            local val_3 = string.format('%.0f \194\186C', api.hourly.temperature_2m[index])
            local val_2 = os.date("%H:%M", api.hourly.time[index])
            if count == 1 then
                val_2 = 'Now'
            end
            std.bus.emit(key_3, val_3)
            std.bus.emit(key_2, val_2)
            count = count + 1
        end
        index = index + 1
    end
end

return TemperatureDay
