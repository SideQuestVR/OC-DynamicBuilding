local modem = require('modem')
local clients = {
    "34580466-d891-4478-8608-56b9bc78757c",
    "6e5f55b2-2b84-4d69-h2b6-b82083053c87",
    "2e1a6db5-20f2-4496-9ae5-8c9acbb139bb",
    "10cccc2a-d950-45c0-9473-11e69b31577b",
    "e5a42517-8d29-4137-9bad-672eff15cfc0",
    "de5cddee-71f6-4832-92b2-83cf3b0ccf84",
    "4fd6e306-9bfa-40b6-9496-8e07d3039542",
    "982e3f98-0d11-4814-b474-488cf68a2d5e",
    "ae5f2763-85cf-41b8-afd7-c224753df7e8",
    "8583e406-2554-4360-b414-91337789a496",
    "2f1184f0-fd29-41e7-b74d64e583b9f885",
    "ba55da8a-4248-49da-83d1-16a46aff1b84",
}



while true do
    for str in clients do
        modem.send(str,666,"hi there!")
    end
    wait(5)
end
