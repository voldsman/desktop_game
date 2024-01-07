local love = require("love")
require("globals")

local SceneManager = require("src/managers/SceneManager")
local sceneManager = {}

function love.load()
    math.randomseed(os.time())

    _LM.setVisible(false)
    _LG.setDefaultFilter("nearest", "nearest")
    _LG.setBackgroundColor(.25, .3, .23)

    sceneManager = SceneManager.new()
    sceneManager:load("src/scenes/MainMenuScene")
end

function love.update(dt)
    sceneManager:update(dt)
end

function love.draw()
    sceneManager:draw()

    -- tmp
    love.graphics.print('FPS: ' .. love.timer.getFPS(), 700, 10)
end

function love.keypressed(key)
    sceneManager:keypressed(key)

    if key == "p" then  -- Example key for toggling full screen
        local isFullscreen = _LW.getFullscreen()
        _LW.setFullscreen(not isFullscreen)
    end
end

function love.resize(w, h)
    print("window resized: " .. w .. "x" .. h)
end