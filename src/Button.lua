local component = require("component")
local classes = require("src/classes")

local gpu = component.gpu

local Button = classes.class()

function Button:init(x, y, w, h, label, bg, fg)
  self.x = x
  self.y = y
  self.w = w
  self.h = h
  self.label = label
  self.bg = bg
  self.fg = fg
  self.locked = false
end

function Button:draw()
  if self.locked then
    gpu.setBackground(GREY)
    gpu.setForeground(GREY_LIGHT)
  else
    gpu.setBackground(self.bg)
    gpu.setForeground(self.fg)
  end
  
  gpu.fill(self.x, self.y, self.w, self.h, " ")
  gpu.set(self.x + self.w/2 - string.len(self.label)/2, self.y + self.h/2, self.label)
end

function Button:setLabel(label)
  self.label = label
  self:draw()
end

function Button:setBackground(bg)
  self.bg = bg
  self:draw()
end

function Button:setForeground(fg)
  self.fg = fg
  self:draw()
end

function Button:lock()
  self.locked = true;
  self:draw()
end

function Button:unlock()
  self.locked = false;
  self:draw()
end

function Button:clicked(x, y)
  if not x or not y then
    return false
  end
  if self.locked then
    return false
  end
  if x >= self.x and x < (self.x + self.w) and y >= self.y and y < (self.y + self.h) then
    return true
  else
    return false
  end
end

return Button
