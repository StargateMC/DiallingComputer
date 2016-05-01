local component = require("component")
local sg = component.stargate
local gpu = component.gpu
local keyboard = require("keyboard")
local w, h = gpu.getResolution()
local term = require("term")
local event = require("event")
local filesystem = require("filesystem")

local running = true
local iris = false

--address tables
characters = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}
numbers = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}

--Drawing functions
function drawA(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 44, 6, 1, " ")
  gpu.fill(47+offset, 42, 2, 5, " ")
end

function drawC(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 46, 6, 1, " ")
end

function drawD(offset)
  gpu.fill(43+offset, 42, 4, 1, " ")
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 46, 4, 1, " ")
  gpu.fill(47+offset, 43, 2, 3, " ")
end

function drawE(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 44, 4, 1, " ")
  gpu.fill(43+offset, 46, 6, 1, " ")
end

function drawF(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 44, 4, 1, " ")
end

function drawG(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 46, 6, 1, " ")
  gpu.fill(47+offset, 42, 2, 2, " ")
  gpu.fill(46+offset, 45, 3, 2, " ")
end

function drawI(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(45+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 46, 6, 1, " ")
end

function drawL(offset)
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 46, 6, 1, " ")
end

function drawM(offset)
  gpu.fill(43+offset, 42, 2, 1, " ")
  gpu.fill(43+offset, 42, 1, 5, " ")
  gpu.fill(47+offset, 42, 2, 1, " ")
  gpu.fill(48+offset, 42, 1, 5, " ")
  gpu.fill(45+offset, 43, 2, 1, " ")
end

function drawN(offset)
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(47+offset, 42, 2, 5, " ")
  gpu.fill(45+offset, 43, 1, 1, " ")
  gpu.fill(45+offset, 44, 2, 1, " ")
  gpu.fill(46+offset, 45, 1, 1, " ")
end

function drawO(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 46, 6, 1, " ")
  gpu.fill(47+offset, 42, 2, 5, " ")
end

