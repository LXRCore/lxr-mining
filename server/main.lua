--[[ ═══════════════════════════════════════════════════════════════════════════
     LXR-MINING — Server: the stock in every vein
     © 2026 iBoss21 / LXRCore — All Rights Reserved
     ═══════════════════════════════════════════════════════════════════════════ ]]

local LXRCore = exports['lxr-core']:GetCoreObject()
local LXR = exports['lxr-core']:GetLXR()
local M = LXRMining
local RES = GetCurrentResourceName()
local veins = M.Veins()         -- id → def + left, carry
local panAt, buckets = {}, {}
for _, v in pairs(veins) do v.left, v.carry = v.charges, 0 end

local function limited(src)
    local b = buckets[src]
    local now = GetGameTimer()
    if not b or now - b.at > Config.Security.rateLimit.windowMs then b = { at = now, n = 0 } buckets[src] = b end
    b.n = b.n + 1
    return b.n > Config.Security.rateLimit.burst
end
local function player(src) return LXRCore.Functions.GetPlayer(src) end
local function near(src, c)
    local ped = GetPlayerPed(src)
    return ped ~= 0 and #(GetEntityCoords(ped) - vector3(c.x, c.y, c.z)) <= Config.Security.maxDistance
end
local function wear(src, name, by)
    local it = LXRCore.Inventory.GetItem(src, name)
    if not it then return false end
    local def = LXRShared.Items[name]
    if def and def.quality and it.slot then
        local info = {} for k, v in pairs(it.info or {}) do info[k] = v end
        info.durability = math.max(0, (tonumber(info.durability) or 100) - by)
        LXRCore.Inventory.SetMetadata(src, it.slot, info)
    end
    return true
end
local function publish(v) GlobalState['mine:' .. v.id] = v.left end
for _, v in pairs(veins) do publish(v) end

local function give(src, P, item, amount, why)
    if not item then return { found = false } end
    if not LXRCore.Inventory.CanCarry(src, item, amount) or not P.Functions.AddItem(item, amount, nil, nil, why) then return { found = true, item = item, label = LXRShared.Items[item].label, amount = amount, heavy = true } end
    return { found = true, item = item, label = LXRShared.Items[item].label, amount = amount }
end

LXR.RPC.Register('lxr-mining:swing', function(src, veinId)
    if limited(src) then return false, 'rate' end
    local P, v = player(src), veins[veinId]
    if not P or not v then return false, 'invalid' end
    if not near(src, v.coords) then return false, 'too_far' end
    if v.left <= 0 then return false, 'worked_out' end
    if LXRCore.Inventory.GetItemCount(src, Config.Work.pick) < 1 then return false, 'no_tool', LXRShared.Items[Config.Work.pick].label end
    v.left = v.left - 1
    publish(v)
    wear(src, Config.Work.pick, Config.Work.pickWear)
    local item, amount = M.Roll(v.table)
    local res = give(src, P, item, amount, 'mining:' .. v.id)
    res.left, res.charges = v.left, v.charges
    if item then LXRCore.Emit('lxr:mining:found', nil, src, v.id, item, amount) end
    return true, res
end)

LXR.RPC.Register('lxr-mining:pan', function(src, panId)
    if limited(src) then return false, 'rate' end
    local P, p = player(src), M.Pan(panId)
    if not P or not p then return false, 'invalid' end
    if not near(src, p.coords) then return false, 'too_far' end
    if GetGameTimer() - (panAt[src] or 0) < Config.Work.panCooldownMs then return false, 'soon' end
    if LXRCore.Inventory.GetItemCount(src, Config.Work.pan) < 1 then return false, 'no_tool', LXRShared.Items[Config.Work.pan].label end
    panAt[src] = GetGameTimer()
    wear(src, Config.Work.pan, Config.Work.panWear)
    local item, amount = M.Roll(p.table)
    local res = give(src, P, item, amount, 'mining:pan:' .. p.id)
    if item then LXRCore.Emit('lxr:mining:found', nil, src, p.id, item, amount) end
    return true, res
end)

CreateThread(function()
    local last = os.time()
    while true do
        Wait(60000)
        local now = os.time()
        local dt = now - last
        last = now
        for _, v in pairs(veins) do
            if v.left < v.charges then
                local n, rest = M.Regen(v, v.carry + dt)
                v.carry = rest
                if n > 0 then v.left = math.min(v.charges, v.left + n) publish(v) end
            else v.carry = 0 end
        end
    end
end)

AddEventHandler('playerDropped', function() panAt[source] = nil buckets[source] = nil end)
CreateThread(function() if Config.Debug.printBanner then local n = 0 for _ in pairs(veins) do n = n + 1 end print(('^1[lxr-mining]^7 v%s — %d mines, %d veins, %d gravel bars'):format(GetResourceMetadata(RES, 'version', 0), #Config.Mines, n, #Config.Pans)) end end)
exports('Veins', function() local out = {} for id, v in pairs(veins) do out[id] = { left = v.left, charges = v.charges, table = v.table, mine = v.mine } end return out end)
exports('Refill', function(id) local v = veins[id] if v then v.left = v.charges publish(v) return true end return false end)
