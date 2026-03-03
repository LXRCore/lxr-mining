# 🐺 LXR-Mining — The Land of Wolves

> **LXR-Mining** is an immersive, multi-framework mining system for **RedM**.  
> Players mine raw ore at designated quarry locations, then sell their haul through a fully configurable vendor NPC.  
> Built for [The Land of Wolves](https://www.wolves.land) by **iBoss21 / The Lux Empire**.

![Version](https://img.shields.io/badge/Version-1.0.0-brightgreen)
![Build](https://img.shields.io/badge/Build-Stable-blue)
![Framework](https://img.shields.io/badge/Framework-LXR--Core%20%7C%20RSG--Core%20%7C%20VORP-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Platform](https://img.shields.io/badge/Platform-RedM-black)
![Made by iBoss21](https://img.shields.io/badge/Made%20with%20%E2%9D%A4%EF%B8%8F%20by-iBoss21-blue)

---

## ✨ Features

- **Interactive Mining** — Mine at 24+ pre-configured quarry locations using a pickaxe.
- **Random Resource Drops** — Configurable min/max quantities per resource (iron, copper, gold, coal).
- **Vendor NPC** — Buy pickaxes and sell mined ore through a spawned NPC at the mine HQ.
- **Zone Refresh** — Mining zones reset automatically after a configurable timer.
- **Multi-Framework** — Supports LXR-Core, RSG-Core, VORP Core, RedEM:RP, QBR-Core, QR-Core, and Standalone.
- **Resource Name Guard** — Boot-time check prevents misnamed resource folders from silently breaking the script.
- **Startup Banner** — Branded boot print confirms the resource is loaded correctly.

---

## 🔧 Framework Support

| Framework    | Status         |
|--------------|----------------|
| LXR-Core     | ✅ Primary      |
| RSG-Core     | ✅ Primary      |
| VORP Core    | ✅ Supported    |
| RedEM:RP     | ⚙️ Optional    |
| QBR-Core     | ⚙️ Optional    |
| QR-Core      | ⚙️ Optional    |
| Standalone   | 🔄 Fallback    |

Set `Config.Framework = 'auto'` in `config.lua` for automatic detection, or hard-code the framework name.

---

## 🛠️ Installation

1. Place the `lxr-mining` folder inside your `[lxr]` (or equivalent) resource directory.  
   > ⚠️ The folder **must** be named `lxr-mining` — a runtime check will throw an error otherwise.
2. Add the following to your `server.cfg`:

```bash
ensure lxr-core
ensure lxr-mining
```

3. Configure mining spots, vendor prices, and timers in `config.lua`.

---

## ⚙️ Configuration Highlights

```lua
-- Framework (auto-detected or manual)
Config.Framework = 'auto'

-- Mining duration & zone reset
Config.MiningTimer  = 20 * 1000       -- 20 seconds
Config.RefreshTimer = 30 * 60 * 1000  -- 30 minutes

-- Mine-entrance map blip
Config.MineCord = vector3(2789.1987, 1340.2327, 71.3155)

-- Random item drops per resource
Config.SmeltingItems = {
    iron   = { Min = 1, Max = 10 },
    copper = { Min = 1, Max = 10 },
    gold   = { Min = 1, Max = 10 },
    coal   = { Min = 1, Max = 10 }
}
```

---

## 📄 License

```
LXR Mining System
© 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved

This program is free software: you can redistribute it and/or modify
it under the terms of the MIT License.
```

---

Built with ❤️ for **The Land of Wolves** 🐺 | [wolves.land](https://www.wolves.land) · [Discord](https://discord.gg/CrKcWdfd3A) · [Store](https://theluxempire.tebex.io)

