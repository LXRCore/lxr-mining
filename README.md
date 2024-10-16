# LXR-Mining ⛏️

**LXR-Mining** is an immersive and dynamic mining system for **LXRCore**, offering players the ability to mine, refine, and sell valuable resources in your RedM server. Built with customization in mind, LXR-Mining allows for easy setup and management of mining spots, processing stations, and sell points.

---

## Features ✨
- **Interactive Mining**: Players can mine at designated locations for various resources.
- **Resource Processing**: Take raw materials to a refinery to process them into valuable goods.
- **Customizable Locations**: Set up multiple mining and refinery points.
- **Integrated Economy**: Sell processed materials for in-game currency.
- **LXRCore Integration**: Seamless integration with the LXRCore framework.

---

## Installation 🛠️

1. **Download the script** and place it in the `[lxr]` directory of your server.
2. **Import** the `lxr-mining.sql` file into your database to set up mining resources and sell points.
3. **Configure** the mining spots, refinery locations, and selling points in `config.lua`.
4. **Add** the following to your `server.cfg`:

```bash
ensure lxr-core
ensure lxr-mining
```

---

## Configuration ⚙️

**LXR-Mining** is highly customizable. You can easily add or modify mining locations, resources, and selling prices by editing the `config.lua` file.

### Example Configuration:
```lua
Config = {}

-- Mining Locations
Config.MiningSpots = {
    { coords = vector3(-594.29, 2091.82, 131.57), radius = 5.0, resource = 'stone' },
    { coords = vector3(-602.45, 2096.58, 131.57), radius = 5.0, resource = 'iron' },
}

-- Refinery Locations
Config.RefinerySpots = {
    { coords = vector3(2945.58, 2783.95, 40.94), radius = 3.0 }
}

-- Selling Locations
Config.SellSpots = {
    { coords = vector3(-341.13, 767.98, 115.66), radius = 3.0 }
}

-- Resource Processing
Config.Resources = {
    ['stone'] = { refined = 'stone_refined', amount = 2 },
    ['iron'] = { refined = 'iron_refined', amount = 2 },
}

-- Sell Prices
Config.SellPrices = {
    ['stone_refined'] = 10,
    ['iron_refined'] = 25,
}
```

### How it works:
- **Mining**: Players can mine at specific locations and gather raw materials like stone or iron.
- **Refining**: Players must take their raw materials to a refinery location to process them into usable goods.
- **Selling**: Refined materials can then be sold at designated selling points for currency.

---

## Screenshots 📸
Coming soon! Stay tuned for visuals showcasing the exciting mining experience.

---

## License 📄

```
LXRCore Framework
Copyright (C) 2024

This program is free software: you can redistribute it and/or modify
it under the terms of the MIT License.
```

---

With **LXR-Mining**, your players can dig deep into RedM, mine precious resources, and build their wealth. Expand your server's economy and offer a rich experience with this immersive mining system!

