local serialization = require('serialization');
local component = require('component')
local modem = component.modem
local clients = require('clients');
local shell = require("shell")
local args, options = shell.parse(...)
local i = 1
local state = {}
for _, client_id in pairs(clients) do
    if options.off then
        state[client_id] = {0,0}
    else
        state[client_id] = {25,25}
    end
    i = i + 1
end
for _, client_id in pairs(clients) do
    modem.send(client_id,666,serialization.serialize(state))
    j = j + 1
end
