function gameContent()
    love.graphics.push()
    love.graphics.translate((wWidth - gWidth) / 2, (wHeight - gHeight) / 2)
    gameScreen()
    states()
    love.graphics.pop()
end

function gameKey(key)
    if key == "escape" then
        love.event.quit(0)
    end

    if key == "p" then
        if isPaused == false then
            isPaused = true
        else
            isPaused = false
        end
    end

    if key == "f11" then
        if love.window.getFullscreen() == false then
            love.window.setFullscreen(true)
        else
            love.window.setFullscreen(false)
        end
    end

    if key == "f4" then
        if isDebug == false then
            isDebug = true
        else
            isDebug = false
        end
    end
end

function gameLoop(dt)
    if state == "game" and isPaused == false and isFail == false then
        playerFunc(dt)
        playerMove(dt)
        playerCol()
        ballColP()
        levelUpdate()
        statsFunc()
    else
    end
end
