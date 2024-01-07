local Camera = require("src/modules/Camera")
local Player = require("src/models/Player")

local GameScene = {}

local scaleFactor = 3;
local tileSize = 32
local worldTilesX = 20
local worldTilesY = 20

function GameScene.new(self, sceneManager)
    local obj = {
        sceneManager = sceneManager,
        camera = Camera:new(worldTilesX * tileSize * scaleFactor, worldTilesY * scaleFactor * tileSize, _LG.getWidth(), _LG.getHeight()),
        player = Player:new(100, 100),
        tile1Image = _LG.newImage("src/assets/images/tiles/grass1.png")
    }
    setmetatable(obj, { __index = GameScene })
    return obj
end

function GameScene.draw(self)
    self.camera:set()

    _LG.setBackgroundColor(.67, .89, .99)
    
    for tileX = 0,worldTilesX do -- 3200
        for tileY = 0,worldTilesY do -- 1600
            local x = tileX * tileSize * scaleFactor
            local y = tileY * tileSize * scaleFactor
            _LG.draw(self.tile1Image, x, y, 0, scaleFactor, scaleFactor)
            _LG.print(tileX .. "|" .. tileY, x, y)
        end
    end

    self.player:draw()

    self.camera:unset()

    -- UI elements
    _LG.print("Game Screen", 200, 200)

end

function GameScene.update(self, dt)
    self.player:update(dt)

    self.camera:update(dt, self.player.x, self.player.y)
end

function GameScene.keypressed(self, key)
    if (key == "m") then
        print("JUMP INTO [ MAIN MENU SCREEN ]")
        self.sceneManager:switchTo("src/scenes/MainMenuScene")
    end
end

return GameScene