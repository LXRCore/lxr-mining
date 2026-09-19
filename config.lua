--[[
    ██╗     ██╗  ██╗██████╗       ███╗   ███╗██╗███╗   ██╗██╗███╗   ██╗ ██████╗
    ██║     ╚██╗██╔╝██╔══██╗      ████╗ ████║██║████╗  ██║██║████╗  ██║██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗██╔████╔██║██║██╔██╗ ██║██║██╔██╗ ██║██║  ███╗
    ██║      ██╔██╗ ██╔══██╗╚════╝██║╚██╔╝██║██║██║╚██╗██║██║██║╚██╗██║██║   ██║
    ███████╗██╔╝ ██╗██║  ██║      ██║ ╚═╝ ██║██║██║ ╚████║██║██║ ╚████║╚██████╔╝
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝      ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚═════╝

    LXR Core - Mining

    A pickaxe against a vein, a pan in a gravel bar. Veins are points with a
    weighted table of what is in the rock and a stock of charges that comes
    back with time — the server keeps the stock, so a rich vein is rich for
    the whole server, not for each client that looks at it. Everything that
    comes out is a core catalog material, sold on the general store's shelf.

    Brand:       LXRCore — Lux Empire eXperience RedM Core
    Product:     wolves.land / The Land of Wolves
    Developer:   iBoss21 / LXRCore
    Website:     https://www.lxrcore.com
    Discord:     https://discord.gg/GAhk8cgXe9
    GitHub:      https://github.com/LXRCore

    Version: 3.0.0
    Performance Target: 0.00 ms idle (interact points; one 60 s regeneration tick on the server)

    © 2026 iBoss21 / LXRCore | lxrcore.com | All Rights Reserved
]]

Config = Config or {}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ LANGUAGE ██████████████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████
Config.Lang = 'en'

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ ORE TABLES ════════════════════════════════════════════
-- ████████████████████████████████████████████████████████████████████████████████
-- weight is relative; amount is min..max per swing. `nothing` is the weight of an empty swing.
Config.Tables = {
    coal   = { nothing = 2, { item = 'coal', weight = 8, min = 1, max = 3 }, { item = 'stone', weight = 3, min = 1, max = 2 }, { item = 'iron_ore', weight = 2, min = 1, max = 1 } },
    iron   = { nothing = 2, { item = 'iron_ore', weight = 7, min = 1, max = 2 }, { item = 'stone', weight = 4, min = 1, max = 2 }, { item = 'coal', weight = 2, min = 1, max = 1 }, { item = 'copper_ore', weight = 1, min = 1, max = 1 } },
    copper = { nothing = 2, { item = 'copper_ore', weight = 6, min = 1, max = 2 }, { item = 'lead_ore', weight = 3, min = 1, max = 2 }, { item = 'stone', weight = 3, min = 1, max = 2 } },
    silver = { nothing = 4, { item = 'silver_ore', weight = 3, min = 1, max = 1 }, { item = 'lead_ore', weight = 4, min = 1, max = 2 }, { item = 'stone', weight = 4, min = 1, max = 2 }, { item = 'gold_ore', weight = 1, min = 1, max = 1 } },
    cave   = { nothing = 3, { item = 'saltpeter', weight = 4, min = 1, max = 2 }, { item = 'sulfur', weight = 3, min = 1, max = 2 }, { item = 'stone', weight = 4, min = 1, max = 3 } },
    gravel = { nothing = 6, { item = 'gold_dust', weight = 4, min = 1, max = 2 }, { item = 'gold_nugget', weight = 1, min = 1, max = 1 } },
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ MINES ═════════════════════════════════════════════════
-- ████████████████████████████████████████████████████████████████████████████████
-- each vein: a point, an ore table, charges (swings before it is worked out) and regenMinutes per charge
Config.Mines = {
    { id = 'annesburg', label = 'Annesburg Mine', blip = true, coords = vector3(2887.40, 1385.10, 66.70), veins = {
        { id = 'ann1', coords = vector3(2894.20, 1391.60, 66.90), table = 'coal', charges = 30, regenMinutes = 2 },
        { id = 'ann2', coords = vector3(2901.80, 1379.30, 67.10), table = 'coal', charges = 30, regenMinutes = 2 },
        { id = 'ann3', coords = vector3(2879.60, 1397.20, 66.40), table = 'iron', charges = 24, regenMinutes = 3 },
    } },
    { id = 'beryl', label = 'Beryl\'s Dream', blip = true, coords = vector3(-1462.30, 1330.60, 232.50), veins = {
        { id = 'ber1', coords = vector3(-1468.90, 1336.20, 232.80), table = 'iron', charges = 24, regenMinutes = 3 },
        { id = 'ber2', coords = vector3(-1455.10, 1324.70, 233.10), table = 'copper', charges = 20, regenMinutes = 4 },
    } },
    { id = 'gaptooth', label = 'Gaptooth Breach', blip = true, coords = vector3(-4033.80, -2934.10, -14.20), veins = {
        { id = 'gap1', coords = vector3(-4040.20, -2928.60, -13.90), table = 'silver', charges = 16, regenMinutes = 6 },
        { id = 'gap2', coords = vector3(-4027.50, -2941.30, -14.40), table = 'silver', charges = 16, regenMinutes = 6 },
        { id = 'gap3', coords = vector3(-4048.90, -2939.80, -14.60), table = 'copper', charges = 20, regenMinutes = 4 },
    } },
    { id = 'roanoke', label = 'Roanoke cave', blip = false, coords = vector3(2432.70, 1147.40, 79.20), veins = {
        { id = 'roa1', coords = vector3(2437.10, 1152.80, 79.40), table = 'cave', charges = 20, regenMinutes = 4 },
    } },
}

-- gravel bars for the pan (per-player cooldown, the water never runs out)
Config.Pans = {
    { id = 'dakota', label = 'Dakota River bar', coords = vector3(-150.60, 620.30, 108.40), table = 'gravel' },
    { id = 'kamassa', label = 'Kamassa gravel', coords = vector3(2007.20, -1108.60, 41.80), table = 'gravel' },
    { id = 'sanluis', label = 'San Luis bank', coords = vector3(-4870.40, -3210.90, -11.60), table = 'gravel' },
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ THE WORK ══════════════════════════════════════════════
-- ████████████████████████████████████████████████████████████████████████████████
Config.Work = {
    pick = 'pickaxe', pickWear = 1, swingMs = 6000, swingScenario = 'WORLD_HUMAN_PICKAXE_WALL',
    pan = 'gold_pan', panWear = 1, panMs = 8000, panCooldownMs = 20000, panScenario = 'WORLD_HUMAN_CROUCH_INSPECT',
}
Config.Security = { rateLimit = { windowMs = 2000, burst = 4 }, maxDistance = 3.5, promptDistance = 2.0 }
Config.Debug = { printBanner = true, log = false }
