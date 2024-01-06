local love = require("love")
require("globals")

local SceneManager = require("src/SceneManager")
local sceneManager = {}

local virtualWidth = 800
local virtualHeight = 600
local scale = 1
local offsetX, offsetY = 0, 0

local function updateScaleAndOffset()
    local windowWidth, windowHeight = love.graphics.getDimensions()
    scale = math.min(windowWidth / virtualWidth, windowHeight / virtualHeight)
    offsetX = (windowWidth - (virtualWidth * scale)) / 2
    offsetY = (windowHeight - (virtualHeight * scale)) / 2
end

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    updateScaleAndOffset()
    love.graphics.setBackgroundColor(.25, .3, .23)

    sceneManager = SceneManager.new()
    sceneManager:load("src/scenes/MainMenuScene")
end

function love.update(dt)
    sceneManager:update(dt)
end

function love.draw()
    love.graphics.push()
    love.graphics.translate(offsetX, offsetY)
    love.graphics.scale(scale, scale)

    sceneManager:draw()

    love.graphics.pop()
end

function love.keypressed(key)
    sceneManager:keypressed(key)

    if key == "p" then  -- Example key for toggling full screen
        local isFullscreen = love.window.getFullscreen()
        love.window.setFullscreen(not isFullscreen)
    end
end

function love.resize(w, h)
    updateScaleAndOffset()
    print("resize: " .. w .. "x" .. h)    
end