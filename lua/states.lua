function gameScreen()
    if state == "game" then
        gameBoard()
        gameDisplay()
        hud()
    end
end

function states()
    if isFail then
        failScreen()
    else
    end

    if isPaused then
        pauseScreen()
    else
    end
end
