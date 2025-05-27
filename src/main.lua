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
    'assets/icon-wwa-40x40.png:assets/icon-wwa-40x40.png',
    'assets/icon-wwb-40x40.png:assets/icon-wwb-40x40.png',
    'assets/icon-wwc-40x40.png:assets/icon-wwc-40x40.png',
    'assets/icon-wwd-40x40.png:assets/icon-wwd-40x40.png',
    'assets/icon-wwe-40x40.png:assets/icon-wwe-40x40.png',
    'assets/icon-wwf-40x40.png:assets/icon-wwf-40x40.png',
    'assets/icon-wwg-40x40.png:assets/icon-wwg-40x40.png',
    'assets/icon-wwh-40x40.png:assets/icon-wwh-40x40.png',
    'assets/icon-wwi-40x40.png:assets/icon-wwi-40x40.png',
    'assets/icon-wwj-40x40.png:assets/icon-wwj-40x40.png',
    'assets/icon-wwk-40x40.png:assets/icon-wwk-40x40.png',
    'assets/icon-wwl-40x40.png:assets/icon-wwl-40x40.png',
    'assets/icon-wwm-40x40.png:assets/icon-wwm-40x40.png',
    'assets/icon-wwn-40x40.png:assets/icon-wwn-40x40.png',
    'assets/icon-wwo-40x40.png:assets/icon-wwo-40x40.png',
    'assets/icon-wwp-40x40.png:assets/icon-wwp-40x40.png',
    'assets/icon-wwq-40x40.png:assets/icon-wwq-40x40.png',
    'assets/icon-wwe-40x40.png:assets/icon-wwe-40x40.png',
    'assets/icon-wwr-40x40.png:assets/icon-wwr-40x40.png',
    'assets/icon-wws-40x40.png:assets/icon-wws-40x40.png',
    'assets/icon-wwt-40x40.png:assets/icon-wwt-40x40.png',
    'assets/icon-wwu-40x40.png:assets/icon-wwu-40x40.png',
    'assets/icon-wwv-40x40.png:assets/icon-wwv-40x40.png',
    'assets/icon-www-40x40.png:assets/icon-www-40x40.png',
    'assets/icon-wba-40x40.png:assets/icon-wba-40x40.png',
    'assets/icon-wbb-40x40.png:assets/icon-wbb-40x40.png',
    'assets/icon-wbc-40x40.png:assets/icon-wbc-40x40.png',
    'assets/icon-wbd-40x40.png:assets/icon-wbd-40x40.png',
    'assets/icon-wbe-40x40.png:assets/icon-wbe-40x40.png',
    'assets/icon-wbf-40x40.png:assets/icon-wbf-40x40.png',
    'assets/icon-wbg-40x40.png:assets/icon-wbg-40x40.png',
    'assets/icon-wbh-40x40.png:assets/icon-wbh-40x40.png',
    'assets/icon-wbi-40x40.png:assets/icon-wbi-40x40.png',
    'assets/icon-wbj-40x40.png:assets/icon-wbj-40x40.png',
    'assets/icon-wbk-40x40.png:assets/icon-wbk-40x40.png',
    'assets/icon-wbl-40x40.png:assets/icon-wbl-40x40.png',
    'assets/icon-wbm-40x40.png:assets/icon-wbm-40x40.png',
    'assets/icon-wbn-40x40.png:assets/icon-wbn-40x40.png',
    'assets/icon-wbo-40x40.png:assets/icon-wbo-40x40.png',
    'assets/icon-wbp-40x40.png:assets/icon-wbp-40x40.png',
    'assets/icon-wbq-40x40.png:assets/icon-wbq-40x40.png',
    'assets/icon-wbe-40x40.png:assets/icon-wbe-40x40.png',
    'assets/icon-wbr-40x40.png:assets/icon-wbr-40x40.png',
    'assets/icon-wbs-40x40.png:assets/icon-wbs-40x40.png',
    'assets/icon-wbt-40x40.png:assets/icon-wbt-40x40.png',
    'assets/icon-wbu-40x40.png:assets/icon-wbu-40x40.png',
    'assets/icon-wbv-40x40.png:assets/icon-wbv-40x40.png',
    'assets/icon-wbw-40x40.png:assets/icon-wbw-40x40.png',
    'assets/icon-wwy-64x64.png:assets/icon-wwy-64x64.png',
    'assets/icon-wwz-64x64.png:assets/icon-wwz-64x64.png',
    'assets/opening_background.png:assets/opening_background.png',
    'assets/Pe-icon-7-weather.ttf:Pe-icon-7-weather.ttf',
    'assets/home_icon.png:assets/home_icon.png'
}

return App
