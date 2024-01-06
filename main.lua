local love = require("love")
require("globals")

local SceneManager = require("src/SceneManager")
local sceneManager = {}

local virtualWidth = 800
local virtualHeight = 600
local scale = 1
local offsetX, offsetY = 0, 0

local function updateScaleAndOffset()
    local windowWidth, windowHeight = _LG.getDimensions()
    scale = math.min(windowWidth / virtualWidth, windowHeight / virtualHeight)
    offsetX = (windowWidth - (virtualWidth * scale)) / 2
    offsetY = (windowHeight - (virtualHeight * scale)) / 2
end

function love.load()
    math.randomseed(os.time())

    _LG.setDefaultFilter("nearest", "nearest")
    _LG.setBackgroundColor(.25, .3, .23)

    updateScaleAndOffset()

    sceneManager = SceneManager.new()
    sceneManager:load("src/scenes/MainMenuScene")
end

function love.update(dt)
    sceneManager:update(dt)
end

function love.draw()
    _LG.push()
    _LG.translate(offsetX, offsetY)
    _LG.scale(scale, scale)

    sceneManager:draw()

    _LG.pop()
end

function love.keypressed(key)
    sceneManager:keypressed(key)

    if key == "p" then  -- Example key for toggling full screen
        local isFullscreen = _LW.getFullscreen()
        _LW.setFullscreen(not isFullscreen)
    end
end

function love.resize(w, h)
    updateScaleAndOffset()
    print("resize: " .. w .. "x" .. h)    
end