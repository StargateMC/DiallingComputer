local graphics = {}

local component = require("component")

local gpu = component.gpu
local w, h = gpu.getResolution()

function graphics.draw()
  gpu.setBackground(BACKGROUND)
  gpu.fill(1, 1, w, h, " ")
  graphics.drawBorders()
  graphics.drawGate()
  graphics.drawGateControls()
  graphics.drawStatusWindow()
  graphics.drawRemoteInfo()
  graphics.drawLocalGateInfo()
end

function graphics.drawBorders()
  gpu.setBackground(CYAN)
  gpu.fill(1, 1, w, 1, " ")
  gpu.fill(1, 1, 1, h-2, " ")
  gpu.fill(1, h, w, h, " ")
  gpu.fill(w, 3, w-1, h, " ")
end

function graphics.drawGate()
  --outer ring
  gpu.setBackground(CYAN_LIGHT)
  gpu.fill(74, 8, 14, 1, " ")
  gpu.fill(88, 9, 6, 1, " ")
  gpu.fill(94, 10, 4, 1, " ")
  gpu.fill(98, 11, 2, 1, " ")
  gpu.fill(100, 12, 2, 1, " ")
  gpu.fill(102, 13, 2, 1, " ")
  gpu.fill(104, 14, 2, 1, " ")
  gpu.fill(106, 15, 2, 2, " ")
  gpu.fill(108, 17, 2, 3, " ")
  
  gpu.fill(110, 20, 2, 7, " ")
  gpu.fill(108, 27, 2, 3, " ")
  gpu.fill(106, 30, 2, 2, " ")
  gpu.fill(104, 32, 2, 1, " ")
  gpu.fill(102, 33, 2, 1, " ")
  gpu.fill(100, 34, 2, 1, " ")
  gpu.fill(98, 35, 2, 1, " ")
  gpu.fill(94, 36, 4, 1, " ")
  gpu.fill(88, 37, 6, 1, " ")

  gpu.fill(74, 38, 14, 1, " ")
  gpu.fill(68, 37, 6, 1, " ")
  gpu.fill(64, 36, 4, 1, " ")
  gpu.fill(62, 35, 2, 1, " ")
  gpu.fill(60, 34, 2, 1, " ")
  gpu.fill(58, 33, 2, 1, " ")
  gpu.fill(56, 32, 2, 1, " ")
  gpu.fill(54, 30, 2, 2, " ")
  gpu.fill(52, 27, 2, 3, " ")

  gpu.fill(50, 20, 2, 7, " ")
  gpu.fill(52, 17, 2, 3, " ")
  gpu.fill(54, 15, 2, 2, " ")
  gpu.fill(56, 14, 2, 1, " ")
  gpu.fill(58, 13, 2, 1, " ")
  gpu.fill(60, 12, 2, 1, " ")
  gpu.fill(62, 11, 2, 1, " ")
  gpu.fill(64, 10, 4, 1, " ")
  gpu.fill(68, 9, 6, 1, " ")
  
  --inner ring
  gpu.fill(74, 11, 14, 1, " ")
  gpu.fill(88, 12, 4, 1, " ")
  gpu.fill(92, 13, 4, 1, " ")
  gpu.fill(96, 14, 2, 1, " ")
  gpu.fill(98, 15, 2, 1, " ")
  gpu.fill(100, 16, 2, 2, " ")
  gpu.fill(102, 18, 2, 2, " ")

  gpu.fill(104, 20, 2, 7, " ")
  gpu.fill(102, 27, 2, 2, " ")
  gpu.fill(100, 29, 2, 2, " ")
  gpu.fill(98, 31, 2, 1, " ")
  gpu.fill(96, 32, 2, 1, " ")
  gpu.fill(92, 33, 4, 1, " ")
  gpu.fill(88, 34, 4, 1, " ")

  gpu.fill(74, 35, 14, 1, " ")
  gpu.fill(70, 34, 4, 1, " ")
  gpu.fill(66, 33, 4, 1, " ")
  gpu.fill(64, 32, 2, 1, " ")
  gpu.fill(62, 31, 2, 1, " ")
  gpu.fill(60, 29, 2, 2, " ")
  gpu.fill(58, 27, 2, 2, " ")

  gpu.fill(56, 20, 2, 7, " ")
  gpu.fill(58, 18, 2, 2, " ")
  gpu.fill(60, 16, 2, 2, " ")
  gpu.fill(62, 15, 2, 1, " ")
  gpu.fill(64, 14, 2, 1, " ")
  gpu.fill(66, 13, 4, 1, " ")
  gpu.fill(70, 12, 4, 1, " ")
  
  --middle ring
  gpu.setBackground(SLATE_LIGHT)
  gpu.fill(84, 9, 2, 2, " ")
  gpu.fill(88, 10, 2, 2, " ")
  gpu.fill(92, 11, 2, 2, " ")
  gpu.fill(96, 12, 2, 1, " ")
  gpu.fill(98, 14, 2, 1, " ")
  gpu.fill(102, 15, 2, 1, " ")
  gpu.fill(102, 17, 4, 1, " ")
  gpu.fill(104, 19, 4, 1, " ")
  gpu.fill(106, 21, 4, 1, " ")
  
  gpu.fill(106, 25, 4, 1, " ")
  gpu.fill(104, 27, 4, 1, " ")
  gpu.fill(102, 29, 4, 1, " ")
  gpu.fill(102, 31, 2, 1, " ")
  gpu.fill(98, 32, 2, 1, " ")
  gpu.fill(100, 33, 2, 1, " ")
  gpu.fill(96, 34, 2, 1, " ")
  gpu.fill(92, 34, 2, 2, " ")
  gpu.fill(88, 35, 2, 2, " ")
  gpu.fill(84, 36, 2, 2, " ")

  gpu.fill(80, 36, 2, 2, " ")
  gpu.fill(76, 36, 2, 2, " ")
  gpu.fill(72, 35, 2, 2, " ")
  gpu.fill(68, 34, 2, 2, " ")
  gpu.fill(64, 34, 2, 1, " ")
  gpu.fill(62, 32, 2, 1, " ")
  gpu.fill(60, 33, 2, 1, " ")
  gpu.fill(58, 31, 2, 1, " ")
  gpu.fill(56, 29, 4, 1, " ")
  gpu.fill(54, 27, 4, 1, " ")
  gpu.fill(52, 25, 4, 1, " ")

  gpu.fill(52, 21, 4, 1, " ")
  gpu.fill(54, 19, 4, 1, " ")
  gpu.fill(56, 17, 4, 1, " ")
  gpu.fill(58, 15, 2, 1, " ")
  gpu.fill(62, 14, 2, 1, " ")
  gpu.fill(64, 12, 2, 1, " ")
  gpu.fill(68, 11, 2, 2, " ")
  gpu.fill(72, 10, 2, 2, " ")
  gpu.fill(76, 9, 2, 2, " ")
  
  --chevrons
  gpu.setBackground(RED_DARK)

  gpu.fill(78, 8, 6, 1, " ")
  gpu.fill(79, 9, 1, 1, " ")
  gpu.fill(82, 9, 1, 1, " ")
  gpu.fill(80, 10, 2, 1, " ")
  
  gpu.fill(100, 12, 2, 1, " ")
  gpu.fill(102, 13, 2, 1, " ")
  gpu.fill(98, 13, 2, 2, " ")
  gpu.fill(100, 14, 2, 1, " ")
  
  gpu.fill(106, 23, 2, 1, " ")
  gpu.fill(108, 22, 2, 1, " ")
  gpu.fill(108, 24, 2, 1, " ")
  gpu.fill(110, 22, 2, 3, " ")

  gpu.fill(102, 30, 4, 1, " ")
  gpu.fill(102, 31, 2, 1, " ")
  gpu.fill(106, 31, 2, 1, " ")
  gpu.fill(104, 32, 2, 1, " ")

  gpu.fill(90, 35, 2, 1, " ")
  gpu.fill(89, 36, 1, 1, " ")
  gpu.fill(92, 36, 1, 1, " ")
  gpu.fill(88, 37, 6, 1, " ")
  
  gpu.fill(70, 35, 2, 1, " ")
  gpu.fill(69, 36, 1, 1, " ")
  gpu.fill(72, 36, 1, 1, " ")
  gpu.fill(68, 37, 6, 1, " ")

  gpu.fill(56, 30, 4, 1, " ")
  gpu.fill(54, 31, 2, 1, " ")
  gpu.fill(58, 31, 2, 1, " ")
  gpu.fill(56, 32, 2, 1, " ")

  gpu.fill(50, 22, 4, 1, " ")
  gpu.fill(50, 23, 2, 1, " ")
  gpu.fill(54, 23, 2, 1, " ")
  gpu.fill(50, 24, 4, 1, " ")
  
  gpu.fill(60, 12, 2, 1, " ")
  gpu.fill(58, 13, 2, 1, " ")
  gpu.fill(62, 13, 2, 1, " ")
  gpu.fill(60, 14, 4, 1, " ")
