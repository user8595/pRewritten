local pitem = {
    x = x,
    y = y,
    vx = 75,
    vy = 75,
    w = 32,
    h = 12,
    score = 100,
    itype = itype,
    get = false,
}

function pitem:new(x, y, itype)
    local it = {
        x = x,
        y = y,
        itype = itype
    }
    setmetatable(it, self)
    self.__index = self
    return pitem
end

function pitem:update(dt)
    self.y = self.y + dt * self.vy
end

function pitem:draw()
    if self.itype == 1 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    elseif self.itype == 2 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    elseif self.itype == 3 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    elseif self.itype == 4 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    elseif self.itype == 5 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    elseif self.itype == 6 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    elseif self.itype == 7 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    elseif self.itype == 8 then
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    else
        love.graphics.setColor(0.5, 0.5, 0.5)
        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    end
end

return pitem
