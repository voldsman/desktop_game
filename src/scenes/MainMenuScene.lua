local MainMenuScreen = {}

function MainMenuScreen.new(self, sceneManager)
    local obj = {
        sceneManager = sceneManager
    }
    setmetatable(obj, { __index = MainMenuScreen })
    return obj
end

function MainMenuScreen.draw(self)
    _LG.setBackgroundColor(.12, .09, .34)
end

function MainMenuScreen.update(self, dt)
    if _LK.isDown("g") then
        print("JUMP INTO [ GAME SCREEN ]")
        self.sceneManager:switchTo("src/scenes/GameScene")
    end
end

return MainMenuScreen