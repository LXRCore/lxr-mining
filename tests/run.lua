--[[ ═══════════════════════════════════════════════════════════════════════════
     LXR-MINING — Offline tests: tables map to the catalog, the roll, regeneration, locale parity
     Usage (from the lxr-mining folder):  lua tests/run.lua [--mock out.js en|ka]
     © 2026 iBoss21 / LXRCore — All Rights Reserved
     ═══════════════════════════════════════════════════════════════════════════ ]]

local CORE = os.getenv('LXR_CORE_PATH') or '../lxr-core'
package.path = CORE .. '/?.lua;' .. package.path
local ok = pcall(function() require('tests.lib.fxshim') end)
if not ok then print('lxr-core shim not found at ' .. CORE) os.exit(2) end
local Shim = require('tests.lib.fxshim')
for _, f in ipairs({ 'shared/main.lua', 'shared/locale.lua', 'locales/en.lua', 'config.lua', 'shared/catalog.lua', 'shared/items.lua', 'shared/prices.lua' }) do Shim.load(CORE .. '/' .. f) end
Config = nil Locale = nil
Shim.load('shared/locale.lua') Shim.load('locales/en.lua') Shim.load('locales/ka.lua') Shim.load('config.lua') Shim.load('shared/rules.lua')
local M = LXRMining

local passed, failed = 0, 0
local function test(name, fn) local okT, err = xpcall(fn, debug.traceback) if okT then passed = passed + 1 print('  ^ ok   ' .. name) else failed = failed + 1 print('  x FAIL ' .. name .. '\n' .. err) end end
local function eq(a, b, msg) if a ~= b then error((msg or 'eq') .. ': expected ' .. tostring(b) .. ' got ' .. tostring(a), 2) end end

print('lxr-mining offline tests')
test('every table entry is a catalog item; every vein and bar names a table; ids are unique', function()
    for _, item in ipairs(M.Items()) do assert(LXRShared.Items[item], item) end
    for id, t in pairs(Config.Tables) do assert(Locale.Bundles.en['table.' .. id], 'label for ' .. id) for _, e in ipairs(t) do assert(e.weight > 0 and e.min >= 1 and e.max >= e.min, id) end end
    local seen = {}
    for id, v in pairs(M.Veins()) do assert(Config.Tables[v.table], id) assert(v.charges > 0 and v.regenMinutes > 0, id) assert(not seen[id]) seen[id] = true end
    for _, p in ipairs(Config.Pans) do assert(Config.Tables[p.table], p.id) assert(M.Pan(p.id) == p) end
    assert(LXRShared.Items[Config.Work.pick] and LXRShared.Items[Config.Work.pan])
    assert(M.Pan('nowhere') == nil)
end)
test('the roll: empty swings, weighted picks, amounts in range', function()
    assert(M.Roll('coal', function(n) return 1 end) == nil, 'first slot is the empty swing')
    local item, n = M.Roll('coal', function(n) return n end)
    eq(item, 'iron_ore', 'the last entry at rnd=max') eq(n, 1)
    local it2, n2 = M.Roll('coal', function(n) return 3 end)
    eq(it2, 'coal') eq(n2, Config.Tables.coal[1].min + 2)
    assert(M.Roll('nothing_here') == nil)
    -- every roll lands on the table or nothing
    for i = 1, 200 do local it = M.Roll('silver') if it then assert(LXRShared.Items[it]) end end
end)
test('regeneration is whole charges with the remainder carried', function()
    local v = { regenMinutes = 2 }
    local n, rest = M.Regen(v, 60) eq(n, 0) eq(rest, 60)
    n, rest = M.Regen(v, 250) eq(n, 2) eq(rest, 10)
    eq(M.Regen({ regenMinutes = 0 }, 999), 0)
end)
test('locale parity', function()
    local en, ka = Locale.Bundles.en, Locale.Bundles.ka
    local missing = {}
    for k in pairs(en) do if ka[k] == nil then missing[#missing + 1] = k end end
    eq(#missing, 0, 'ka missing: ' .. table.concat(missing, ', '))
end)
print(('%d passed, %d failed'):format(passed, failed))
if arg and arg[1] == '--mock' and arg[2] then
    Config.Lang = arg[3] or 'en'
    local f = assert(io.open(arg[2], 'w'))
    f:write('window.__LXR_MOCK__ = ' .. json.encode({ action = 'show', payload = { id = 'gap1', mine = 'Gaptooth Breach', table = 'silver', left = 5, charges = 16 }, lang = Config.Lang, locale = Lang.bundle(), brand = { name = 'The Land of Wolves', theme = 'night' } }) .. ';\n')
    f:close()
    print('mock written to ' .. arg[2])
end
os.exit(failed == 0 and 0 or 1)
