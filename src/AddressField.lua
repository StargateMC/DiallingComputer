local component = require("component")
local classes = require("src/classes")
local event = require("event")

local gpu = component.gpu

local AddressField = classes.class()

function AddressField:init(x, y, w, h, text, bg, fg, textBg)
  self.x = x
  self.y = y
  self.w = w
  self.h = h
  self.text = text
  self.bg = bg
  self.fg = fg
  self.textBg = textBg
  self.address = ""
  self.locked = false
end

function AddressField:draw()
  gpu.setBackground(self.bg)
  gpu.fill(self.x, self.y, self.w, self.h, " ")
  
  gpu.setBackground(self.textBg)
  gpu.fill(self.x + 1, self.y + 1, self.w - 2, self.h - 2, " ")
  
  gpu.setForeground(self.fg)
  gpu.set(self.x + self.w/2 - string.len(self.text)/2, self.y + self.h/2, self.text)
end

function AddressField:setLabel(text)
  self.text = text
  self:draw()
end

function AddressField:clicked(x, y)
  if not x or not y then
    return false
  end
  if self.locked then
    return false
  end
  if x >= self.x + 1 and x < (self.x + self.w - 2) and y >= self.y + 1 and y < (self.y + self.h - 2) then
    return true
  else
    return false
  end
end

function AddressField:clear()
   self.text = ""
   self:draw()
end

function AddressField:readInput()
  local typing = true
  local addrString = ""
  local address = ""
  
  while typing do
    self:setLabel(addrString .. "_")
    local _,_,key = event.pull("key_down")
    
    -- letters/numbers
    if key >= 48 and key <= 57 then
      addrString = addrString .. string.char(key)
      address = address .. string.char(key)
    elseif key >= 97 and key <= 122 then
      addrString = addrString .. string.char(key - 32)
      address = address .. string.char(key - 32)
    end
    
    -- separators
    if string.len(address) == 4 or string.len(address) == 7 then
      addrString = addrString .. "-"
    end
    
    -- backspace
    if key == 8 and string.len(address) > 0 then
      if string.len(address) == 4 or string.len(address) == 7 then
        addrString = addrString:sub(1, -4)
      else
        addrString = addrString:sub(1, -2)
      end
      address = address:sub(1, -2)
    end
    
    -- end
    if string.len(address) == 9 or key == 13 then
      self:setLabel(addrString:sub(1, -1))
      self.address = address
      typing = false
    end
  end
end

return AddressField