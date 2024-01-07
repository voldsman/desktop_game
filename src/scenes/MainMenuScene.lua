local MainMenuScreen = {}

function MainMenuScreen.new(self, sceneManager)
    local obj = {
        sceneManager = sceneManager,
        menuItems = {
            "New Game",
            "Load Game",
            "Settings",
            "Quit"
        },
        selectedMenuItem = 1,
        blinkTimer = 0, 
        blinkInterval = 0.3,
        showBlink = true
    }
    setmetatable(obj, { __index = MainMenuScreen })
    return obj
end

function MainMenuScreen.draw(self)
    _LG.draw(_LG.newImage("src/assets/images/background.jpg"))
    --_LG.setBackgroundColor(.12, .09, .34)

    local menuWidth = 200

    _LG.setColor(0.5, 0.6, 0.5, 0.5)
    _LG.rectangle("fill", 0, 0, menuWidth, _LG.getHeight())
    _LG.setColor(RESET_COLOR)

    _LG.setFont(FONT22)--_LG.newFont(FONT_NAME, 22)
    --_LG.setFont(_LG.newFont(FONT_NAME, 22))
    local gameNameText = "Desktop Game"
    local font22 = _LG.getFont()
    local textWidth = font22:getWidth(gameNameText)
    local x = (menuWidth - textWidth) / 2
    _LG.print(gameNameText, x, 150)

    _LG.setFont(FONT18)
    local font18 = _LG.getFont()
    local fontHeight = font18:getHeight()
    for i, menuItem in ipairs(self.menuItems) do
        local menuItemText = menuItem
        if(i == self.selectedMenuItem) then
            if self.showBlink then
                menuItemText = "> " .. menuItemText .. " <"
            end
        end

        local menuItemWidth = font18:getWidth(menuItemText)
        local menuItemX = (menuWidth - menuItemWidth) / 2

        -- 200 is start point of menuItems
        _LG.print(menuItemText, menuItemX, 200 + (i * 2) * fontHeight)
    end

    _LG.setColor(RESET_COLOR)
end

function MainMenuScreen.update(self, dt)
    -- if _LK.isDown("g") then
    --     print("JUMP INTO [ GAME SCREEN ]")
    --     self.sceneManager:switchTo("src/scenes/GameScene")
    -- end

    self.blinkTimer = self.blinkTimer + dt
    if self.blinkTimer >= self.blinkInterval then
        self.blinkTimer = 0
        self.showBlink = not self.showBlink
    end
end

function MainMenuScreen.keypressed(self, key)
    if key == "down" then
        self.selectedMenuItem = (self.selectedMenuItem % #self.menuItems) + 1
    elseif key == "up" then
        self.selectedMenuItem = (self.selectedMenuItem - 2) % #self.menuItems + 1
    elseif key == "return" or key == "kpenter" then
        local menuItem = self.selectedMenuItem
        if(menuItem == 1) then
            self.sceneManager:switchTo("src/scenes/GameScene")
        elseif menuItem == 2 then
            print("JUMP INTO [ LOAD GAME SCREEN ]")
        elseif menuItem == 3 then
            print("JUMP INTO [ SETTINGS SCREEN ]")
        elseif menuItem == 4 then
            print("EXIT GAME")
            _LE.quit()
        end
    end
end

return MainMenuScreen