
local event = require('event')
local serialization = require('serialization');
local component = require('component')
local modem = component.modem
while true do
    if(modem.isOpen(666) ~= true) then
        modem.open(666)
    end
    local type, to, from, port, distance, message = event.pull("modem")
    local state = serialization.unserialize(message)
    for modem_id, redstone_value in pairs(state) do
        if(to == modem_id) then
            component.redstone.setOutput(0, redstone_value[1]) -- bottom
            component.redstone.setOutput(1, redstone_value[2]) -- top
            print("bottom", redstone_value[1])
            print("top", redstone_value[2])
        end
    end
end
