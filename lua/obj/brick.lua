local brick = {
    x = x,
    y = y,
    w = 36,
    h = 11,
    score = 100,
    btype = btype,
    itype = itype,
    hit = false,
}

function brick:new(x, y, btype, itype)
    local br = {
        x = x,
        y = y,
        btype = btype,
        itype = itype
    }
    setmetatable(br, self)
    self.__index = self
    return br
end

function brick:draw()
    if self.btype == 1 then
        love.graphics.setColor(bCol[1])
        love.graphics.draw(objTex[1], self.x, self.y)
    elseif self.btype == 2 then
        love.graphics.setColor(bCol[2])
        love.graphics.draw(objTex[1], self.x, self.y)
    elseif self.btype == 3 then
        love.graphics.setColor(bCol[3])
        love.graphics.draw(objTex[1], self.x, self.y)
    elseif self.btype == 4 then
        love.graphics.setColor(bCol[4])
        love.graphics.draw(objTex[1], self.x, self.y)
    elseif self.btype == 5 then
        love.graphics.setColor(bCol[5])
        love.graphics.draw(objTex[1], self.x, self.y)
    elseif self.btype == 6 then
        love.graphics.setColor(bCol[6])
        love.graphics.draw(objTex[1], self.x, self.y)
    elseif self.btype == 7 then
        love.graphics.setColor(bCol[7])
        love.graphics.draw(objTex[1], self.x, self.y)
    else
        love.graphics.setColor(0.5, 0.5, 0.5)
        love.graphics.draw(objTex[1], self.x, self.y)
    end
end

return brick
