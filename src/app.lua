local app = {}

local component = require("component")
local term = require("term")
local event = require("event")

function app.run()

-- colors
BACKGROUND =    0x000000  -- screen background
TEXT_WHITE =    0xFFFFFF  -- color of text
CYAN_LIGHT =    0x65D1D4  -- gate rings
SLATE_LIGHT =   0x569D95  -- gate controls
RED_DARK =      0x860007  -- chevrons
CYAN =          0x339D8F  -- GUI elements
GREY_DARK =     0x353535  -- gate cross
RED =           0xCC0001  -- status text
RED_BRIGHT =    0xFF0000  -- engaged chevrons
BLUE_LIGHT =    0x75BEC7  -- iris blade borders
BLUE_DARK =     0x2B586B  -- iris
BLUE =          0x2866A6  -- wormhole
GREY =          0x505050  -- disabled controls background
GREY_LIGHT =    0xA0A0A0  -- disabled controls foreground

local graphics = require("src/graphics")
local Button = require("src/Button")
local AddressField = require("src/AddressField")

local stargate = component.stargate

-- draw static graphics
graphics.draw()

-- create control elements

-- exit button
local w, h = component.gpu.getResolution()
local exitBtn = Button.new(w - 5, 1, 5, 1, "X", RED_DARK, TEXT_WHITE)
function updateExitBtn()
  exitBtn:setBackground(RED_DARK)
end
updateExitBtn()

-- iris button
local irisBtn = Button.new(4, 3, 34, 3, "IRIS", CYAN, TEXT_WHITE)
function updateIrisBtn()
  irisBtn:setBackground(CYAN)
  local irisState = stargate.irisState()
  if irisState == "Closed" then
    irisBtn:setLabel("OPEN IRIS")
    irisBtn:unlock()
  elseif irisState == "Open" then
    irisBtn:setLabel("CLOSE IRIS")
    irisBtn:unlock()
  elseif irisState == "Offline" then
    irisBtn:setLabel("IRIS OFFLINE")
    irisBtn:lock()
  end
end
updateIrisBtn()

-- terminate connection button
local terminateBtn = Button.new(4, 7, 34, 3, "TERMINATE CONNECTION", RED_DARK, TEXT_WHITE)
function updateTerminateBtn()
  terminateBtn:setBackground(RED_DARK)
  local gateState, _, direction = stargate.stargateState()
  if not ((gateState == "Connected" and direction == "Outgoing") or gateState == "Dialling") then
    terminateBtn:lock()
  else
    terminateBtn:unlock()
  end
end
updateTerminateBtn()

-- address field
local addressFld = AddressField.new(4, 11, 34, 5, "ENTER ADDRESS", CYAN, TEXT_WHITE, BACKGROUND)
addressFld:draw()

-- dial button
local dialBtn = Button.new(4, 17, 34, 3, "DIAL", CYAN, TEXT_WHITE)
function updateDialBtn()
  dialBtn:setBackground(CYAN)
  local gateState, _, _ = stargate.stargateState()
  if gateState ~= "Idle" then
    dialBtn:lock()
  else
    dialBtn:unlock()
  end
end
updateDialBtn()

-- main loop
local run = true
while run do
  -- update gate and iris state
  local gateState, engaged, direction = stargate.stargateState()
  local irisState = stargate.irisState()
 
  -- draw gate state message
  graphics.drawStateMsg(gateState, direction)
  
  -- update gate graphics according to the state
  if gateState == "Dialling" then
    -- gate is dialling, update chevrons
    local _, _, chevronNumber, chevronSymbol = event.pull("sgChevronEngaged")
    graphics.drawChevron(chevronNumber, chevronSymbol, RED_BRIGHT)
    
    if irisState == "Closed" then
      -- dialling with iris closed
      graphics.drawIris()
    else
      -- dialling with iris open/offline
      graphics.emptyGate()
    end
  
  elseif gateState == "Closing" then
    -- clear chevrons
    for i = 1, 9 do
      graphics.drawChevron(i, " ", BACKGROUND)
    end
    
  elseif gateState == "Connected" then
    if irisState == "Closed" then
      -- wormhole is connected, but iris is closed
      graphics.drawIris()
    else
      -- wormhole is connected, and iris is open/offline
      graphics.drawWormhole()
    end
  else
    if irisState == "Closed" then
      -- iris is closed
      graphics.drawIris()
    else
      -- nothing is happening, draw empty gate
      graphics.emptyGate()
    end
  end
  
  -- get clicks
  local _, _, x, y = event.pull(1, "touch")
  
  -- update control elements
  graphics.drawRemoteInfo(addressFld.address, stargate.energyToDial(addressFld.address))
  graphics.drawLocalGateInfo(stargate.localAddress(), stargate.energyAvailable(), irisState)
  
  -- exit button
  updateExitBtn()
  if exitBtn:clicked(x, y) then
    exitBtn:setBackground(RED_BRIGHT)
    run = false
  end
  
  -- iris button
  updateIrisBtn()
  if irisBtn:clicked(x, y) then
    irisBtn:setBackground(CYAN_LIGHT)
    if irisState == "Closed" then
      irisBtn:setLabel("CLOSE IRIS")
      stargate.openIris()
    else
      irisBtn:setLabel("OPEN IRIS")
      stargate.closeIris()
    end
  end
  
  -- terminate button
  updateTerminateBtn()
  if terminateBtn:clicked(x, y) then
    if (gateState == "Connected" and direction == "Outgoing") or gateState == "Dialling" then
      -- terminate connection
      terminateBtn:setBackground(RED_BRIGHT)
      stargate.disconnect()
      
      -- clear chevrons (closing state is skipped when terminating during dial)
      for i = 1, 9 do
        graphics.drawChevron(i, " ", BACKGROUND)
      end
    end
  end
  
  -- address field
  if addressFld:clicked(x, y) then
    addressFld:clear()
    addressFld:readInput()
  end
  
  -- dial button
  updateDialBtn()
  if dialBtn:clicked(x, y) then
    dialBtn:setBackground(CYAN_LIGHT)
    if string.len(addressFld.address) >= 7 then
      stargate.dial(addressFld.address)
    end
  end
  
end

-- reset colors
component.gpu.setBackground(0x000000)
component.gpu.setForeground(0xFFFFFF)

-- clear everything
term.clear();

end

return app
