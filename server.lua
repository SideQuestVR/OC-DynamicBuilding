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
        setPowerValue(i)
        state[client_id] = power_values[i];
        print("Sending to client: ", client_id, state[client_id][1], state[client_id][2])
        modem.send(client_id,666,serialization.serialize(state))
        i = i + 1
    end
    os.sleep(3)
end
