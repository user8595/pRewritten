function gameContent()
    gameScreen()
    states()
end

function gameKey(key)
    if key == "escape" then
        love.event.quit(0)
    end
end

function gameLoop(dt)
    if state == "game" then
        
    end
end