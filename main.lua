require("lua.defaults")
require("lua.textures")
require("lua.content")
require("lua.levels")
require("lua.states")
require("lua.game")
require("lua.ui")

function love.load()
    love.graphics.setBackgroundColor(bgCol)
end

function love.keypressed(key)
    gameKey(key)
end

function love.update(dt)
    gameLoop(dt)
end

function love.resize(w, h)
    wWidth, wHeight = w, h
end

function love.draw()
    gameContent()
end
