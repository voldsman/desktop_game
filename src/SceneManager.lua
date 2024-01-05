local SceneManager = {}

function SceneManager.new(self)
    local obj = {
        currentScene = {
            path = nil,
            scene = nil
        },
        previousScene = {
            path = nil,
            scene = nil
        }
    }
    setmetatable(obj, { __index = SceneManager })
    return obj
end

function SceneManager.draw(self)
    self.currentScene.scene:draw()
end

function SceneManager.update(self, dt)
    self.currentScene.scene:update(dt)
end

-- used on startup only to load first scene
function SceneManager.load(self, path)
    print("> Loading scene by path: " .. tostring(path))
    assert(type(path) == "string", "path: parameter must be a string.")
    if(not IS_WEB)then
        assert(_LF.getInfo(path .. ".lua") ~= nil, "path: file not found.")
    end

    if not package.loaded[path] then
        local loadedModule = require(path)
        self.currentScene.path = path
        self.currentScene.scene = loadedModule:new(self)
    end
end

function SceneManager.switchTo(self, path)
    print("> Switching scene by path: " .. tostring(path))
    self.previousScene = self.currentScene
    package.loaded[self.previousScene.path] = nil

    self:load(path)
end

return SceneManager