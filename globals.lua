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

RESET_COLOR = {1, 1, 1, 1}

-- tml placing it here
BG_IMAGE = _LG.newImage("src/assets/images/background.jpg")
FONT_NAME = "src/assets/fonts/VCR_OSD_MONO_1.001.ttf"
FONT22 = _LG.newFont(FONT_NAME, 22)
FONT18 = _LG.newFont(FONT_NAME, 18)