function drawP(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(43+offset, 42, 2, 5, " ")
  gpu.fill(43+offset, 44, 6, 1, " ")
  gpu.fill(47+offset, 42, 2, 3, " ")
end

function drawS(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(43+offset, 42, 2, 3, " ")
  gpu.fill(43+offset, 44, 6, 1, " ")
  gpu.fill(47+offset, 44, 2, 3, " ")
  gpu.fill(43+offset, 46, 6, 1, " ")
end

function drawT(offset)
  gpu.fill(43+offset, 42, 6, 1, " ")
  gpu.fill(45+offset, 42, 2, 5, " ")
end

function drawGate()
--outer ring
  gpu.setBackground(0x65D1D4)
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
  gpu.setBackground(0x569D95)
  --gpu.fill(80, 9, 2, 2, " ")
  gpu.fill(84, 9, 2, 2, " ")
  gpu.fill(88, 10, 2, 2, " ")
  gpu.fill(92, 11, 2, 2, " ")
  gpu.fill(96, 12, 2, 1, " ")
  --gpu.fill(100, 13, 2, 1, " ")
  gpu.fill(98, 14, 2, 1, " ")
  gpu.fill(102, 15, 2, 1, " ")
  gpu.fill(102, 17, 4, 1, " ")
  gpu.fill(104, 19, 4, 1, " ")
  gpu.fill(106, 21, 4, 1, " ")
  
  --gpu.fill(106, 23, 4, 1, " ")
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

  --gpu.fill(52, 23, 4, 1, " ")
  gpu.fill(52, 21, 4, 1, " ")
  gpu.fill(54, 19, 4, 1, " ")
  gpu.fill(56, 17, 4, 1, " ")
  gpu.fill(58, 15, 2, 1, " ")
  --gpu.fill(60, 13, 2, 1, " ")
  gpu.fill(62, 14, 2, 1, " ")
  gpu.fill(64, 12, 2, 1, " ")
  gpu.fill(68, 11, 2, 2, " ")
  gpu.fill(72, 10, 2, 2, " ")
  gpu.fill(76, 9, 2, 2, " ")
  
  --chevrons
  gpu.setBackground(0x860007)

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

local color
function drawWormhole(color)
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
  
  if color == 0x000000 then
    gpu.setBackground(0x353535)
    gpu.fill(80, 22, 2, 3, " ")
    gpu.fill(78, 23, 6, 1, " ")
  end
end

function drawIris()
  drawWormhole(0x2B586B)
  gpu.setBackground(0x75BEC7)
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

local colorControls
function drawGateControls(colorControls)
  --chevron lines
  gpu.setBackground(colorControls)

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
  gpu.setBackground(colorControls)
  gpu.setForeground(0xFFFFFF)
  gpu.fill(130, 8, 14, 5, " ")
  gpu.fill(130, 14, 14, 5, " ")
  gpu.fill(130, 20, 14, 5, " ")
  gpu.fill(130, 26, 14, 5, " ")
  gpu.fill(130, 32, 14, 5, " ")
  gpu.fill(130, 38, 14, 5, " ")
  gpu.fill(130, 44, 14, 5, " ")

  gpu.setBackground(0x000000)
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

function drawButtons()
  --iris
  gpu.setBackground(0x339D8F)
  gpu.setForeground(0x444444)
  gpu.fill(4, 3, 8, 3, " ")
  gpu.fill(12, 3, 20, 3, " ")
  gpu.setBackground(0x000000)
  gpu.fill(5, 4, 6, 1, " ")
  gpu.fill(13, 4, 18, 1, " ")
  gpu.set(6, 4, "IRIS")
  
  --dialling
  gpu.setBackground(0x339D8F)
  gpu.fill(4, 7, 28, 5, " ")
  gpu.setBackground(0x000000)
  gpu.setForeground(0xFFFFFF)
  gpu.fill(5, 8, 26, 1, " ")
  gpu.fill(5, 10, 26, 1, " ")
  gpu.set(11, 8, "DIAL DIRECTLY")
  --terminating
  gpu.setBackground(0xCC0000)
  gpu.fill(4, 13, 28, 3, " ")
  gpu.setBackground(0x000000)
  gpu.setForeground(0x444444)
  gpu.fill(5, 14, 26, 1, " ")
  gpu.set(8, 14, "TERMINATE CONNECTION")
  --energy
  gpu.setBackground(0x339D8F)
  gpu.fill(4, 17, 28, 9, " ")
  gpu.setBackground(0x000000)
  gpu.setForeground(0xFFFFFF)
  gpu.fill(5, 18, 26, 1, " ")
  gpu.fill(5, 20, 26, 1, " ")
  gpu.fill(5, 22, 26, 3, " ")
  gpu.set(8, 18, "ENERGY AVAILABLE:")
  --address book
  gpu.setBackground(0x339D8F)
  gpu.fill(4, 27, 28, 3, " ")
  gpu.setBackground(0x000000)
  gpu.setForeground(0xFFFFFF)
  gpu.fill(5, 28, 26, 1, " ")
  gpu.set(11, 28, "ADDRESS BOOK")
  --settings
  gpu.setBackground(0x339D8F)
  gpu.fill(4, 31, 28, 3, " ")
  gpu.setBackground(0x000000)
  gpu.setForeground(0x444444)
  gpu.fill(5, 32, 26, 1, " ")
  gpu.set(13, 32, "SETTINGS")
  --msg window
  gpu.setBackground(0x339D8F)
  gpu.fill(4, 35, 28, 14, " ")
  gpu.setBackground(0x000000)
  gpu.fill(5, 36, 26, 12, " ")
end

function drawBorders()
  gpu.setBackground(0x339D8F)
  gpu.fill(1, 1, w, 1, " ")
  gpu.fill(1, 1, 1, h-2, " ")
  gpu.fill(1, h, w, h, " ")
  gpu.fill(w, 3, w-1, h, " ")
end

function drawAddressBookBorders()
  gpu.setBackground(0x339D8F)
  gpu.fill(1, 1, w, 1, " ")
  gpu.fill(1, 1, 1, h-2, " ")
  gpu.fill(1, h, w, h, " ")
  gpu.fill(w, 3, w-1, h, " ")
  
  gpu.setBackground(0xCC0000)
  gpu.setForeground(0xFFFFFF)
  gpu.fill(w-5, 1, 5, 1, " ")
  gpu.set(w-3, 1, "X")
end

function resetGUI()
  gpu.setBackground(0x000000)
  gpu.fill(1, 1, w, h, " ")
  drawGate()
  drawGateControls(0x569D95)
  drawButtons()
  drawBorders()
  
  --state window
  gpu.setBackground(0x339D8F)
  gpu.fill(40, 40, 80, 9, " ")
  gpu.setBackground(0x000000)
  gpu.fill(40, 42, 80, 5, " ")
  gpu.fill(41, 41, 78, 1, " ")
  gpu.fill(41, 47, 78, 1, " ")
end
--[[
function textField(x, y, lenx, leny)
   local typing = true
   local type = true
   local character
   local text = ""
   local index = 0
   while typing and index<=(lenx-1) do
      gpu.set(x+index+1, y, "_")
    local _,_,key,p1 = event.pull("key_down")
    local char = keyboard.keys[p1]
      index = index + 1
  if (index==lenx) or (key==13) then
      gpu.set(x+index, y, " ")
      type = false
    typing = false
      gpu.set(x+index+1, y, " ")
      for i=1,index-1 do
        character = gpu.get(x+i, y)
        text = text..character
      end
    end
    if (key == 8) and (index > 1) then --backspace
      index = index - 1
      --text = string.sub(text, 1, index+1)
      gpu.set(x+index+1, y, " ")
      gpu.set(x+index, y, "_")
      index=index-1
    elseif (index >= 1) and (key ~= 13) then
      if char == "lshift" or char == "rshift" or char == "back" or char == "enter" then
      index=index-1
    else
      if keyboard.isShiftDown() then
          character = string.upper(char)
        else
      character = char
    end
    if char == "space" then
      character = " "
    elseif char == "numpad0" then
        character = "0"
      elseif char == "numpad1" then
        character = "1"
      elseif char == "numpad2" then
        character = "2"
      elseif char == "numpad3" then
        character = "3"
      elseif char == "numpad4" then
        character = "4"
      elseif char == "numpad5" then
        character = "5"
      elseif char == "numpad6" then
        character = "6"
      elseif char == "numpad7" then
        character = "7"
      elseif char == "numpad8" then
        character = "8"
      elseif char == "numpad9" then
        character = "9"
    elseif char == "numpadsub" or char == "minus" then
        character = "-"
    elseif char == "period" then
        character = "."
    
    end
    if type then
          gpu.set(x+index, y, character)
        end
      end
    end
  end
  return text
end
]]
function removeLines(filename, startingLine, numLines)
    local fp = io.open(filename, "r")
    if fp == nil then return nil end
 
    content = {}
    i = 1;
    for line in fp:lines() do
      if i < startingLine or i >= startingLine + numLines then
      content[#content+1] = line
    end
    i = i + 1
    end
 
    if i > startingLine and i < startingLine + numLines then return nil end
 
    fp:close()
    fp = io.open(filename, "w")
 
    for i = 1, #content do
    fp:write(string.format("%s\n", content[i]))
    end
 
    fp:close()
end

function wrap(str, limit)
  if (str == nil) or (str == " ") then return nil end
  local Lines, here, limit = {}, 1, limit or 72
  Lines[1] = string.sub(str,1,str:find("(%s+)()(%S+)()")-1)

  str:gsub("(%s+)()(%S+)()",
        function(sp, st, word, fi)
          if fi-here > limit then
                here = st
                Lines[#Lines+1] = word
          else Lines[#Lines] = Lines[#Lines].." "..word end
        end)

  return Lines
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function addressBook(override)
  gpu.fill(1, 1, w, h, " ")
  drawAddressBookBorders()
  
  gpu.setForeground(0x339D8F)
  gpu.setBackground(0x000000)
  gpu.set(5, 3, "SYSTEM GLYPHS / FILE ARCHIVE / DISPLAY COMPLETE")
  gpu.set(10, 7, "1")
  gpu.set(10+1*15, 7, "2")
  gpu.set(10+2*15, 7, "3")
  gpu.set(10+3*15, 7, "4")
  gpu.set(10+4*15, 7, "5")
  gpu.set(10+5*15, 7, "6")
  gpu.set(10+6*15, 7, "7")
  gpu.set(10+7*15, 7, "PROFILE")
  gpu.setBackground(0x339D8F)
  gpu.fill(5, 4, w-7, 1, " ")
  gpu.fill(10, 8, w-12, 1, " ")
  
  gpu.fill(64, h-4, 5, 3, " ")
  gpu.fill(149, h-4, 5, 3, " ")
  --gpu.fill(4, h-4, 13, 3, " ")
  gpu.fill(70, h-2, 2, 1, " ")
  
  gpu.setForeground(0xFFFFFF)
  gpu.setBackground(0x000000)
  gpu.set(65, h-3, "<<<")
  gpu.set(150, h-3, ">>>")
  --gpu.set(114, h-3, "01  02  03  04  05  06  07  08  09")
  gpu.set(70, h-3, "01  02  03  04  05  06  07  08  09  10  11  12  14  13  15  16  17  18  19  20")
  
    

  local currentPage = 1
  local index = 0
  local locations = {}
  local addresses = {}
  --local numLines = 0
  
  for location in string.gmatch(sg.getLocations(), '([^,]+)') do
      table.insert(locations, location)
  end
  
  local addressBookRunning = true
  while addressBookRunning do
    
    --print(tablelength(locations))
    
    for iter = 1+((currentPage-1)*5), tablelength(locations) do
      --numLines = numLines + 1
      --print(iter..tablelength(locations))
      
      if (sg.getAddressForLocation(locations[iter]) ~= "None") then
        index = index + 1
        gpu.setBackground(0x339D8F)
        gpu.fill(4, 3+index*7, w-10, 1, " ")
      
        gpu.fill(4, 3+index*7, 13, 5, " ")
        gpu.fill(19, 3+index*7, 13, 5, " ")
        gpu.fill(34, 3+index*7, 13, 5, " ")
        gpu.fill(49, 3+index*7, 13, 5, " ")
        gpu.fill(64, 3+index*7, 13, 5, " ")
        gpu.fill(79, 3+index*7, 13, 5, " ")
        gpu.fill(94, 3+index*7, 13, 5, " ")
        
        gpu.fill(143, 5+index*7, 10, 3, " ")
      
        gpu.setBackground(0x000000)
        gpu.fill(5, 4+index*7, 11, 3, " ")
        gpu.fill(20, 4+index*7, 11, 3, " ")
        gpu.fill(35, 4+index*7, 11, 3, " ")
        gpu.fill(50, 4+index*7, 11, 3, " ")
        gpu.fill(65, 4+index*7, 11, 3, " ")
        gpu.fill(80, 4+index*7, 11, 3, " ")
        gpu.fill(95, 4+index*7, 11, 3, " ")
        
        gpu.fill(144, 6+index*7, 8, 1, " ")
      
        gpu.setForeground(0xFFFFFF)
        gpu.set(145, 6+index*7, " DIAL ")
      
        local coords = sg.getCoordinatesForLocation(locations[iter])
        local atmosphere = sg.getAtmosphereForLocation(locations[iter])
        local galaxy = sg.getGalaxyNameForLocation(locations[iter])
        local address = sg.getAddressForLocation(locations[iter])
        
        gpu.set(110, 4+index*7, "# "..index+((currentPage-1)*5))
        gpu.set(120, 4+index*7, locations[iter])
        gpu.set(110, 5+index*7, "Additional symbols: ")
        gpu.set(110, 6+index*7, "Atmosphere: "..atmosphere)
        gpu.set(110, 7+index*7, "Galaxy: "..galaxy)
        
        table.insert(addresses, address)
        
        local j = 0
        for i = 1,10 do
          local symbol = address:sub(i,i)
          if i<8 then
            j = j + 1
            gpu.set(10+(j-1)*15, 5+index*7, symbol)
          elseif i==8 then
            gpu.set(130, 5+index*7, symbol)
          elseif i==9 then
            gpu.set(132, 5+index*7, symbol)
          end
        end
        
        if index > 4 then
          --currentPage = currentPage + 1
          break
        end
        
      end
    end
  
    if override then return nil end
  
  --click handling
    local clicking = true
    while clicking do
      local _,_,x,y = event.pull(1, "touch")
      if x then
        --exit
        if ((x<w) and (x>w-5)) and ((y<2) and (y>0)) then
          addressBookRunning = false
          clicking = false
          break
        end
      --next page
        if ((x<153) and (x>149)) and ((y<h-2) and (y>h-4)) and (currentPage < 20) then
          gpu.setBackground(0x000000)
          gpu.fill(4, 10, w-10, 35, " ")
          gpu.fill(70, h-2, 74, 1, " ")
          gpu.setBackground(0x339D8F)
          gpu.fill(70+(currentPage*4), h-2, 2, 1, " ")
          currentPage = currentPage+1
          index = 0
          clicking = false
        end
      --prev. page
        if ((x<68) and (x>64)) and ((y<h-2) and (y>h-4)) and (currentPage > 1) then
          gpu.setBackground(0x000000)
          gpu.fill(4, 10, w-10, 35, " ")
          gpu.fill(70, h-2, 74, 1, " ")
          currentPage = currentPage-1
          gpu.setBackground(0x339D8F)
          gpu.fill(70+((currentPage-1)*4), h-2, 2, 1, " ")
          index = 0
          clicking = false
        end
        for i=0,4 do
          --dial
          if ((x<153) and (x>143)) and ((y<(14+i*7)) and (y>(12+i*7))) then
            addressBookRunning = false
            clicking = false
            ok, result = pcall(sg.dial, addresses[(i+1)+((currentPage-1)*5)])
          end
        end
      end
    end
  end
    

  resetGUI()
end


resetGUI()

--Main loop
while running do
  --Information
  local state, engaged, direction = sg.stargateState()
  local iris = sg.irisState()
  
  if state == "Idle"  then
    gpu.setBackground(0x000000)
  gpu.fill(40, 42, 80, 5, " ")
  gpu.fill(41, 41, 78, 1, " ")
  gpu.fill(41, 47, 78, 1, " ")
  
    gpu.setForeground(0xCC0001)
    gpu.setBackground(0xCC0001)
    drawI(23)
    drawD(23+8)
    drawL(23+16)
    drawE(23+24)

    if iris == "Closed" then
      drawIris()
    else
      drawWormhole(0x000000)
    end
  end

  if state == "Dialling" then
    gpu.setBackground(0x000000)
  gpu.fill(40, 42, 80, 5, " ")
  gpu.fill(41, 41, 78, 1, " ")
  gpu.fill(41, 47, 78, 1, " ")
  
    gpu.setForeground(0xCC0001)
    gpu.setBackground(0xCC0001)
    drawD(10)
    drawI(10+8)
    drawA(10+16)
    drawL(10+24)
    drawI(10+32)
    drawN(10+40)
    drawG(10+48)
    
    if iris == "Closed" then
      drawIris()
    else
      drawWormhole(0x000000)
    end
    
    local _,_,chevronNumber,chevronSymbol = event.pull("sgChevronEngaged")
    gpu.setBackground(0xFF0000)
    gpu.setForeground(0xFFFFFF)
    if chevronNumber == 1 then
      gpu.fill(100, 13, 2, 1, " ")
      gpu.setBackground(0x000000)
      gpu.set(136, 10, chevronSymbol)
    elseif chevronNumber == 2 then
      gpu.fill(108, 23, 2, 1, " ")
      gpu.setBackground(0x000000)
      gpu.set(136, 16, chevronSymbol)
    elseif chevronNumber == 3 then
      gpu.fill(104, 31, 2, 1, " ")
      gpu.setBackground(0x000000)
      gpu.set(136, 22, chevronSymbol)
    elseif chevronNumber == 4 then
      gpu.fill(56, 31, 2, 1, " ")
      gpu.setBackground(0x000000)
      gpu.set(136, 28, chevronSymbol)
    elseif chevronNumber == 5 then
      gpu.fill(52, 23, 2, 1, " ")
      gpu.setBackground(0x000000)
      gpu.set(136, 34, chevronSymbol)
    elseif chevronNumber == 6 then
      gpu.fill(60, 13, 2, 1, " ")
      gpu.setBackground(0x000000)
      gpu.set(136, 40, chevronSymbol)
    elseif chevronNumber == 7 then
      gpu.fill(80, 9, 2, 1, " ")
      gpu.setBackground(0x000000)
      gpu.set(136, 46, chevronSymbol)
    elseif chevronNumber == 8 then
      gpu.fill(90, 36, 2, 1, " ")
      gpu.setBackground(0x000000)
      gpu.set(136, 52, chevronSymbol)
    elseif chevronNumber == 9 then
      gpu.fill(70, 36, 2, 1, " ")
      gpu.setBackground(0x000000)
      gpu.set(136, 58, chevronSymbol)
    end
  end

  if state == "Opening" then
    gpu.setBackground(0x000000)
  gpu.fill(40, 42, 80, 5, " ")
  gpu.fill(41, 41, 78, 1, " ")
  gpu.fill(41, 47, 78, 1, " ")
  
    gpu.setForeground(0xCC0001)
    gpu.setBackground(0xCC0001)
    drawO(10)
    drawP(10+8)
    drawE(10+16)
    drawN(10+24)
    drawI(10+32)
    drawN(10+40)
    drawG(10+48)
    
    if iris == "Closed" then
      drawIris()
    else
      drawWormhole(0x000000)
    end
  end

  if (state == "Connected") and (direction == "Incoming") then
    gpu.setBackground(0x000000)
  gpu.fill(40, 42, 80, 5, " ")
  gpu.fill(41, 41, 78, 1, " ")
  gpu.fill(41, 47, 78, 1, " ")
  
    gpu.setForeground(0xCC0001)
    gpu.setBackground(0xCC0001)
    drawI(5)
    drawN(5+8)
    drawC(5+16)
    drawO(5+24)
    drawM(5+32)
    drawI(5+40)
    drawN(5+48)
    drawG(5+56)
    
    if iris == "Closed" then
      drawIris()
    else
      drawWormhole(0x2866A6)
    end
  end

  if (state == "Connected") and (direction == "Outgoing") then
    gpu.setBackground(0x000000)
  gpu.fill(40, 42, 80, 5, " ")
  gpu.fill(41, 41, 78, 1, " ")
  gpu.fill(41, 47, 78, 1, " ")
  
    gpu.setForeground(0xCC0001)
    gpu.setBackground(0xCC0001)
    drawC(2)
    drawO(2+8)
    drawN(2+16)
    drawN(2+24)
    drawE(2+32)
    drawC(2+40)
    drawT(2+48)
    drawE(2+56)
    drawD(2+64)
    
    if iris == "Closed" then
      drawIris()
    else
      drawWormhole(0x2866A6)
    end
  end

  if state == "Closing" then
    gpu.setBackground(0x000000)
  gpu.fill(40, 42, 80, 5, " ")
  gpu.fill(41, 41, 78, 1, " ")
  gpu.fill(41, 47, 78, 1, " ")
  
    gpu.setForeground(0xCC0001)
    gpu.setBackground(0xCC0001)
    drawC(10)
    drawL(10+8)
    drawO(10+16)
    drawS(10+24)
    drawI(10+32)
    drawN(10+40)
    drawG(10+48)
    
    gpu.setBackground(0x000000)
    gpu.fill(5, 10, 26, 1, " ")
    
    if iris == "Closed" then
      drawIris()
    else
      drawWormhole(0x000000)
    end
    gpu.setBackground(0x000000)
    gpu.setForeground(0x000000)
    gpu.fill(100, 13, 2, 1, " ")
    gpu.set(136, 10, " ")
    gpu.fill(108, 23, 2, 1, " ")
    gpu.set(136, 16, " ")
    gpu.fill(104, 31, 2, 1, " ")
    gpu.set(136, 22, " ")
    gpu.fill(56, 31, 2, 1, " ")
    gpu.set(136, 28, " ")
    gpu.fill(52, 23, 2, 1, " ")
    gpu.set(136, 34, " ")
    gpu.fill(60, 13, 2, 1, " ")
    gpu.set(136, 40, " ")
    gpu.fill(80, 9, 2, 1, " ")
    gpu.set(136, 46, " ")
    gpu.fill(90, 36, 2, 1, " ")
    gpu.set(136, 52, " ")
    gpu.fill(70, 36, 2, 1, " ")
    gpu.set(136, 58, " ")
  end

  if state == "Offline" then
    gpu.setBackground(0x000000)
  gpu.fill(40, 42, 80, 5, " ")
  gpu.fill(41, 41, 78, 1, " ")
  gpu.fill(41, 47, 78, 1, " ")
  
    gpu.setForeground(0xCC0001)
    gpu.setBackground(0xCC0001)
    drawO(10)
    drawF(10+8)
    drawF(10+16)
    drawL(10+24)
    drawI(10+32)
    drawN(10+40)
    drawE(10+48)
    
    if iris == "Closed" then
      drawIris()
    else
      drawWormhole(0x000000)
    end
  end
  
  --buttons
  --drawButtons()
  gpu.setBackground(0x000000) 
  gpu.setForeground(0xFFFFFF)
  --iris
  gpu.set(14, 4, iris.."   ")
  --energy available
  local energy = sg.energyAvailable()
  --if energy > 5000000 then
  --  energy = 5000000
  --end
  energy = string.format("%d", energy/1000)
  --gpu.set(8, 20, energy.."/5000 kSU   ")
  gpu.set(8, 20, energy.." kSU        ")
  --energy required
  if (not (address == nil)) and (string.len(address) > 6) then
    --gpu.set(8, 24, sg.energyToDial(address))
  end
  
  --click handling
  local _,_,x,y = event.pull(1, "touch")
  if x then
    
    --address book
    if ((x<30) and (x>4)) and ((y<29) and (y>27)) then
      addressBook()
    end

    --dialing 
  if ((x<30) and (x>4)) and ((y<11) and (y>9)) then
      gpu.fill(5, 10, 26, 1, " ")
      local typing = true
      local type = true
      local symbol
    address = ""
      local index = 0
      while typing and index<=11 do
        gpu.set(11+index+1, 10, "_")
        local _,_,key = event.pull("key_down")
        index = index + 1
        if (key == 8) and (index > 1) then --backspace
          index = index - 1
          address = string.sub(address, 1, index+1)
          gpu.set(11+index+1, 10, " ")
          gpu.set(11+index, 10, "_")
          index=index-1
        elseif index >= 1 then
          if ((key>47) and (key<58)) then
            symbol = numbers[key-47]
          end
            if ((key>96) and (key<123)) then
              symbol = characters[key-96]
            end
            if type then
              gpu.set(11+index, 10, symbol)
            end
            if index==4 then
              index = index + 1
              gpu.set(11+index, 10, "-")
            end
            if index==8 then
              index = index + 1
              gpu.set(11+index, 10, "-")
            end
            if index==11 then
              type = false
              gpu.set(11+index+1, 10, "_")
              for i=1,11 do
                symbol = gpu.get(11+i, 10)
                if symbol == "-" then
          address = address.."-"
                else
                  address = address..symbol
                end
              end
              while true do
                local _,_,key = event.pull("key_down")
                if key == 13 then
                  gpu.set(11+index+1, 10, " ") 
                  typing = false
                  break
                end
              end
            end
          end 
        end
      ok, result = pcall(sg.dial, address)
      if ok then
        gpu.fill(5, 36, 26, 12, " ")
        resultTable = wrap("Dialling gate at: "..address, 26)
        for k,v in pairs(resultTable) do
          gpu.set(5, 35+k, v)
        end
        local energyReq = string.format("%d", energy/1000)
        resultTable = wrap("Required energy: "..energyReq.." kSU", 26)
        for k,v in pairs(resultTable) do
          gpu.set(5, 22+k, v)
        end
      else
        gpu.fill(5, 36, 26, 12, " ")
        resultTable = wrap(result, 26)
        for k,v in pairs(resultTable) do
          gpu.set(5, 35+k, v)
        end
      end
    end
  end

  gpu.setForeground(0xFFFFFF)
  gpu.setBackground(0x000000)
end

term.clear()