end

function graphics.drawGateControls()
  --chevron lines
  gpu.setBackground(SLATE_LIGHT)

  gpu.fill(102, 12, 18, 1, " ")
  gpu.fill(119, 11, 1, 1, " ")
  gpu.fill(119, 10, 17, 1, " ")

  gpu.fill(112, 23, 10, 1, " ")
  gpu.fill(121, 17, 1, 6, " ")
  gpu.fill(121, 16, 18, 1, " ")
  
  gpu.fill(106, 32, 17, 1, " ")
  gpu.fill(123, 23, 1, 10, " ")
  gpu.fill(123, 22, 19, 1, " ")
  
  gpu.fill(144, 46, 3, 1, " ")
  gpu.fill(146, 6, 1, 40, " ")
  gpu.fill(80, 6, 67, 1, " ")
  gpu.fill(80, 6, 2, 2, " ")
  
  gpu.fill(144, 40, 5, 1, " ")
  gpu.fill(148, 5, 1, 35, " ")
  gpu.fill(54, 5, 95, 1, " ")
  gpu.fill(54, 5, 1, 8, " ")
  gpu.fill(54, 12, 6, 1, " ")
  
  gpu.fill(144, 34, 7, 1, " ")
  gpu.fill(150, 4, 1, 30, " ")
  gpu.fill(44, 23, 6, 1, " ")
  gpu.fill(44, 4, 1, 20, " ")
  gpu.fill(44, 4, 107, 1, " ")
  
  gpu.fill(144, 28, 9, 1, " ")
  gpu.fill(152, 3, 1, 25, " ")
  gpu.fill(40, 32, 16, 1, " ")
  gpu.fill(40, 3, 1, 29, " ")
  gpu.fill(40, 3, 112, 1, " ")
  
  --address windows
  gpu.setBackground(SLATE_LIGHT)
  gpu.setForeground(TEXT_WHITE)
  gpu.fill(130, 8, 14, 5, " ")
  gpu.fill(130, 14, 14, 5, " ")
  gpu.fill(130, 20, 14, 5, " ")
  gpu.fill(130, 26, 14, 5, " ")
  gpu.fill(130, 32, 14, 5, " ")
  gpu.fill(130, 38, 14, 5, " ")
  gpu.fill(130, 44, 14, 5, " ")

  gpu.setBackground(BACKGROUND)
  gpu.fill(131, 9, 12, 3, " ")
  gpu.fill(131, 15, 12, 3, " ")
  gpu.fill(131, 21, 12, 3, " ")
  gpu.fill(131, 27, 12, 3, " ")
  gpu.fill(131, 33, 12, 3, " ")
  gpu.fill(131, 39, 12, 3, " ")
  gpu.fill(131, 45, 12, 3, " ")
  
  gpu.set(129, 11, "1")
  gpu.set(129, 17, "2")
  gpu.set(129, 23, "3")
  gpu.set(129, 29, "4")
  gpu.set(129, 35, "5")
  gpu.set(129, 41, "6")
  gpu.set(129, 47, "7")
