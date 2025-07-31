
local GeoLoc = {}
local base_url = 'http://ip-api.com/json'

local function geoloc_failed(std, data)
    local places = {
        {'Guarulhos, SP, Brasil', -23.5489, -46.6388},
        {'Florianopolis, SC, Brasil', -27.5935, -48.5585},
        {'Porto Alegre, RS, Brasil', -30.0330, -51.2300}
    }

    local place = places[(os.time() % #places) + 1]
    std.bus.emit('put_gelocation_str', place[1])
    std.bus.emit('on_geolocation_init', place[2], place[3])
end

local function geoloc_success(std, data)
    local location = string.format('%s, %s, %s', std.http.body.city, std.http.body.region, std.http.body.country)
    std.bus.emit('put_gelocation_str', location)
    std.bus.emit('on_geolocation_init', std.http.body.lat, std.http.body.lon)
end

function GeoLoc:init(std)
    std.http.get(base_url):json()
        :param('fields', 'country,region,city,lat,lon')
        :param('lang', 'pt-BR')
        :success(geoloc_success)
        :failed(geoloc_failed)
        :error(geoloc_failed)
        :noforce()
        :run()
end

return GeoLoc
