RegisterServerEvent("qb-admin:server:setemote")
AddEventHandler("qb-admin:server:setemote", function(dance, radius)
	if Config.UseAdmin then -- Validasi config hanya bisa admin
        if IsPlayerAceAllowed(source, 'command') then -- Validasi hanya bisa admin
            local player = source -- Get Id
            local ped = GetPlayerPed(player)
            local playerCoords = GetEntityCoords(ped) -- Get Player Coords
            local args = { dance } -- Argumen Dance
            TriggerClientEvent('animations:client:PlayEmoteSync', -1, args, playerCoords, radius)
        else
            if Config.Framework == 'esx' then
                -- Tidak Memiliki Akses
                TriggerClientEvent('esx:showNotification', source, "No permission", 'error')
            elseif Config.Framework == 'qbcore' then
                -- Tidak Memiliki Akses
                TriggerClientEvent('esx:showNotification', source, "No permission", 'error')
            else -- Standalone
                print(message)
            end
        end
    else
        local player = source -- Get Id
        local ped = GetPlayerPed(player)
        local playerCoords = GetEntityCoords(ped) -- Get Player Coords
        local args = { dance } -- Argumen Dance
        TriggerClientEvent('animations:client:PlayEmoteSync', -1, args, playerCoords, radius)
    end
end)