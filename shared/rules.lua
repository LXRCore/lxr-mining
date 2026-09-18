--[[ ═══════════════════════════════════════════════════════════════════════════
     LXR-MINING — Shared rules: the roll, the veins, the regeneration
     © 2026 iBoss21 / LXRCore — All Rights Reserved
     ═══════════════════════════════════════════════════════════════════════════ ]]

LXRMining = LXRMining or {}
local M = LXRMining

---Weighted roll on an ore table. rnd(n) → 1..n. Returns item, amount or nil for an empty swing.
function M.Roll(tableId, rnd)
    local t = Config.Tables[tableId]
    if not t then return nil end
    rnd = rnd or math.random
    local total = t.nothing or 0
    for _, e in ipairs(t) do total = total + e.weight end
    if total <= 0 then return nil end
    local pick = rnd(total)
    if pick <= (t.nothing or 0) then return nil end
    pick = pick - (t.nothing or 0)
    for _, e in ipairs(t) do
        pick = pick - e.weight
        if pick <= 0 then return e.item, e.min + rnd(e.max - e.min + 1) - 1 end
    end
end

---Every vein, flattened, with its mine.
function M.Veins()
    local out = {}
    for _, m in ipairs(Config.Mines) do for _, v in ipairs(m.veins) do out[v.id] = { id = v.id, mine = m.id, coords = v.coords, table = v.table, charges = v.charges, regenMinutes = v.regenMinutes } end end
    return out
end

function M.Pan(id) for _, p in ipairs(Config.Pans) do if p.id == id then return p end end end

---Charges regained after `seconds` at the vein's rate (whole charges; the remainder is kept by the caller).
function M.Regen(vein, seconds)
    local per = vein.regenMinutes * 60
    if per <= 0 then return 0, 0 end
    return math.floor(seconds / per), seconds % per
end

---Every item any table can give.
function M.Items()
    local set, out = {}, {}
    for _, t in pairs(Config.Tables) do for _, e in ipairs(t) do set[e.item] = true end end
    for k in pairs(set) do out[#out + 1] = k end
    table.sort(out)
    return out
end
