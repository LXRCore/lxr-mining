--[[ ═══════════════════════════════════════════════════════════════════════════
     LXR-MINING — Client: the veins and the bars, the swing, the vein card
     © 2026 iBoss21 / LXRCore — All Rights Reserved
     ═══════════════════════════════════════════════════════════════════════════ ]]

local LXRCore = exports['lxr-core']:GetCoreObject()
local LXR = exports['lxr-core']:GetLXR()
local M = LXRMining
local N = Citizen.InvokeNative
local busy, nearVein = false, nil
local veins = M.Veins()

local function toast(key, kind, vars) LXRCore.Notify(Lang:t(key, vars), kind or 'info') end
local function page(action, payload) SendNUIMessage({ action = action, payload = payload, brand = LXRCore.Brand, lang = Config.Lang, locale = Lang.bundle() }) end
local function work(scenario, ms)
    busy = true
    local ped = PlayerPedId()
    N(0x524B54361229154F, ped, joaat(scenario), ms, true, false, false, false)
    Wait(ms)
    ClearPedTasks(ped)
    busy = false
end
local function mineOf(v) for _, m in ipairs(Config.Mines) do if m.id == v.mine then return m end end end
local function card(v)
    local m = mineOf(v)
    page('show', { id = v.id, mine = m and m.label or v.mine, table = v.table, left = GlobalState['mine:' .. v.id] or v.charges, charges = v.charges })
end
local function report(res)
    if not res.found then return toast('info.nothing', 'info') end
    if res.heavy then return toast('error.heavy', 'warning', { label = res.label }) end
    toast('info.found', 'success', { amount = res.amount, label = res.label })
end

local function swing(v)
    if busy then return end
    work(Config.Work.swingScenario, Config.Work.swingMs)
    local ok, res, extra = LXR.RPC.Server('lxr-mining:swing', v.id)
    if not ok then return toast('error.' .. tostring(res), 'error', { label = extra }) end
    report(res)
    if nearVein == v.id then card(v) end
end
local function pan(p)
    if busy then return end
    work(Config.Work.panScenario, Config.Work.panMs)
    local ok, res, extra = LXR.RPC.Server('lxr-mining:pan', p.id)
    if not ok then return toast('error.' .. tostring(res), 'error', { label = extra }) end
    report(res)
end

CreateThread(function()
    while GetResourceState('lxr-interact') ~= 'started' do Wait(1000) end
    for id, v in pairs(veins) do
        exports['lxr-interact']:AddPoint('lxr-mining:' .. id, v.coords, { label = Lang:t('table.' .. v.table), distance = Config.Security.promptDistance, options = {
            { label = Lang:t('ui.swing'), key = 'J', item = Config.Work.pick, canInteract = function() return not busy and (GlobalState['mine:' .. id] or 1) > 0 end, onSelect = function() swing(v) end },
        }})
    end
    for _, p in ipairs(Config.Pans) do
        exports['lxr-interact']:AddPoint('lxr-mining:pan:' .. p.id, p.coords, { label = p.label, distance = Config.Security.promptDistance, options = {
            { label = Lang:t('ui.pan'), key = 'J', item = Config.Work.pan, canInteract = function() return not busy end, onSelect = function() pan(p) end },
        }})
    end
    for _, m in ipairs(Config.Mines) do
        if m.blip then
            local b = N(0x554D9D53F696D002, 1664425300, m.coords.x, m.coords.y, m.coords.z)
            if b and b ~= 0 then N(0x74F74D3207ED525C, b, joaat('blip_mine'), true) if GetResourceState('lxr-mapcolor') == 'started' then pcall(function() N(0x662D364ABF16DE2F, b, exports['lxr-mapcolor']:modifier('craft')) end) end N(0x9CB1A1623062F402, b, m.label) end
        end
    end
end)

-- the vein card follows the nearest vein
CreateThread(function()
    while true do
        if LocalPlayer.state.isLoggedIn then
            local pos = GetEntityCoords(PlayerPedId())
            local best, bestD = nil, Config.Security.promptDistance + 1.5
            for id, v in pairs(veins) do
                local d = #(pos - v.coords)
                if d < bestD then best, bestD = id, d end
            end
            if best ~= nearVein then nearVein = best if best then card(veins[best]) else page('hide') end end
        end
        Wait(1000)
    end
end)
AddStateBagChangeHandler(nil, 'global', function(_, key, value)
    local id = key:match('^mine:(.+)$')
    if id and id == nearVein and veins[id] then card(veins[id]) end
end)

AddEventHandler('onResourceStop', function(res) if res == GetCurrentResourceName() then for id in pairs(veins) do exports['lxr-interact']:Remove('lxr-mining:' .. id) end for _, p in ipairs(Config.Pans) do exports['lxr-interact']:Remove('lxr-mining:pan:' .. p.id) end end end)
exports('Busy', function() return busy end)
