QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('QBCore:Server:PlayerLoaded', function(Player)
    local src = source
    Wait(2000)
    
    if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
        TriggerClientEvent('qb-dispatch:client:toggleUI', src, { onDuty = Player.PlayerData.job.onduty })
    end
end)
RegisterNetEvent('qb-dispatch:server:policeAlert')
AddEventHandler('qb-dispatch:server:policeAlert', function(alertData)
    local src = source
    
    if alertData ~= nil then
        print("Alerta recibida de: " .. GetPlayerName(src))
        print("Detalles de la alerta: " .. json.encode(alertData))

        if alertData.type == "car" then

            local players = QBCore.Functions.GetPlayers()
            for i=1, #players, 1 do
                local player = QBCore.Functions.GetPlayer(players[i])
                if player.PlayerData.job.name == "police" and player.PlayerData.job.onduty then
                    TriggerClientEvent('qb-dispatch:client:addAlert', players[i], {
                        title = alertData.title,
                        desc = alertData.desc,
                        location = alertData.location,
                        type = alertData.type,
                        make = alertData.make,
                        model = alertData.model,
                        color = alertData.color,
                        plate = alertData.plate,
                        coords = alertData.coords
                    })
                end
            end
        else
            local players = QBCore.Functions.GetPlayers()
            for i=1, #players, 1 do
                local player = QBCore.Functions.GetPlayer(players[i])
                if player.PlayerData.job.name == "police" and player.PlayerData.job.onduty then
                    TriggerClientEvent('qb-dispatch:client:addAlert', players[i], {title = "Entorno", desc = alertData.desc, type = "entorno"})
                end
            end
        end

    end
end)