end

function graphics.fillGate(color)
  gpu.setBackground(color)
  gpu.fill(74, 12, 14, 1, " ")
  gpu.fill(70, 13, 22, 1, " ")
  gpu.fill(66, 14, 30, 1, " ")
  gpu.fill(64, 15, 34, 1, " ")
  gpu.fill(62, 16, 38, 2, " ")
  gpu.fill(60, 18, 42, 2, " ")
  gpu.fill(58, 20, 46, 7, " ")
  gpu.fill(60, 27, 42, 2, " ")
  gpu.fill(62, 29, 38, 2, " ")
  gpu.fill(64, 31, 34, 1, " ")
  gpu.fill(66, 32, 30, 1, " ")
  gpu.fill(70, 33, 22, 1, " ")
  gpu.fill(74, 34, 14, 1, " ")
  
  if color == BACKGROUND then
    -- cross in the middle of gate graphic
    gpu.setBackground(GREY_DARK)
    gpu.fill(80, 22, 2, 3, " ")
    gpu.fill(78, 23, 6, 1, " ")
  end
end

function graphics.drawIris()
  graphics.fillGate(BLUE_DARK)
  gpu.setBackground(BLUE_LIGHT)
  gpu.fill(80, 12, 2, 23, " ")
  gpu.fill(58, 23, 46, 1, " ")
  
  gpu.fill(82, 21, 2, 1, " ")
  gpu.fill(84, 20, 2, 1, " ")
  gpu.fill(86, 18, 2, 2, " ")
  gpu.fill(88, 16, 2, 2, " ")
  gpu.fill(90, 14, 2, 2, " ")
  
  gpu.fill(84, 22, 2, 1, " ")
  gpu.fill(86, 21, 2, 1, " ")
  gpu.fill(88, 20, 4, 1, " ")
  gpu.fill(92, 19, 4, 1, " ")
  gpu.fill(96, 18, 4, 1, " ")
  
  gpu.fill(84, 24, 2, 1, " ")
  gpu.fill(86, 25, 2, 1, " ")
  gpu.fill(88, 26, 4, 1, " ")
  gpu.fill(92, 27, 4, 1, " ")
  gpu.fill(96, 28, 4, 1, " ")
  
  gpu.fill(82, 25, 2, 1, " ")
  gpu.fill(84, 26, 2, 1, " ")
  gpu.fill(86, 27, 2, 2, " ")
  gpu.fill(88, 29, 2, 2, " ")
  gpu.fill(90, 31, 2, 2, " ")

  gpu.fill(78, 25, 2, 1, " ")
  gpu.fill(76, 26, 2, 1, " ")
  gpu.fill(74, 27, 2, 2, " ")
  gpu.fill(72, 29, 2, 2, " ")
  gpu.fill(70, 31, 2, 2, " ")
  
  gpu.fill(76, 24, 2, 1, " ")
  gpu.fill(74, 25, 2, 1, " ")
  gpu.fill(70, 26, 4, 1, " ")
  gpu.fill(66, 27, 4, 1, " ")
  gpu.fill(62, 28, 4, 1, " ")

  gpu.fill(76, 22, 2, 1, " ")
  gpu.fill(74, 21, 2, 1, " ")
  gpu.fill(70, 20, 4, 1, " ")
  gpu.fill(66, 19, 4, 1, " ")
  gpu.fill(62, 18, 4, 1, " ")

  gpu.fill(78, 21, 2, 1, " ")
  gpu.fill(76, 20, 2, 1, " ")
  gpu.fill(74, 18, 2, 2, " ")
  gpu.fill(72, 16, 2, 2, " ")
  gpu.fill(70, 14, 2, 2, " ")
