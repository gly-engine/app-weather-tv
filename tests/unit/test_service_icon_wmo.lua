local IconWmo = require('src/service/IconWmo')

function test_wmo_rain()
    local function check(code, expected)
        local emitted = {}
        local std = {bus = {emit = function(key, value) emitted[key] = value end}}
        IconWmo.on_weather_api_response_day(std, {}, {current = {weather_code = code}})
        return emitted.put_current_icon_wmo == expected
    end

    assert(check(0, 'y'))
    assert(check(1, 'y'))
    assert(check(2, 'y'))
    assert(check(3, 'y'))
    assert(check(45, 'y'))
    assert(check(48, 'y'))
    assert(check(71, 'y'))
    assert(check(73, 'y'))
    assert(check(75, 'y'))
    assert(check(77, 'y'))
    assert(check(85, 'y'))
    assert(check(86, 'y'))

    assert(check(51, 'z'))
    assert(check(53, 'z'))
    assert(check(55, 'z'))
    assert(check(56, 'z'))
    assert(check(57, 'z'))
    assert(check(61, 'z'))
    assert(check(63, 'z'))
    assert(check(65, 'z'))
    assert(check(66, 'z'))
    assert(check(67, 'z'))
    assert(check(80, 'z'))
    assert(check(81, 'z'))
    assert(check(82, 'z'))
    assert(check(95, 'z'))
    assert(check(96, 'z'))
    assert(check(99, 'z'))
end

test_wmo_rain()
