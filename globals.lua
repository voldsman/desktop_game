local love = require("love")

_LG = love.graphics
_LM = love.mouse
_LE = love.event
_LI = love.image
_LF = love.filesystem
_LW = love.window
_LK = love.keyboard
_LS = love.system

OS_TYPE = _LS.getOS()
IS_WEB = OS_TYPE == "Web"