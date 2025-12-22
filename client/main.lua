-- DJV No-NPCs Script
-- Removes all NPCs from the map
-- Author: Dejvøxツ

if not Config.Enabled then
    return
end

local scenarioTypes = {
    'WORLD_VEHICLE_ATTRACTOR',
    'WORLD_VEHICLE_AMBULANCE',
    'WORLD_VEHICLE_BICYCLE_BMX',
    'WORLD_VEHICLE_BICYCLE_BMX_BALLAS',
    'WORLD_VEHICLE_BICYCLE_MOUNTAIN',
    'WORLD_VEHICLE_BICYCLE_ROAD',
    'WORLD_VEHICLE_BIKE_OFF_ROAD_RACE',
    'WORLD_VEHICLE_BIKER',
    'WORLD_VEHICLE_BOAT_IDLE',
    'WORLD_VEHICLE_BOAT_IDLE_ALAMO',
    'WORLD_VEHICLE_BOAT_IDLE_MARQUIS',
    'WORLD_VEHICLE_BOAT_IDLE_MARQUIS',
    'WORLD_VEHICLE_BROKEN_DOWN',
    'WORLD_VEHICLE_BUSINESSMEN',
    'WORLD_VEHICLE_HELI_LIFEGUARD',
    'WORLD_VEHICLE_CLUCKIN_BELL_TRAILER',
    'WORLD_VEHICLE_CONSTRUCTION_SOLO',
    'WORLD_VEHICLE_CONSTRUCTION_PASSENGERS',
    'WORLD_VEHICLE_DRIVE_PASSENGERS',
    'WORLD_VEHICLE_DRIVE_PASSENGERS_LIMITED',
    'WORLD_VEHICLE_DRIVE_SOLO',
    'WORLD_VEHICLE_FARM_WORKER',
    'WORLD_VEHICLE_FIRE_TRUCK',
    'WORLD_VEHICLE_EMPTY',
    'WORLD_VEHICLE_MARIACHI',
    'WORLD_VEHICLE_MECHANIC',
    'WORLD_VEHICLE_MILITARY_PLANES_BIG',
    'WORLD_VEHICLE_MILITARY_PLANES_SMALL',
    'WORLD_VEHICLE_PARK_PARALLEL',
    'WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN',
    'WORLD_VEHICLE_PASSENGER_EXIT',
    'WORLD_VEHICLE_POLICE_BIKE',
    'WORLD_VEHICLE_POLICE_CAR',
    'WORLD_VEHICLE_POLICE',
    'WORLD_VEHICLE_POLICE_NEXT_TO_CAR',
    'WORLD_VEHICLE_QUARRY',
    'WORLD_VEHICLE_SALTON',
    'WORLD_VEHICLE_SALTON_DIRT_BIKE',
    'WORLD_VEHICLE_SECURITY_CAR',
    'WORLD_VEHICLE_STREETRACE',
    'WORLD_VEHICLE_TOURBUS',
    'WORLD_VEHICLE_TOURIST',
    'WORLD_VEHICLE_TANDL',
    'WORLD_VEHICLE_TRACTOR',
    'WORLD_VEHICLE_TRACTOR_BEACH',
    'WORLD_VEHICLE_TRUCK_LOGS',
    'WORLD_VEHICLE_TRUCKS_TRAILERS',
    'WORLD_VEHICLE_DISTANT_EMPTY_GROUND'
}

Citizen.CreateThread(function()
    -- Set density multipliers
    SetPedDensityMultiplierThisFrame(Config.PedDensity)
    SetScenarioPedDensityMultiplierThisFrame(Config.PedDensity, Config.PedDensity)
    SetVehicleDensityMultiplierThisFrame(Config.VehicleDensity)
    SetRandomVehicleDensityMultiplierThisFrame(Config.VehicleDensity)
    SetParkedVehicleDensityMultiplierThisFrame(Config.VehicleDensity)

    -- Remove scenario peds
    if Config.RemoveScenarioPeds then
        SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
    end

    -- Disable vehicle generators
    if Config.DisableVehicleGenerators then
        SetVehicleDensityMultiplierThisFrame(0.0)
        SetRandomVehicleDensityMultiplierThisFrame(0.0)
        SetParkedVehicleDensityMultiplierThisFrame(0.0)
    end

    -- Remove scenarios
    if Config.RemoveScenarios then
        for _, scenario in ipairs(scenarioTypes) do
            SetScenarioTypeEnabled(scenario, false)
        end
    end
end)

-- Main loop to keep NPCs removed
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        -- Set density to 0
        SetPedDensityMultiplierThisFrame(Config.PedDensity)
        SetScenarioPedDensityMultiplierThisFrame(Config.PedDensity, Config.PedDensity)
        SetVehicleDensityMultiplierThisFrame(Config.VehicleDensity)
        SetRandomVehicleDensityMultiplierThisFrame(Config.VehicleDensity)
        SetParkedVehicleDensityMultiplierThisFrame(Config.VehicleDensity)

        -- Disable distant ped and vehicle creation
        SetCreateRandomCops(false)
        SetCreateRandomCopsNotOnScenarios(false)
        SetCreateRandomCopsOnScenarios(false)

        -- Remove garbage trucks
        SetGarbageTrucks(false)

        -- Disable random boats
        SetRandomBoats(false)
    end
end)

print('^2[DJV No-NPCs]^7 Script loaded successfully!')
