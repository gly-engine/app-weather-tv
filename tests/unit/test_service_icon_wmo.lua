local IconWmo = require('src/service/IconWmo')

local weathers = {
    [0]='a',[1]='a',[2]='i',[3]='r',[45]='e',[48]='u',[51]='c',[53]='c',[55]='c',[56]='s',[57]='s',[61]='c',[63]='k',[65]='k',
    [66]='k',[67]='k',[71]='u',[73]='u',[75]='u',[77]='u',[80]='t',[81]='t',[82]='t',[85]='u',[86]='u',[95]='x',[96]='x',[99]='x'
}

local night_to_day = {
    ['a']='b',['c']='d',['e']='f',['g']='h',['i']='j',['k']='l',['m']='n',['o']='p'
}

function test_wmo_is_current_rain()
    local function check(percentage, expected)
        local emitted = {}
        local std = {bus = {emit = function(key, value) emitted[key] = value end}}
        IconWmo.on_weather_api_response_day(std, {}, {current = {precipitation_probability = percentage}})
        return emitted.put_current_icon_wmo == expected
    end

    assert(check(29, 'y'))
    assert(check(31, 'z'))
end

--! @todo write test
function test_wmo_hourly_weather()
end

test_wmo_is_current_rain()
