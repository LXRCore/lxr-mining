--[[
    ██╗     ██╗  ██╗██████╗        ███╗   ███╗██╗███╗   ██╗██╗███╗   ██╗ ██████╗
    ██║     ╚██╗██╔╝██╔══██╗      ████╗ ████║██║████╗  ██║██║████╗  ██║██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗██╔████╔██║██║██╔██╗ ██║██║██╔██╗ ██║██║  ███╗
    ██║      ██╔██╗ ██╔══██╗╚════╝██║╚██╔╝██║██║██║╚██╗██║██║██║╚██╗██║██║   ██║
    ███████╗██╔╝ ██╗██║  ██║      ██║ ╚═╝ ██║██║██║ ╚████║██║██║ ╚████║╚██████╔╝
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝      ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝

    🐺 LXR Mining System — The Land of Wolves

    An immersive, multi-framework mining resource for RedM.
    Players mine at designated quarry locations, process raw ore, and sell
    refined materials through a vendor NPC — all with full framework support.

    ═══════════════════════════════════════════════════════════════════════════════
    SERVER INFORMATION
    ═══════════════════════════════════════════════════════════════════════════════

    Server:      The Land of Wolves 🐺
    Developer:   iBoss21 / The Lux Empire
    Website:     https://www.wolves.land
    Discord:     https://discord.gg/CrKcWdfd3A
    Store:       https://theluxempire.tebex.io

    ═══════════════════════════════════════════════════════════════════════════════

    Version: 1.0.0
    Performance Target: Optimized for minimal server overhead and client FPS impact

    Tags: RedM, Mining, Economy, SeriousRP, Whitelist, LXRCore, wolves.land

    Framework Support:
    - LXR Core  (Primary)
    - RSG Core  (Primary)
    - VORP Core (Supported / Legacy)
    - RedEM:RP  (Optional)
    - QBR Core  (Optional)
    - QR Core   (Optional)
    - Standalone (Fallback)

    ═══════════════════════════════════════════════════════════════════════════════
    CREDITS
    ═══════════════════════════════════════════════════════════════════════════════

    Script Author: iBoss21 / The Lux Empire for The Land of Wolves

    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 RESOURCE NAME PROTECTION - RUNTIME CHECK
-- ═══════════════════════════════════════════════════════════════════════════════

local REQUIRED_RESOURCE_NAME = "lxr-mining"
local currentResourceName = GetCurrentResourceName()

if currentResourceName ~= REQUIRED_RESOURCE_NAME then
    error(string.format([[

        ═══════════════════════════════════════════════════════════════════════════════
        ❌ CRITICAL ERROR: RESOURCE NAME MISMATCH ❌
        ═══════════════════════════════════════════════════════════════════════════════

        Expected: %s
        Got: %s

        This resource is branded and must maintain the correct name.
        Rename the folder to "%s" to continue.

        🐺 wolves.land - The Land of Wolves

        ═══════════════════════════════════════════════════════════════════════════════

    ]], REQUIRED_RESOURCE_NAME, currentResourceName, REQUIRED_RESOURCE_NAME))
end

Config = {}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ SERVER BRANDING & INFO ████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.ServerInfo = {
    name      = 'The Land of Wolves 🐺',
    type      = 'Serious Hardcore Roleplay',
    access    = 'Discord & Whitelisted',

    -- Contact & Links
    website   = 'https://www.wolves.land',
    discord   = 'https://discord.gg/CrKcWdfd3A',
    github    = 'https://github.com/iBoss21',
    store     = 'https://theluxempire.tebex.io',

    -- Developer Info
    developer = 'iBoss21 / The Lux Empire',

    -- Tags
    tags = {'RedM', 'Mining', 'Economy', 'SeriousRP', 'Whitelist', 'wolves.land'}
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ FRAMEWORK CONFIGURATION ███████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

--[[
    Framework Priority (in order):
    1. LXR-Core  (Primary)
    2. RSG-Core  (Primary)
    3. VORP Core (Supported / Legacy)
    4. RedEM:RP  (Optional - if detected)
    5. QBR-Core  (Optional - if detected)
    6. QR-Core   (Optional - if detected)
    7. Standalone (Fallback)
]]

Config.Framework = 'auto' -- 'auto' or manual: 'lxr-core', 'rsg-core', 'vorp_core', 'redem_roleplay', 'qbr-core', 'qr-core', 'standalone'

-- Framework-specific settings
Config.FrameworkSettings = {
    ['lxr-core'] = {
        resource    = 'lxr-core',
        inventory   = 'lxr-inventory',
        events = {
            server   = 'lxr-mining:server:%s',
            client   = 'lxr-mining:client:%s',
            callback = 'LXRCore:%s'
        }
    },
    ['rsg-core'] = {
        resource    = 'rsg-core',
        inventory   = 'rsg-inventory',
        events = {
            server   = 'lxr-mining:server:%s',
            client   = 'lxr-mining:client:%s',
            callback = 'RSGCore:%s'
        }
    },
    ['vorp_core'] = {
        resource    = 'vorp_core',
        inventory   = 'vorp_inventory',
        events = {
            server   = 'lxr-mining:server:%s',
            client   = 'lxr-mining:client:%s'
        }
    },
    ['redem_roleplay'] = {
        resource    = 'redem_roleplay',
        inventory   = 'redem_inventory',
        events = {
            server   = 'lxr-mining:server:%s',
            client   = 'lxr-mining:client:%s'
        }
    },
    ['qbr-core'] = {
        resource    = 'qbr-core',
        inventory   = 'qbr-inventory',
        events = {
            server   = 'lxr-mining:server:%s',
            client   = 'lxr-mining:client:%s'
        }
    },
    ['qr-core'] = {
        resource    = 'qr-core',
        inventory   = 'qr-inventory',
        events = {
            server   = 'lxr-mining:server:%s',
            client   = 'lxr-mining:client:%s'
        }
    },
    ['standalone'] = {
        -- Minimal functionality without framework dependency
        inventory   = 'none'
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ KEY BINDINGS ██████████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

-- Customizable actions for player interaction
Config.Keys = {
    Action   = 0xCEFD9220, -- 'E' key — start mining / interact with zone
    Interact = 0xF3830D8E  -- 'J' key — open NPC vendor menu
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ TIMING SETTINGS ███████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

-- All times in milliseconds
Config.MiningTimer  = 20 * 1000        -- 20 seconds — mining animation/progress duration
Config.RefreshTimer = 30 * 60 * 1000   -- 30 minutes — reset mined zones (per client)

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ MINE ENTRANCE COORDINATES ████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

-- Used for the mine-entrance blip on the map
Config.MineCord = vector3(2789.1987, 1340.2327, 71.3155)

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ SMELTING / DROP ITEMS █████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

-- Min/Max define the random quantity range for each resource awarded after mining
Config.SmeltingItems = {
    iron   = { Min = 1, Max = 10 },
    copper = { Min = 1, Max = 10 },
    gold   = { Min = 1, Max = 10 },
    coal   = { Min = 1, Max = 10 }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ MINING LOCATIONS ██████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

-- Each entry defines an interactive mining zone; radius controls the trigger sphere
Config.MiningLocations = {
    { name = "Upper East Quarry",          coords = vector3(2747.63, 1388.7,  69.01), radius = 5.0 },
    { name = "Upper Central Quarry",       coords = vector3(2746.66, 1379.09, 68.55), radius = 5.0 },
    { name = "Lower East Quarry",          coords = vector3(2724.04, 1388.7,  68.82), radius = 5.0 },
    { name = "Lower Central Quarry",       coords = vector3(2727.67, 1385.56, 69.22), radius = 5.0 },
    { name = "Lower South Quarry",         coords = vector3(2723.16, 1375.39, 68.89), radius = 5.0 },
    { name = "Central Quarry Entrance",    coords = vector3(2743.93, 1385.92, 68.7),  radius = 5.0 },
    { name = "Northern Quarry",            coords = vector3(2760.84, 1402.35, 68.74), radius = 5.0 },
    { name = "North Central Quarry",       coords = vector3(2760.91, 1395.98, 68.7),  radius = 5.0 },
    { name = "North West Quarry",          coords = vector3(2771.02, 1382.77, 67.98), radius = 5.0 },
    { name = "Western Quarry",             coords = vector3(2763.33, 1376.24, 67.83), radius = 5.0 },
    { name = "South West Quarry",          coords = vector3(2754.61, 1358.63, 68.17), radius = 5.0 },
    { name = "South Central Quarry",       coords = vector3(2752.92, 1368.36, 67.8),  radius = 5.0 },
    { name = "Mid Western Quarry",         coords = vector3(2758.53, 1379.4,  68.24), radius = 5.0 },
    { name = "Central Quarry",             coords = vector3(2757.53, 1382.55, 68.2),  radius = 5.0 },
    { name = "Central Quarry East",        coords = vector3(2747.99, 1382.55, 68.61), radius = 5.0 },
    { name = "Central Quarry North",       coords = vector3(2747.38, 1391.84, 68.76), radius = 5.0 },
    { name = "North Central Quarry B",     coords = vector3(2761.37, 1390.62, 68.71), radius = 5.0 },
    { name = "Upper Northern Quarry",      coords = vector3(2759.16, 1408.6,  68.5),  radius = 5.0 },
    { name = "Far South Quarry",           coords = vector3(2728.11, 1329.45, 69.62), radius = 5.0 },
    { name = "South Eastern Quarry",       coords = vector3(2731.87, 1332.42, 69.64), radius = 5.0 },
    { name = "Deep South Quarry",          coords = vector3(2716.82, 1308.1,  69.78), radius = 5.0 },
    { name = "South West Entrance Quarry", coords = vector3(2712.96, 1308.03, 69.77), radius = 5.0 },
    { name = "South West Quarry B",        coords = vector3(2716.45, 1313.86, 69.73), radius = 5.0 },
    { name = "Mid Central Quarry",         coords = vector3(2746.23, 1366.28, 68.42), radius = 5.0 }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ COLLECTION & SELLING ██████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

-- When true, players can select a quantity when selling items in bulk
Config.CollectItems = true

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ NPC CONFIGURATION █████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Peds = {
    Miners = {
        Label  = 'Mining Vendor',
        Hash   = 1543787725,
        Coords = vector4(2789.31, 1336.87, 71.35, 9.15),

        -- Items the NPC will purchase from players (item = price in cash)
        Items = {
            iron   = 100,
            copper = 150,
            gold   = 200,
            coal   = 250
        },

        -- Items the NPC will sell to players (item = price in cash)
        BuyableItems = {
            pickaxe = 100
        }
    }
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ DEBUG SETTINGS ████████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Debug = false -- Enable extra console output for development

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ END OF CONFIGURATION ██████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

-- Startup boot banner
CreateThread(function()
    Wait(500)
    print([[

        ═══════════════════════════════════════════════════════════════════════════════

            ██╗     ██╗  ██╗██████╗        ███╗   ███╗██╗███╗   ██╗██╗███╗   ██╗ ██████╗
            ██║     ╚██╗██╔╝██╔══██╗      ████╗ ████║██║████╗  ██║██║████╗  ██║██╔════╝
            ██║      ╚███╔╝ ██████╔╝█████╗██╔████╔██║██║██╔██╗ ██║██║██╔██╗ ██║██║  ███╗
            ██║      ██╔██╗ ██╔══██╗╚════╝██║╚██╔╝██║██║██║╚██╗██║██║██║╚██╗██║██║   ██║
            ███████╗██╔╝ ██╗██║  ██║      ██║ ╚═╝ ██║██║██║ ╚████║██║██║ ╚████║╚██████╔╝
            ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝      ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝

        ═══════════════════════════════════════════════════════════════════════════════
        🐺 MINING SYSTEM - SUCCESSFULLY LOADED
        ═══════════════════════════════════════════════════════════════════════════════

        Version:    1.0.0
        Server:     The Land of Wolves 🐺
        Framework:  Auto-detect enabled
        Zones:      ]] .. #Config.MiningLocations .. [[ mining zones configured
        Resources:  iron · copper · gold · coal
        Refresh:    ]] .. (Config.RefreshTimer / 60000) .. [[ minutes per zone reset
        Debug:      ]] .. (Config.Debug and 'ENABLED' or 'DISABLED') .. [[

        ═══════════════════════════════════════════════════════════════════════════════

        Developer:  iBoss21 / The Lux Empire
        Website:    https://www.wolves.land
        Discord:    https://discord.gg/CrKcWdfd3A

        ═══════════════════════════════════════════════════════════════════════════════
    ]])
end)

