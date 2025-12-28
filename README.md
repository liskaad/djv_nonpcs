# DJV No-NPCs

A simple FiveM script that removes all NPCs from the map.

## Author
**DJV SCRIPTS|Dejvøxツ**

## Features
- Removes all scenario peds (random walking NPCs)
- Disables vehicle generators
- Removes parked vehicles with NPCs
- Configurable density multipliers
- Lightweight and optimized

## Installation

1. Download the script
2. Place `djv_nonpcs` folder in your server's `resources` folder
3. Add `ensure djv_nonpcs` to your `server.cfg`
4. Restart your server

## Configuration

Edit `config.lua` to customize the script:

```lua
Config.Enabled = true              -- Enable or disable the script
Config.RemoveScenarioPeds = true   -- Remove random peds
Config.DisableVehicleGenerators = true -- Disable vehicle spawns
Config.PedDensity = 0.0           -- Ped density (0.0 = none, 1.0 = normal)
Config.VehicleDensity = 0.0       -- Vehicle density (0.0 = none, 1.0 = normal)
Config.RemoveScenarios = true     -- Remove scenario types
```

## License

This project is licensed under the MIT License.

## Support

For issues or questions, visit: https://github.com/liskaad/djv_nonpcs

---

Made with ❤️ by DJV SCRIPTS|Dejvøxツ
