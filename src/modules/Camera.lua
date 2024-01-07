local Camera = {}

function Camera.new(self, mapWidth, mapHeight, viewportWidth, viewportHeight)
    local obj = {
        x = 0,
        y = 0,
        mapWidth = mapWidth,
        mapHeight = mapHeight,
        viewportWidth = viewportWidth,
        viewportHeight = viewportHeight
    }
    setmetatable(obj, { __index = Camera })
    return obj
end

function Camera.update(self, dt, playerX, playerY)
    local halfViewportWidth = self.viewportWidth / 2
    local halfViewportHeight = self.viewportHeight / 2

    -- Desired camera position (centered on player)
    -- 80 - half player width/height
    local desiredX = math.max(0, math.min(self.mapWidth - self.viewportWidth, playerX - halfViewportWidth + 80))
    local desiredY = math.max(0, math.min(self.mapHeight - self.viewportHeight, playerY - halfViewportHeight + 80))

    -- Lerp factor and damping factor
    local lerpFactor = 4 -- Adjust for smoother movement (higher is faster)
    local damping = 0.1 -- Adjust for bounce effect (small value for subtle bounce)

    -- Smoothly update camera position with lerp and damping
    self.x = self.x + (desiredX - self.x) * dt * lerpFactor + (desiredX - self.x) * damping
    self.y = self.y + (desiredY - self.y) * dt * lerpFactor + (desiredY - self.y) * damping

end

function Camera.set(self)
    _LG.push()
    _LG.translate(-self.x, -self.y)
end

function Camera.unset(self)
    _LG.pop()
end

return Camera