Config = {}

-- Key Configurations for Actions
Config.Keys = {
    Action = 0xCEFD9220,   -- Key 'E' for action
    Interact = 0xF3830D8E  -- Key 'J' for interaction
}

-- Timer Configurations
Config.MiningTimer = 20 * 1000        -- 20 seconds mining timer
Config.RefreshTimer = 30 * 6000       -- 30 minutes reset timer for mining locations

-- Mining Headquarters Coordinates
Config.MineCord = vector3(2789.1987, 1340.2327, 71.3155) -- Mining HQ

-- Items Obtained from Mining
Config.SmeltingItems = {               -- Min and Max define random item quantity generated after mining ends
    ['iron']   = { Min = 1, Max = 10 },
    ['copper'] = { Min = 1, Max = 10 },
    ['gold']   = { Min = 1, Max = 10 },
    ['coal']   = { Min = 1, Max = 10 }
}

-- Mining Locations (Multiple Coordinates for Mining Points)
Config.MiningLocations = {
    { coords = vector3(2747.63, 1388.7, 69.01) },  -- Upper East Quarry
    { coords = vector3(2746.66, 1379.09, 68.55) }, -- Upper Central Quarry
    { coords = vector3(2724.04, 1388.7, 68.82) },  -- Lower East Quarry
    { coords = vector3(2727.67, 1385.56, 69.22) }, -- Lower Central Quarry
    { coords = vector3(2723.16, 1375.39, 68.89) }, -- Lower South Quarry
    { coords = vector3(2743.93, 1385.92, 68.7) },  -- Central Quarry Entrance
    { coords = vector3(2760.84, 1402.35, 68.74) }, -- Northern Quarry
    { coords = vector3(2760.91, 1395.98, 68.7) },  -- North Central Quarry
    { coords = vector3(2771.02, 1382.77, 67.98) }, -- North West Quarry
    { coords = vector3(2763.33, 1376.24, 67.83) }, -- Western Quarry
    { coords = vector3(2754.61, 1358.63, 68.17) }, -- South West Quarry
    { coords = vector3(2752.92, 1368.36, 67.8) },  -- South Central Quarry
    { coords = vector3(2758.53, 1379.4, 68.24) },  -- Mid Western Quarry
    { coords = vector3(2757.53, 1382.55, 68.2) },  -- Central Quarry
    { coords = vector3(2747.99, 1382.55, 68.61) }, -- Central Quarry East
    { coords = vector3(2747.38, 1391.84, 68.76) }, -- Central Quarry North
    { coords = vector3(2761.37, 1390.62, 68.71) }, -- North Central Quarry
    { coords = vector3(2759.16, 1408.6, 68.5) },   -- Upper Northern Quarry
    { coords = vector3(2728.11, 1329.45, 69.62) }, -- Far South Quarry
    { coords = vector3(2731.87, 1332.42, 69.64) }, -- South Eastern Quarry
    { coords = vector3(2716.82, 1308.1, 69.78) },  -- Deep South Quarry
    { coords = vector3(2712.96, 1308.03, 69.77) }, -- South West Entrance Quarry
    { coords = vector3(2716.45, 1313.86, 69.73) }, -- South West Quarry
    { coords = vector3(2746.23, 1366.28, 68.42) }  -- Mid Central Quarry
}

-- Config for Item Collection and Selling
Config.CollectItems = true -- If true, allows players to sell matching items in their inventory all at once.

-- Pedestrians (NPCs) Configuration for Selling and Buying Items
Config.Peds = {
    Miners = { 
        Label = 'Miners', 
        Hash = 1543787725, 
        Coords = vector4(2789.31, 1336.87, 71.35, 9.15), -- Mining HQ Ped
        
        -- Items that the ped will buy from players with their price
        Items = {
            ['iron']   = 100,
            ['copper'] = 150,
            ['gold']   = 200,
            ['coal']   = 250
        },
        
        -- Items that the ped will sell to players with their price
        BuyableItems = {
            ['pickaxe'] = 100
        }
    }
}
