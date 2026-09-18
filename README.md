<img src="https://raw.githubusercontent.com/LXRCore/.github/main/profile/lxrcore-logo.png" alt="LXRCore" width="72" align="left" style="margin-right:12px">

# lxr-mining — Pick and pan, for LXRCore

A pickaxe against a vein, a pan in a gravel bar. Veins carry a stock of
charges the server keeps and regenerates with time, so a rich vein is rich
for everyone and a worked-out one is worked out for everyone. What comes
out of the rock is the core catalog's ore, stone, coal, saltpeter and
sulfur — and gold dust from the rivers — sold on the general store's shelf.

![The vein card](docs/img/vein.png)

## What it does

* **Veins** — points under `Config.Mines`, each with an ore table
  (`Config.Tables`: weighted entries plus a `nothing` weight), `charges`
  and `regenMinutes` per charge. Stock is published as
  `GlobalState['mine:<id>']` so prompts and cards agree everywhere.
* **Swing** — the `pickaxe` (wears by `pickWear`), the game's pickaxe
  scenario, one roll per swing.
* **Pan** — gravel bars in `Config.Pans` with the `gold_pan`; per-player
  cooldown, the water never runs out.
* **The card** — nearest vein on the LXR UI Kit: mine, vein, stock meter.
* **Events** — `lxr:mining:found (src, veinOrBar, item, amount)`.

## Install

```cfg
ensure lxr-core
ensure lxr-interact
ensure lxr-mining
```

## API

| Name | Side | Purpose |
|---|---|---|
| `Veins()` | server | every vein's stock |
| `Refill(id)` | server | top a vein up |
| `Busy()` | client | is a swing or pan in progress |

## Licence

© 2026 iBoss21 / LXRCore — All Rights Reserved. See `LICENSE`.
