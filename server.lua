local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Database setup
MySQL.ready(function()
    MySQL.Async.execute('CREATE TABLE IF NOT EXISTS ' .. Config.Database.TableName .. ' (
        id INT AUTO_INCREMENT PRIMARY KEY,
        player_id INT NOT NULL,
        data TEXT NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )', {})
end)

-- Example server event
RegisterNetEvent('fivemscript:server:exampleCommand')
AddEventHandler('fivemscript:server:exampleCommand', function(args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local playerId = xPlayer.source
        local data = { example = 'data' }
        
        -- Save data to database
        MySQL.Async.execute('INSERT INTO ' .. Config.Database.TableName .. ' (player_id, data) VALUES (@player_id, @data)', {
            ['@player_id'] = playerId,
            ['@data'] = json.encode(data)
        }, function(rowsChanged)
            if rowsChanged > 0 then
                TriggerClientEvent('fivemscript:client:exampleEvent', playerId, data)
            else
                print('Failed to save data to database')
            end
        end)
    end
end)

-- Example callback
ESX.RegisterServerCallback('fivemscript:server:exampleCallback', function(source, cb, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        cb({ success = true, message = 'Callback successful' })
    else
        cb({ success = false, message = 'Player not found' })
    end
end)