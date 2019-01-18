local component = require("component")
local shell = require("shell")
local fs = require("filesystem")

if not component.isAvailable("gpu") then
  io.stderr:write("GPU not found\n")
  return
end

if not component.isAvailable("stargate") then
  io.stderr:write("Stargate interface not found\n")
  return
end

if not component.isAvailable("internet") then
  io.stderr:write("Internet card not found\n")
  return
end

-- table deserialiazition function, part of Serpent library by Paul Kulchenko
-- see https://github.com/pkulchenko/serpent
local function deserialize(data, opts)
  local env = (opts and opts.safe == false) and G
    or setmetatable({}, {
        __index = function(t,k) return t end,
        __call = function(t,...) error("cannot call functions") end
      })
  local f, res = (loadstring or load)('return '..data, nil, nil, env)
  if not f then f, res = (loadstring or load)(data, nil, nil, env) end
  if not f then return f, res end
  if setfenv then setfenv(f, env) end
  return pcall(f)
end

local internet = require("internet")
local url = "https://raw.githubusercontent.com/OneDayStudios/DiallingComputer/"

local function loadRemoteConfig()
  local result, response = pcall(internet.request, url .. "master/programs.cfg")
  if not result then
    -- HTTP error, terminate
    io.stderr:write("Failed to load remote config: " .. response .. "\n")
    return nil
  else
    local _, cfg = deserialize(response())
    return cfg
  end
end

local remoteCfg = loadRemoteConfig()
if remoteCfg == nil then
  return
end

function install()
  local files = remoteCfg.StargateControl.files
  for remoteFileName, localFileName in pairs(files) do
    print(remoteFileName, localFileName)
    local result, response = pcall(internet.request, url .. remoteFileName)
    if not result then
      -- HTTP error, terminate
      io.stderr:write("Failed to load remote file: " .. remoteFileName .. "\n" .. response .. "\n")
      return false
    else
      -- remove old
      if fs.exists(localFileName) then
        fs.remove(localFileName)
      end
      
      -- download new
      local f, reason = io.open(localFileName, "w")
      if not f then
        io.stderr:write("Failed to open file: " .. localFileName .. "\n" .. reason .. "\n")
        return
      end
      for chunk in response do
        f:write(chunk)
      end
      f:close()
      
    end
  end
end

-- check version and update/install
local programsFile, reason = io.open("src/programs.cfg", "r")
if not programsFile and reason ~= "file not found" then
  -- unknown error
  io.stderr:write("Failed to load config file: " .. reason .. "\n")
  return
elseif reason == "file not found" then
  -- fresh install
  io.write("programs.cfg file not found, installing")
  if not install() then
    return
  end
else
  -- local config file present, deserialize
  local ok, cfgLocal = deserialize(programsFile:read("*a"))
  programsFile:close()
  
  local versionLocal = cfgLocal.StargateControl.note
  if versionLocal == nil or not ok then
    -- programs.cfg malformed, reinstall
    io.write("programs.cfg file is malformed, reinstalling")
    if not install() then
      return
    end
  elseif versionLocal ~= remoteCfg.StargateControl.note then
    -- update required
    io.write("updating ...")
    if not install() then
      return
    end
  end
end

local app = require("src/app")
app.run()