end

function graphics.drawChevron(chevronNumber, chevronSymbol, engagedColor)
  gpu.setBackground(engagedColor)
  gpu.setForeground(TEXT_WHITE)
  if chevronNumber == 1 then
    gpu.fill(100, 13, 2, 1, " ")
    gpu.setBackground(BACKGROUND)
    gpu.set(136, 10, chevronSymbol)
  elseif chevronNumber == 2 then
    gpu.fill(108, 23, 2, 1, " ")
    gpu.setBackground(BACKGROUND)
    gpu.set(136, 16, chevronSymbol)
  elseif chevronNumber == 3 then
    gpu.fill(104, 31, 2, 1, " ")
    gpu.setBackground(BACKGROUND)
    gpu.set(136, 22, chevronSymbol)
  elseif chevronNumber == 4 then
    gpu.fill(56, 31, 2, 1, " ")
    gpu.setBackground(BACKGROUND)
    gpu.set(136, 28, chevronSymbol)
  elseif chevronNumber == 5 then
    gpu.fill(52, 23, 2, 1, " ")
    gpu.setBackground(BACKGROUND)
    gpu.set(136, 34, chevronSymbol)
  elseif chevronNumber == 6 then
    gpu.fill(60, 13, 2, 1, " ")
    gpu.setBackground(BACKGROUND)
    gpu.set(136, 40, chevronSymbol)
  elseif chevronNumber == 7 then
    gpu.fill(80, 9, 2, 1, " ")
    gpu.setBackground(BACKGROUND)
    gpu.set(136, 46, chevronSymbol)
  elseif chevronNumber == 8 then
    gpu.fill(90, 36, 2, 1, " ")
    gpu.setBackground(BACKGROUND)
    gpu.set(136, 52, chevronSymbol)
  elseif chevronNumber == 9 then
    gpu.fill(70, 36, 2, 1, " ")
    gpu.setBackground(BACKGROUND)
    gpu.set(136, 58, chevronSymbol)
  end
