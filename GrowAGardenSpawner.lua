
-- Grow a Garden Auto-Spawner Script (Educational Use Only)
-- Simulates planting items in the player's garden every few seconds

print("[Delta Script] Grow a Garden Spawner Loaded")

-- SETTINGS
local spawnDelay = 3 -- Seconds between spawns
local maxPlants = 10 -- Optional cap for how many to spawn

-- UTILITIES
local function createFakePlant()
    local plant = Instance.new("Part")
    plant.Size = Vector3.new(2, 2, 2)
    plant.Anchored = true
    plant.Shape = Enum.PartType.Ball
    plant.BrickColor = BrickColor.new("Bright green")
    plant.Material = Enum.Material.Grass
    plant.Name = "DeltaPlant"
    return plant
end

-- MAIN SPAWN FUNCTION
local function spawnPlantLoop()
    local player = game.Players.LocalPlayer
    local char = player and player.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")

    if not root then
        warn("Could not find player or character root part.")
        return
    end

    local gardenArea = workspace:FindFirstChild("Garden") or workspace -- adjust if the game has a 'Garden' model

    local count = 0
    while count < maxPlants do
        local plant = createFakePlant()
        plant.Position = root.Position + Vector3.new(math.random(-5, 5), 1, math.random(-5, 5))
        plant.Parent = gardenArea
        count += 1
        print("[Delta] Spawned plant #" .. count)
        wait(spawnDelay)
    end

    print("[Delta] Finished spawning.")
end

spawnPlantLoop()
