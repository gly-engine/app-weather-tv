local App = {
    title = 'Weather TV',
    author = 'RodrigoDornelles',
    description = 'Cross-platform TV Weather Application / Widget (Ginga NCL, Tizen, WebOS)',
    version = '0.0.21',
    require = 'http json i18n'
}

function App.i18n()
    return {
    ['pt-BR'] = {
        ['January'] = 'Janeiro',
        ['February'] = 'Fevereiro',
        ['March'] = 'Março',
        ['April'] = 'Abril',
        ['May'] = 'Maio',
        ['June'] = 'Junho',
        ['July'] = 'Julho',
        ['August'] = 'Agosto',
        ['September'] = 'Setembro',
        ['October'] = 'Outubro',
        ['November'] = 'Novembro',
        ['December'] = 'Dezembro',

        ['Sunday'] = 'Domingo',
        ['Monday'] = 'Segunda-feira',
        ['Tuesday'] = 'Terça-feira',
        ['Wednesday'] = 'Quarta-feira',
        ['Thursday'] = 'Quinta-feira',
        ['Friday'] = 'Sexta-feira',
        ['Saturday'] = 'Sábado',

        ['Now'] = 'Agora',
        ['Hour'] = 'Hora',
        ['Day'] = 'Dia',

        ['In This Moment'] = 'Neste Momento',
    }
}
end

function App.load(std, data)
    std.node.spawn(std.node.load('src/api/GeoLoc'))
    std.node.spawn(std.node.load('src/api/Weather'))
    std.node.spawn(std.node.load('src/service/IconWmo'))
    std.node.spawn(std.node.load('src/service/TemperatureNow'))
    std.node.spawn(std.node.load('src/service/TemperatureDay'))
    std.node.spawn(std.node.load('src/service/TemperatureWeek'))
    std.ui.grid('1x1'):add(std.node.load('src/ui/pages/home.lua')):apply()
end

App.fonts = {
    'Plex:https://cdn.jsdelivr.net/gh/gly-engine/fonts/IBM_Plex_Sans/IBMPlexSans-Regular.ttf',
    'Weather:Pe-icon-7-weather.ttf'
}

App.assets = {
    'assets/clean-day.jpg:clean-day.jpg',
    'assets/opening_background.png:assets/opening_background.png',
    'assets/Pe-icon-7-weather.ttf:Pe-icon-7-weather.ttf',
    'assets/home_icon.png:assets/home_icon.png'
}

return App
