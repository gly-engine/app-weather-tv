local App = {
    title = 'Weather TV',
    author = 'RodrigoDornelles',
    description = 'Cross-platform TV Weather Application / Widget (Ginga NCL, Tizen, WebOS)',
    version = '0.0.21',
    require = 'http json'
}

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
    'assets/Pe-icon-7-weather.ttf:Pe-icon-7-weather.ttf'
}

return App
