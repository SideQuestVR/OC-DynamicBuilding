local files = {
    "/client.lua",
    "/server.lua",
}
local folders = {}
local fs = require("filesystem")
local shell = require("shell")
local base_url = "https://raw.githubusercontent.com/SideQuestVR/OC-DynamicBuilding/master";
for key,value in pairs(folders) do
    fs.makeDirectory(shell.getWorkingDirectory()..value)
end
local wget = loadfile("/bin/wget.lua")
for key,value in pairs(files) do
    wget("-qf",base_url..value,"./"..value)
end
