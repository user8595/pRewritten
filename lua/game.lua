-- objects
require("lua.brick")
require("lua.item")

function gameDisplay()
    love.graphics.setColor(white)
    love.graphics.draw(playerTex[1], player.x, player.y)
    love.graphics.draw(ballTex, ball.x, ball.y)

    if love.keyboard.isDown(keys.launch) and isPause == false and isFail == false then
        love.graphics.draw(playerTex[2], player.x - 2, player.y - 2)
    end

    for i, v in ipairs(blocks) do
        v:draw()
    end
end

function levelUpdate()
    for i, v in ipairs(blocks) do
        if v.hit then
            table.remove(blocks, i)
            stats.score = stats.score + v.score
        end
    end
end

function playerFunc(dt)
    if isLaunchedBall then
        ball.x, ball.y = ball.x + dt * ball.vx, ball.y - dt * ball.vy
    else
    end
end

function playerMove(dt)
    if isLaunchedBall == false then
        if love.keyboard.isDown(keys.left) then
            player.x, ball.x = math.floor(player.x - dt * player.vx), math.floor(ball.x - dt * player.vx)
        elseif love.keyboard.isDown(keys.right) then
            player.x, ball.x = math.floor(player.x + dt * player.vx), math.floor(ball.x + dt * player.vx)
        end
    else
        if love.keyboard.isDown(keys.left) then
            if love.keyboard.isDown(keys.launch) then
                player.x = math.floor(player.x - dt * 700)
            else
                player.x = math.floor(player.x - dt * player.vx)
            end
        elseif love.keyboard.isDown(keys.right) then
            if love.keyboard.isDown(keys.launch) then
                player.x = math.floor(player.x + dt * 700)
            else
                player.x = math.floor(player.x + dt * player.vx)
            end
        end
    end

    if love.keyboard.isDown(keys.launch) and isLaunchedBall == false then
        isLaunchedBall = true
    end
end

-- player & ball move collision
function playerCol()
    local bL, bR, bT, bB = ball.x, ball.x + ball.w, ball.y, ball.y + ball.h
    if isLaunchedBall == false then
        -- board
        if player.x < board.x then
            player.x, ball.x = board.x, board.x + player.w / 2 + 8
        end
        if player.x > board.x + board.w - player.w then
            player.x, ball.x = board.x + board.w - player.w, board.x + board.w - player.w + player.w / 2 + 8
        end
    else
        if player.x < board.x then
            player.x = board.x
        end
        if player.x > board.x + board.w - player.w then
            player.x = board.x + board.w - player.w
        end

        -- ball hitbox
        if bR > board.x + board.w then
            ball.x = board.x + board.w - ball.w
            ball.vx = -ball.vx
        elseif bL < board.x then
            ball.x = board.x
            ball.vx = -ball.vx
        elseif bB > board.h then
            isLaunchedBall = false
            player.x = gWidth / 2 - 32
            ball.x = player.x + player.w / 2 + 8
            stats.lifes = stats.lifes - 1
            ball.vx = math.abs(350)
            ball.vy = math.abs(350)
            ball.y = player.y - 8
        elseif bT < board.y then
            ball.y = board.y
            ball.vy = -ball.vy
        end
    end
end

function statsFunc()
    if stats.score > stats.hScore then
        stats.hScore = stats.score
    end

    if stats.lifes < 0 then
        stats.lifes = 0
        isFail = true
    end
end

function ballCol(obj)
    local bL, bR, bT, bB = ball.x, ball.x + ball.w, ball.y, ball.y + ball.h
    local oL, oR, oT, oB = obj.x, obj.x + obj.w, obj.y, obj.y + obj.h

    --TODO: Finish object hitboxes
end

function ballColP()
    local bL, bR, bT, bB = ball.x, ball.x + ball.w, ball.y, ball.y + ball.h

    if bB > player.y and bR > player.x and bL < player.x + player.w and ball.x > player.x and ball.x < player.x + player.w - ball.w and ball.y < player.y + player.h then
        ball.y = player.y - ball.h
        if ball.vx < 550 and ball.vy < 550 and ball.vx > -550 and ball.vy > -550 then
            ball.vy = math.abs(ball.vy - 1)
            if ball.vx > 0 then
                ball.vx = ball.vx + 0.5
            else
                ball.vx = ball.vx - 0.5
            end
            if ball.vy > ball.vx and ball.vy > 350 and ball.vy < 550 then
                ball.vy = ball.vy - 0.5
            else
                ball.vy = ball.vy + 0.5
            end
        else
            ball.vy = math.abs(ball.vy)
        end
    end
end