-- Exports Sesuai Framework
if Config.Framework == 'esx' then
	ESX = exports[Config.Core]:getSharedObject()
elseif Config.Framework == 'qbcore' then
	QBCore = exports[Config.Core]:GetCoreObject()
end

-- Function Notify
local function Notify(message, type)
	if Config.Framework == 'esx' then
		ESX.ShowNotification(message, type) -- Show Notifikasi ESX
	elseif Config.Framework == 'qbcore' then
		QBCore.Functions.Notify(message, type) -- Show Notifikasi qbcore
    else -- Standalone
        print(message)
    end
end

-- Command Joget Bareng
RegisterCommand(Config.Command, function()
    if Config.Input == 'ox_lib' then -- Config Input

        -- Exports Ox Lib Input

        local input = lib.inputDialog('Joget Bareng', {
            {type = 'input', label = 'Joget', description = 'Nama Emote Jogetan', icon = 'clipboard'},
            {type = 'number', label = 'Radius', description = 'Masukkan Radius', icon = 'clipboard'},
        })

        if not input or not input[1] then return end

        setDance(input[1], input[1], input[2])
    elseif Config.Input == 'qb-menu' then -- Config Input

        -- Exports qb-menu Input

        local inputData = exports['qb-input']:ShowInput({
            header = "Joget Bareng",
            submitText = "Confirm",
            inputs = {
                {
                    type = 'text',
                    isRequired = true,
                    name = 'emotejogetan',
                    text = "Nama Emote Jogetan"
                },
                {
                    type = 'number',
                    isRequired = true,
                    name = 'radius',
                    text = "Radius"
                },
            }
        })

        if inputData then
            setDance(inputData.emotejogetan, inputData.emotejogetan, tonumber(inputData.radius))
        end
    end
end)

function setDance(did, dname, radius)
    if did ~= nil then
        Notify("Dance Set Command : "..dname, "info") -- Notify
        TriggerServerEvent("qb-admin:server:setemote", did, radius)
    else
        Notify("Invalid Dance or emote", "error") -- Notify
    end
end