end

function graphics.drawWormhole()
  graphics.fillGate(BLUE)
end

function graphics.emptyGate()
  graphics.fillGate(BACKGROUND)
end

function graphics.drawStatusWindow()
  gpu.setBackground(CYAN)
  gpu.fill(40, 40, 80, 9, " ")
  gpu.setBackground(BACKGROUND)
  gpu.fill(40, 42, 80, 5, " ")
  gpu.fill(41, 41, 78, 1, " ")
  gpu.fill(41, 47, 78, 1, " ")
end

function graphics.drawStateMsg(state, direction)
  -- clear previous message
  gpu.setBackground(BACKGROUND)
  gpu.fill(40, 42, 80, 5, " ")
  gpu.fill(41, 41, 78, 1, " ")
  gpu.fill(41, 47, 78, 1, " ")
  
  -- write message
  gpu.setBackground(RED)
  if state == "Offline" then
    graphics.drawO(10)
    graphics.drawF(10+8)
    graphics.drawF(10+16)
    graphics.drawL(10+24)
    graphics.drawI(10+32)
    graphics.drawN(10+40)
    graphics.drawE(10+48)
  elseif state == "Idle" then
    graphics.drawI(23)
    graphics.drawD(23+8)
    graphics.drawL(23+16)
    graphics.drawE(23+24)
  elseif state == "Dialling" then
    graphics.drawD(5)
    graphics.drawI(5+8)
    graphics.drawA(5+16)
    graphics.drawL(5+24)
    graphics.drawL(5+32)
    graphics.drawI(5+40)
    graphics.drawN(5+48)
    graphics.drawG(5+56)
  elseif state == "Opening" then
    graphics.drawO(10)
    graphics.drawP(10+8)
    graphics.drawE(10+16)
    graphics.drawN(10+24)
    graphics.drawI(10+32)
    graphics.drawN(10+40)
    graphics.drawG(10+48)
  elseif state == "Connected" and direction == "Incoming" then
    graphics.drawI(4)
    graphics.drawN(4+8)
    graphics.drawC(4+16)
    graphics.drawO(4+24)
    graphics.drawM(4+32+1)
    graphics.drawI(4+40+2)
    graphics.drawN(4+48+2)
    graphics.drawG(4+56+2)
  elseif state == "Connected" and direction == "Outgoing" then
    graphics.drawC(2)
    graphics.drawO(2+8)
    graphics.drawN(2+16)
    graphics.drawN(2+24)
    graphics.drawE(2+32)
    graphics.drawC(2+40)
    graphics.drawT(2+48)
    graphics.drawE(2+56)
    graphics.drawD(2+64)
  elseif state == "Closing" then
    graphics.drawC(10)
    graphics.drawL(10+8)
    graphics.drawO(10+16)
    graphics.drawS(10+24)
    graphics.drawI(10+32)
    graphics.drawN(10+40)
    graphics.drawG(10+48)
  end
end

