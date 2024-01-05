local love = require("love")

function love.conf(t)
    t.identity = "desktop_game"
    t.console = true

    t.window.title = "Desktop Game"
    t.window.icon = nil
    t.window.width = 800
    t.window.height = 600

    t.window.resizable = false
    t.window.minwidth = 800
    t.window.minheight = 600
    
    t.window.fullscreen = false
    t.window.display = 1

    t.accelerometerjoystick = false

    t.modules.physics = false
    t.modules.touch = false
    t.modules.joystick = false
    t.modules.video = false
end