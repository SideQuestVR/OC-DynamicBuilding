local serialization = require('serialization');
local component = require('component')
local modem = component.modem
local clients = require('clients');
local shell = require("shell")
local args = shell.parse(...)
local state = {}
for _, client_id in pairs(clients) do
    if args[1] == "off" then
        state[client_id] = {0,0}
    else
        state[client_id] = {25,25}
    end
end
for _, client_id in pairs(clients) do
    print("Sending to client: ", client_id, state[client_id][1], state[client_id][2])
    modem.send(client_id,666,serialization.serialize(state))
    os.sleep(0.4)
end
