Config = {}

-- Key Bindings (Customizable actions for player interaction)
Config.Keys = {
    Action   = 0xCEFD9220, -- 'E' key for action
    Interact = 0xF3830D8E  -- 'J' key for interaction
}

-- Timer Settings (Mining and refresh times in milliseconds)
Config.Timers = {
    Mining    = 20 * 1000,   -- 20 seconds mining duration
    Refresh   = 30 * 60 * 1000 -- 30 minutes for resetting mining spots
}

-- Mining Headquarters Coordinates (NPC or base)
Config.Headquarters = {
    MineHQ = vector3(2789.1987, 1340.2327, 71.3155) -- Mining HQ coordinates
}

-- Smelting Items (Min/Max to define random item quantities for each resource after mining)
Config.SmeltingItems = {
    iron   = { min = 1, max = 10 },
    copper = { min = 1, max = 10 },
    gold   = { min = 1, max = 10 },
    coal   = { min = 1, max = 10 }
}

-- Mining Locations (Each location with a name, coordinates, and radius for mining interaction)
Config.MiningLocations = {
    { name = "Upper East Quarry", coords = vector3(2747.63, 1388.7, 69.01), radius = 5.0 },
    { name = "Upper Central Quarry", coords = vector3(2746.66, 1379.09, 68.55), radius = 5.0 },
    { name = "Lower East Quarry", coords = vector3(2724.04, 1388.7, 68.82), radius = 5.0 },
    { name = "Lower Central Quarry", coords = vector3(2727.67, 1385.56, 69.22), radius = 5.0 },
    { name = "Lower South Quarry", coords = vector3(2723.16, 1375.39, 68.89), radius = 5.0 },
    { name = "Central Quarry Entrance", coords = vector3(2743.93, 1385.92, 68.7), radius = 5.0 },
    { name = "Northern Quarry", coords = vector3(2760.84, 1402.35, 68.74), radius = 5.0 },
    { name = "North Central Quarry", coords = vector3(2760.91, 1395.98, 68.7), radius = 5.0 },
    { name = "North West Quarry", coords = vector3(2771.02, 1382.77, 67.98), radius = 5.0 },
    { name = "Western Quarry", coords = vector3(2763.33, 1376.24, 67.83), radius = 5.0 },
    { name = "South West Quarry", coords = vector3(2754.61, 1358.63, 68.17), radius = 5.0 },
    { name = "South Central Quarry", coords = vector3(2752.92, 1368.36, 67.8), radius = 5.0 },
    { name = "Mid Western Quarry", coords = vector3(2758.53, 1379.4, 68.24), radius = 5.0 },
    { name = "Central Quarry", coords = vector3(2757.53, 1382.55, 68.2), radius = 5.0 },
    { name = "Central Quarry East", coords = vector3(2747.99, 1382.55, 68.61), radius = 5.0 },
    { name = "Central Quarry North", coords = vector3(2747.38, 1391.84, 68.76), radius = 5.0 },
    { name = "North Central Quarry", coords = vector3(2761.37, 1390.62, 68.71), radius = 5.0 },
    { name = "Upper Northern Quarry", coords = vector3(2759.16, 1408.6, 68.5), radius = 5.0 },
    { name = "Far South Quarry", coords = vector3(2728.11, 1329.45, 69.62), radius = 5.0 },
    { name = "South Eastern Quarry", coords = vector3(2731.87, 1332.42, 69.64), radius = 5.0 },
    { name = "Deep South Quarry", coords = vector3(2716.82, 1308.1, 69.78), radius = 5.0 },
    { name = "South West Entrance Quarry", coords = vector3(2712.96, 1308.03, 69.77), radius = 5.0 },
    { name = "South West Quarry", coords = vector3(2716.45, 1313.86, 69.73), radius = 5.0 },
    { name = "Mid Central Quarry", coords = vector3(2746.23, 1366.28, 68.42), radius = 5.0 }
}

-- Collection and Selling Configuration (Allows bulk selling of collected items)
Config.CollectItems = true  -- If true, players can sell items in bulk

-- NPC Configuration (Pedestrians for selling and buying items)
Config.Peds = {
    Miners = {
        Label  = 'Mining Vendor',  -- NPC label for miners
        Hash   = 1543787725,       -- NPC model hash
        Coords = vector4(2789.31, 1336.87, 71.35, 9.15),  -- NPC position at Mining HQ
        
        -- Items that the NPC will buy from players and their prices
        Items = {
            iron   = 100,
            copper = 150,
            gold   = 200,
            coal   = 250
        },
        
        -- Items that the NPC will sell to players and their prices
        BuyableItems = {
            pickaxe = 100  -- Players can purchase a pickaxe from the NPC
        }
    }
}
