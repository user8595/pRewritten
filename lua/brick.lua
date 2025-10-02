local brick = {
    x = x,
    y = y,
    w = 32,
    h = 12,
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
    return brick
end

function brick:draw()
    if self.btype == 1 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    elseif self.btype == 2 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    elseif self.btype == 3 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    elseif self.btype == 4 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    elseif self.btype == 5 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    elseif self.btype == 6 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    elseif self.btype == 7 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    elseif self.btype == 8 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    else
        love.graphics.setColor(0.5, 0.5, 0.5)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    end
end

return brick
