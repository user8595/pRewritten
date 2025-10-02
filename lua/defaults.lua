wWidth, wHeight = love.graphics.getWidth(), love.graphics.getHeight()
gWidth, gHeight = 640, 480

-- game booleans
isPaused = false
isLaunchedBall = false
isFail = false
isLoseLife = false

-- game board
board = {
    x = gWidth / 4,
    y = 0,
    w = gWidth / 2,
    h = gHeight
}

-- player objects
player = {
    x = gWidth - 32 / 2,
    y = gHeight - 60,

    vx = 300,
    vy = 300,

    w = 32,
    h = 16,

}

ball = {
    x = player.x,
    y = player.y - 6,

    vx = 350,
    vy = 350,

    w = 6,
    h = 6,
}

-- level object tables
blocks, item = {}, {}

-- colours
bgCol = {0.05, 0.05, 0.05}
boardCol = {0.15, 0.15, 0.15, 1}
white = {1, 1, 1, 1}
gray = {0.5, 0.5, 0.5, 1}