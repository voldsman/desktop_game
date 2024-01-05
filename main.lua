local love = require("love")
require("globals")

local SceneManager = require("src/SceneManager")
local sceneManager = {}

function love.load()
    love.graphics.setBackgroundColor(.53, .09, 33)

    sceneManager = SceneManager.new()
    sceneManager:load("src/scenes/MainMenuScene")
end

function love.update(dt)
    sceneManager:update(dt)
end

function love.draw()
    sceneManager:draw()
end

function love.keypressed(key)
    if key == "p" then  -- Example key for toggling full screen
        local isFullscreen = love.window.getFullscreen()
        love.window.setFullscreen(not isFullscreen)
    end
end

function love.resize(w, h)
    print("resize: " .. w .. "x" .. h)    
end