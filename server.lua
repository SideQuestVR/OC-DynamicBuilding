local component = require('component')
local serialization = require('serialization');
local modem = component.modem
local clients = require('clients');
local power_values = {
    {1,2},
    {3,4},
    {5,6},
    {7,8},
    {9,10},
    {11,12},
    {13,14},
    {15,16},
    {17,18},
    {19,20},
    {21,22},
    {23,24},
    {25,26}
}
local state = {}
-- local state = {
--     ["34580466-d891-4478-8608-56b9bc78757c"] = power_values[1],
--     ["6e5f55b2-2b84-4d69-h2b6-b82083053c87"] = power_values[2],
--     ["2e1a6db5-20f2-4496-9ae5-8c9acbb139bb"] = power_values[3],
--     ["10cccc2a-d950-45c0-9473-11e69b31577b"] = power_values[4],
--     ["e5a42517-8d29-4137-9bad-672eff15cfc0"] = power_values[5],
--     ["de5cddee-71f6-4832-92b2-83cf3b0ccf84"] = power_values[6],
--     ["4fd6e306-9bfa-40b6-9496-8e07d3039542"] = power_values[7],
--     ["982e3f98-0d11-4814-b474-488cf68a2d5e"] = power_values[8],
--     ["ae5f2763-85cf-41b8-afd7-c224753df7e8"] = power_values[9],
--     ["8583e406-2554-4360-b414-91337789a496"] = power_values[10],
--     ["2f1184f0-fd29-41e7-b74d-64e583b9f885"] = power_values[11],
--     ["ba55da8a-4248-49da-83d1-16a46aff1b84"] = power_values[12],
--     ["a8eee136-f9c4-4ed0-91c2-38d419187c73"] = power_values[13]
-- }
local i = 1
for _, client_id in pairs(clients) do
    state[client_id] = power_values[i]
    i = i + 1
end
local function setPowerValue(j)
    power_values[j][1] = power_values[j][1] + 1;
    power_values[j][2] = power_values[j][2] + 1;
    if(power_values[j][1] > 25) then
        power_values[j][1] = 1;
    end
    if(power_values[j][2] > 26) then
        power_values[j][2] = 2;
    end
end

while true do
    local i = 1
    for _, client_id in pairs(clients) do
        setPowerValue(j)
        state[client_id] = power_values[j];
        modem.send(client_id,666,serialization.serialize(state))
        i = i + 1
    end
    os.sleep(1)
end
