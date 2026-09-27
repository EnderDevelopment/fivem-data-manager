local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

-- Example client event
RegisterNetEvent('fivemscript:client:exampleEvent')
AddEventHandler('fivemscript:client:exampleEvent', function(data)
    ESX.ShowNotification('Example event triggered with data: ' .. json.encode(data))
end)

-- Example command
RegisterCommand('fivemscript', function(source, args, rawCommand)
    TriggerServerEvent('fivemscript:server:exampleCommand', args)
end, false)