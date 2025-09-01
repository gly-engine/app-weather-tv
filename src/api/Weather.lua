local WeatherApi = {}
local base_url = 'https://api.open-meteo.com/v1/forecast'

local function weather_day(std, data)
    std.bus.emit('on_weather_api_response_day', std.http.body)
end

local function weather_week(std, data)
    std.bus.emit('on_weather_api_response_week', std.http.body)
end

function WeatherApi.on_geolocation_init(std, data, latitude, longitude)
    std.http.get(base_url):json()
        :param('latitude', tostring(latitude))
        :param('longitude', tostring(longitude))
        :param('current', 'is_day,weather_code,temperature_2m')
        :param('hourly', 'is_day,weather_code,temperature_2m')
        :param('timeformat','unixtime')
        :param('timezone', 'auto')
        :param('forecast_days', '2')
        :success(weather_day)
        :run()
end

return WeatherApi
