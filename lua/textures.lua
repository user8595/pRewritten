love.graphics.setDefaultFilter("nearest", "nearest")

whitePixel = love.graphics.newImage(love.image.newImageData(1, 1, "rgba8", "\255\255\255\255"))

playerTex = {
    love.graphics.newImage("assets/textures/game/paddle.png"),
    love.graphics.newImage("assets/textures/game/paddle_outline.png")
}

ballTex = love.graphics.newImage("assets/textures/game/ball.png")

hudTex = {
    love.graphics.newImage("/assets/textures/game/lifeicon.png")
}

objTex = {
    love.graphics.newImage("/assets/textures/game/brick.png")
}
