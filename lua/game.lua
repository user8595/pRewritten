-- objects
local br = require("lua.obj.brick")
local it = require("lua.obj.item")
local table_clear = require("table.clear")

-- level table
lvTable = lv1

for y, r in ipairs(lvTable) do
    for x, t in ipairs(r) do
        if t ~= 0 then
            table.insert(blocks, br:new(board.x + 36 * (x - 1), board.y + 64 + 32 * (y - 1), t, 1))
        end 
    end
end

function gameDisplay()
    love.graphics.setColor(white)
    love.graphics.draw(playerTex[1], player.x, player.y)
    love.graphics.draw(ballTex, ball.x, ball.y)

    if love.keyboard.isDown(keys.launch) and isPaused == false and isFail == false then
        love.graphics.draw(playerTex[2], player.x - 2, player.y - 2)
    else
    end

    for i, v in ipairs(blocks) do
        v:draw()
    end
end

function levelReset()
    table_clear(blocks)
    for y, r in ipairs(lvTable) do
        for x, t in ipairs(r) do
            if t ~= 0 then
                table.insert(blocks, br:new(board.x + 36 * (x - 1), board.y + 64 + 32 * (y - 1), t, 1))
            end 
        end
    end
end

function screenShake(dt)
    if isShake then
        shakeT = shakeT + dt
    end

    if shakeT > 0 then
        tX, tY = (wWidth - gWidth) / 2 + love.math.random(-0.25, 0.25), (wHeight - gHeight) / 2 + love.math.random(-0.25, 0.25)
    else
        tX, tY = (wWidth - gWidth) / 2, (wHeight - gHeight) / 2
    end

    -- stop screen shake effect
    if shakeT > 0.1 then
        isShake = false
        shakeT = 0
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
                player.d = -1
            else
                player.x = math.floor(player.x - dt * player.vx)
                player.d = -1
            end
        elseif love.keyboard.isDown(keys.right) then
            if love.keyboard.isDown(keys.launch) then
                player.x = math.floor(player.x + dt * 700)
                player.d = 1
            else
                player.x = math.floor(player.x + dt * player.vx)
                player.d = 1
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
            isShake = true
        elseif bT < board.y then
            ball.y = board.y
            ball.vy = -ball.vy
        end
    end
end

function statsFunc(dt)
    if stats.score > stats.hScore then
        stats.hScore = stats.score
    end

    if stats.lifes < 0 then
        stats.lifes = 0
        isFail = true
    end

    if stats.score >= stats.exLife then
        stats.lifes = stats.lifes + 1
        stats.exLife = stats.exLife + 25000
    end
end

--TODO: Improve ball angle handling?
function ballColP()
    local bL, bR, bT, bB = ball.x, ball.x + ball.w, ball.y, ball.y + ball.h
    
    if bB > player.y and bR > player.x and bL < player.x + player.w and
    ball.x > player.x and ball.x < player.x + player.w and ball.y < player.y + player.h then
        ball.y = player.y - ball.h
        if ball.vx < 550 and ball.vy < 550 and ball.vx > -550 and ball.vy > -550 then
            -- x speed
            if player.d == -1 then
                if ball.vx > 0 then
                    ball.vx = math.abs(ball.vx + 1)
                else
                    ball.vx = -math.abs(ball.vx - 1)
                end
            elseif player.d == 1 then
                if ball.vx > 0 then
                    ball.vx = -math.abs(ball.vx - 1)
                else
                    ball.vx = math.abs(ball.vx + 1)
                end
            end
            
            -- y speed
            if ball.vy > 0 then
                ball.vy = -math.abs(ball.vy + 1)
            else
                ball.vy = math.abs(ball.vy - 1)
            end
        end
    end
end

--TODO: Improve ball collision with bricks
function ballCol(obj)
    local bL, bR, bT, bB = ball.x, ball.x + ball.w, ball.y, ball.y + ball.h
    local objL, objR, objT, objB = obj.x, obj.x + obj.w, obj.y, obj.y + obj.h
    
    if bL > objL and bL < objR and bT > objT and bT < objB then
        if bT < objB or bB > objT then
            -- wait what
            print("true..")
            obj.hit = true
            ball.vy = -ball.vy
        end
    end
end

function levelUpdate()
    for i, v in ipairs(blocks) do
        ballCol(v)
        if v.hit then
            table.remove(blocks, i)
            stats.score = stats.score + v.score
        end
    end
end