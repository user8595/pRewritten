function gameBoard()
    love.graphics.setColor(boardCol)
    love.graphics.rectangle("fill", board.x, board.y, board.w, board.h)

    love.graphics.setColor(borderCol)
    love.graphics.draw(whitePixel, board.x, board.y, 0, 2, board.h)
    love.graphics.draw(whitePixel, board.x + board.w, board.y, 0, 2, board.h)

    love.graphics.draw(whitePixel, board.x, board.y + 120, 0, -100, 2)
    love.graphics.draw(whitePixel, board.x + board.w, board.y + 120, 0, 100, 2)
end

function hud()
    love.graphics.setColor(white)
    love.graphics.printf({gray, "Hi-Score"}, picopixel, 0, board.y + 75, board.w / 2 - 7.5 - 40, "right")
    love.graphics.printf({white, stats.hScore}, pSans, 0, board.y + 91.5, board.w / 2 - 7.5 - 40, "right")

    love.graphics.printf({gray, "Score"}, picopixel, board.x + board.w + 12, board.y + 75, board.w / 2 - 7.5, "left")
    love.graphics.printf({white, stats.score}, pSans, board.x + board.w + 12, board.y + 91.5, board.w / 2 - 7.5, "left")

    love.graphics.draw(hudTex[1], board.x + board.w + 12, board.y + 133, 0, 0.5)
    love.graphics.printf({white, "x" .. stats.lifes}, picopixel, board.x + board.w + 12, board.y + 150, board.w / 2 - 7.5, "left")

    love.graphics.printf({gray, "Lv."}, picopixel, board.x + board.w + 12, board.y + 400, board.w / 2 - 7.5, "left")
    love.graphics.printf({white, level}, pSans, board.x + board.w + 12, board.y + 417, board.w / 2 - 7.5, "left")
end

function failScreen()
    love.graphics.setColor(0, 0, 0, 0.65)
    love.graphics.rectangle("fill", 0, 0, gWidth, gHeight)    
end

function pauseScreen()
    love.graphics.setColor(0, 0, 0, 0.65)
    love.graphics.rectangle("fill", 0, 0, gWidth, gHeight)
end

function debugMenu()
    love.graphics.print(love.timer.getFPS() .. " FPS", picopixel, 10, 10)
    love.graphics.print(wWidth .. "x" .. wHeight, picopixel, 10, 25)
    love.graphics.print(ball.vx .. ", ".. ball.vy, picopixel, 10, 40)
end
