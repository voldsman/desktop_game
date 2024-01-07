local Player = {}

function Player.new(self, x, y)
    local obj = {
        x = x,
        y = y,
    }
    setmetatable(obj, { __index = Player })
    return obj
end


function Player.draw(self)
    _LG.draw(_LG.newImage("src/assets/images/player.png"), self.x, self.y, 0, 5, 5)
end

function Player.update(self, dt)
    if _LK.isDown("left") then
        self.x = self.x - 200 * dt
    elseif _LK.isDown("right") then
        self.x = self.x + 200 * dt
    end
    if _LK.isDown("up") then
        self.y = self.y - 200 * dt
    elseif _LK.isDown("down") then
        self.y = self.y + 200 * dt
    end
end

return Player