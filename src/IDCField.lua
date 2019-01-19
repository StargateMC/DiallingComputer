local component = require("component")
local classes = require("src/classes")
local event = require("event")
local Button = require("src/Button")

local gpu = component.gpu

local IDCField = classes.class()

function IDCField:init(x, y, w, h, label, bg, fg, textBg, idcs)
  self.x = x
  self.y = y
  self.w = w
  self.h = h
  self.label = label
  self.bg = bg
  self.fg = fg
  self.textBg = textBg
  self.closeBtn = Button.new(x + w - 6, y, 5, 1, "X", RED, TEXT_WHITE)
  self.idcs = idcs
end

function IDCField:draw()
  gpu.setBackground(self.bg)
  gpu.fill(self.x, self.y, self.w, self.h, " ")
  gpu.setForeground(self.fg)
  gpu.set(self.x + self.w/2 - string.len(self.label)/2, self.y + 1, self.label)
  gpu.setBackground(self.textBg)
  gpu.fill(self.x + 1, self.y + 3, self.w - 2, self.h - 4, " ")
  self.closeBtn:draw()
end

function IDCField:hide()
  gpu.setBackground(BACKGROUND)
  gpu.fill(self.x, self.y, self.w, self.h, " ")
end

function IDCField:readInput()
  local entries = self:showIdcList()
  local editing = true
  while editing do
    local _, _, x, y = event.pull(1, "touch")
    
    -- check click position
    if x ~= nil and y ~= nil and x >= self.x + 1 and x < (self.x + self.w - 2) and y >= self.y + 4 and y < (self.y + self.h - 2) then
      local entryNum
      if y >= self.y + 4 + entries then
        -- new entry
        gpu.fill(self.x + 2, self.y + 4 + entries, self.w - 4, 2, " ")
        entryNum = entries
      else
        -- edit entry
        entryNum = y - self.y - 4
      end
      
      local newEntry = self:readLine(entryNum)
      if string.len(newEntry) == 36 or string.len(newEntry) == 0 then
        self.idcs[entryNum + 1] = newEntry
      end
      entries = self:showIdcList()
    end

    if self.closeBtn:clicked(x, y) then
      self.closeBtn:setBackground(RED_BRIGHT)
      editing = false
    end
  end
end

function IDCField:readLine(lineNum)
  local text = ""
  local typing = true
  gpu.setForeground(TEXT_WHITE)
  while typing do
    gpu.fill(self.x + 2, self.y + 4 + lineNum, self.w - 4, 1, " ")
    gpu.set(self.x + 2, self.y + 4 + lineNum, text .. "_")
    local _,_,key = event.pull("key_down")
    
    if string.len(text) == 36 or key == 13 then
      typing = false
    elseif key == 8 and string.len(text) > 0 then
      text = text:sub(1, -2)
    elseif key ~= nil and ((key >= 48 and key <= 57) or (key >= 97 and key <= 122) or key == 45) then
      text = text .. string.char(key)
    end
    
    -- separators
    if string.len(text) == 8 or string.len(text) == 13 or string.len(text) == 18 or string.len(text) == 23 then
      text = text .. "-"
    end
  end
  
  gpu.set(self.x + 2, self.y + 4 + lineNum, text .. " ")
  return text
end

function IDCField:showIdcList()
  local entries = 0
  gpu.setBackground(self.textBg)
  
  for k, v in pairs(self.idcs) do
    if k ~= "n" then
      gpu.set(61 + 2, 14 + entries + 4, v)
      entries = entries + 1
    end
  end
  
  gpu.setForeground(GREY_LIGHT)
  gpu.set(61 + 2, 14 + entries + 4, "> Click here to add new entry or")
  gpu.set(61 + 2, 14 + entries + 5, "  click existing entry to edit it")
  
  return entries
end

return IDCField
