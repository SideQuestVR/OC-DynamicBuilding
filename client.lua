
local event = require('event')
local modem = require('modem')
local function listen()
    if(!modem.isOpen(666)) then
        modem.open(666)
    end
    local message = event.pull("modem")
    print(message[0])
	listen()
end
