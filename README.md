# Naufal Emote Sync Player

Emote Sync Player QBCORE/QBX or ESX

# Features 
- Emote Sync By Radius

# Installation
- Add Resource core (esx or qb)
- Add Resource Context (ox lib or qb menu)
- Add Resource rpemotes
- Add Code Below in rpemotes > client > emote.lua
```lua
local danceflag = true
RegisterNetEvent('animations:client:PlayEmoteSync', function(args, coords, radius)
    if not IsPlayerDead(cache.ped) then
        local plyCoords = GetEntityCoords(PlayerPedId(), 0)
        local distance = #(plyCoords - vector3(coords.x, coords.y, coords.z))
        if distance < radius and danceflag then
            EmoteCommandStart(source, args)
        end
    end
end)
```

# Config settings

```lua
Config = {}

-- esx > es_extended
-- qb > qb-core
Config.Core = 'es_extended' -- Nama core resource kalian

-- esx or qbcore
Config.Framework = 'esx' -- masukkan framework sesuai framework kalian

-- Command
Config.Command = 'jogetbareng' -- Command untuk membuat emote bersama

-- Pilih context
Config.Input = 'ox_lib' -- > ox_lib or qb-menu

-- Pilih Configurasi Hanya admin
Config.UseAdmin = true -- Bisa digunakan admin atau tidak
```

## Previews 

![previewoxlib](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/config_emotesync_ox_lib.png)
![previewqbmenu](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/config_emotesync_qb_menu.png)
![previewcommand](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/previewcommand.png)

## Previews Video

![previewgifdance](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/PreviewJoget.gif)

https://github.com/user-attachments/assets/c3b81bb4-a049-4fb7-9097-263d663c3db9

## Previews Resmon Client Side

![previewresmonside](https://r2.fivemanage.com/WX5Hv6yMgODTgG2WF6rml/resmonside.png)

# Dependencies

- [qb-core](https://github.com/qbcore-framework/qb-core) -- if using qbcore
- [esx](https://github.com/esx-framework/esx_core) -- if using esx
- [qb-menu](https://github.com/qbcore-framework/qb-menu) -- Optional
- [ox_lib](https://github.com/overextended/ox_lib)
- [rpemotes](https://github.com/alberttheprince/rpemotes-reborn)

# SOON SCRIPT ANOTHER EMOTE
