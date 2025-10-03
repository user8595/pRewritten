wWidth, wHeight = love.graphics.getWidth(), love.graphics.getHeight()
gWidth, gHeight = 640, 480

-- fonts
pSans, picopixel = love.graphics.newFont("/assets/PixeloidSans.ttf", 16), love.graphics.newFont("/assets/Picopixel.ttf", 14)
pSansS = love.graphics.newFont("/assets/PixeloidSans.ttf", 14)

-- game booleans
isDebug = false

isPaused = false
isLaunchedBall = false

isFail = false
isLoseLife = false

-- game board
board = {
    x = gWidth / 4 - 20,
    y = 0,
    w = gWidth / 2 + 40,
    h = gHeight
}

-- player objects
player = {
    x = gWidth / 2 - 32,
    y = gHeight - 60,

    vx = 400,
    vy = 400,

    w = 64,
    h = 16,
}

ball = {
    x = player.x + player.w / 2 + 8,
    y = player.y - 8,

    vx = 350,
    vy = 350,

    w = 8,
    h = 8,
}

keys = {
    left = "left",
    right = "right",
    launch = "z",
}

stats = {
    score = 0,
    exLife = 25000,
    hScore = 0,
    lifes = 2,
}

-- game states
state = "game" -- "title", "menu", "levelSelect", "game"
level = 1

blocks, items = {}, {}

-- colours
bgCol = {0.05, 0.05, 0.05}
boardCol = {1, 1, 1, 0.01}
borderCol = {0.75, 0.75, 0.75}

white = {1, 1, 1, 1}
gray = {0.5, 0.5, 0.5, 1}

bCol = {
    {1, 1, 1},
    {1, 0.5, 0.5},
    {0.5, 1, 0.5},
    {0.5, 0.5, 1},
    {1, 1, 0.5},
    {0.5, 1, 1},
    {1, 0.5, 1},
}