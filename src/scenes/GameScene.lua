local GameScene = {}

function GameScene.new(self, sceneManager)
    local obj = {
        sceneManager = sceneManager
    }
    setmetatable(obj, { __index = GameScene })
    return obj
end

function GameScene.draw(self)
    _LG.setBackgroundColor(.98, .19, .99)
end

function GameScene.update(self, dt)
    if _LK.isDown("m") then
        print("JUMP INTO [ MAIN MENU SCREEN ]")
        self.sceneManager:switchTo("src/scenes/MainMenuScene")
    end
end

return GameScene