function graphics.drawRemoteInfo(address, energy)
  gpu.setBackground(CYAN)
  gpu.fill(4, 21, 34, 9, " ")
  gpu.setBackground(BACKGROUND)
  gpu.fill(5, 24, 32, 5, " ")
  gpu.setBackground(CYAN)
  gpu.setForeground(TEXT_WHITE)
  gpu.set(4 + 17 - string.len("REMOTE GATE DATA")/2, 22, "REMOTE GATE DATA")
  gpu.setBackground(BACKGROUND)
  if address == nil or string.len(address) < 7 then
    gpu.set(6, 25, "ADDRESS: INVALID")
  else
    gpu.set(6, 25, "ADDRESS: " .. address)
  end
  
  if energy == nil then
    gpu.set(6, 27, "ENERGY TO DIAL: N/A")
  else
    gpu.set(6, 27, "ENERGY TO DIAL: " .. math.floor(energy + 0.5))
  end
  
end

function graphics.drawLocalGateInfo(address, energy, iris)
  gpu.setBackground(CYAN)
  gpu.fill(4, 31, 34, 11, " ")
  gpu.setBackground(BACKGROUND)
  gpu.fill(5, 34, 32, 7, " ")
  gpu.setBackground(CYAN)
  gpu.setForeground(TEXT_WHITE)
  gpu.set(4 + 17 - string.len("LOCAL GATE DATA")/2, 32, "LOCAL GATE DATA")
  gpu.setBackground(BACKGROUND)
  
  if address == nil then
    gpu.set(6, 35, "ADDRESS: UNKNOWN")
  else
    gpu.set(6, 35, "ADDRESS: " .. address)
  end
  
  if energy == nil then
    gpu.set(6, 37, "AVAILABLE ENERGY: N/A")
  else
    gpu.set(6, 37, "AVAILABLE ENERGY: " .. math.floor(energy + 0.5))
  end
  
  if iris == nil then
    gpu.set(6, 39, "IRIS STATE: UNKNOWN")
  else
    gpu.set(6, 39, "IRIS STATE: " .. iris)
  end
end

function graphics.drawA(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 44, 6, 1, " ")
  gpu.fill(47+offset, 42, 2, 5, " ")
end

function graphics.drawC(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 46, 6, 1, " ")
end

function graphics.drawD(offset)
  gpu.fill(43+offset, 42, 4, 1, " ")
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 46, 4, 1, " ")
  gpu.fill(47+offset, 43, 2, 3, " ")
end

function graphics.drawE(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 44, 4, 1, " ")
  gpu.fill(43+offset, 46, 6, 1, " ")
end

function graphics.drawF(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 44, 4, 1, " ")
end

function graphics.drawG(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 46, 6, 1, " ")
  gpu.fill(47+offset, 42, 2, 2, " ")
  gpu.fill(46+offset, 45, 3, 2, " ")
end

function graphics.drawI(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(45+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 46, 6, 1, " ")
end

function graphics.drawL(offset)
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 46, 6, 1, " ")
end

function graphics.drawM(offset)
  gpu.fill(43+offset, 42, 2, 1, " ")
  gpu.fill(42+offset, 42, 2, 5, " ")
  gpu.fill(47+offset, 42, 2, 1, " ")
  gpu.fill(48+offset, 42, 2, 5, " ")
  gpu.fill(45+offset, 43, 2, 1, " ")
end

function graphics.drawN(offset)
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(47+offset, 42, 2, 5, " ")
  gpu.fill(45+offset, 43, 1, 1, " ")
  gpu.fill(45+offset, 44, 2, 1, " ")
  gpu.fill(46+offset, 45, 1, 1, " ")
end

function graphics.drawO(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 46, 6, 1, " ")
  gpu.fill(47+offset, 42, 2, 5, " ")
end

function graphics.drawP(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 44, 6, 1, " ")
  gpu.fill(47+offset, 42, 2, 3, " ")
end

function graphics.drawS(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(43+offset, 42, 2, 3, " ")
  gpu.fill(43+offset, 44, 6, 1, " ")
  gpu.fill(47+offset, 44, 2, 3, " ")
  gpu.fill(43+offset, 46, 6, 1, " ")
end

function graphics.drawT(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(45+offset, 42, 2, 5, " ")
end

return graphics
