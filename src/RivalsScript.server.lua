-- Rivals Script for Roblox

local Players = game:GetService("Players")

-- Function to create a rival
local function createRival(player)
    -- Create a new rival for the player
    local rival = Instance.new("Model")
    rival.Name = "Rival"
    rival.Parent = player.Character
    
    -- Add a part to represent the rival
    local rivalPart = Instance.new("Part")
    rivalPart.Name = "RivalPart"
    rivalPart.Size = Vector3.new(4, 6, 2)
    rivalPart.Position = player.Character.HumanoidRootPart.Position + Vector3.new(0, 0, 10)
    rivalPart.Anchored = true
    rivalPart.CanCollide = true
    rivalPart.Parent = rival
    
    -- Add a humanoid to the rival
    local rivalHumanoid = Instance.new("Humanoid")
    rivalHumanoid.Name = "RivalHumanoid"
    rivalHumanoid.Parent = rival
    
    -- Add a simple mesh to represent the rival
    local rivalMesh = Instance.new("SpecialMesh")
    rivalMesh.MeshType = Enum.MeshType.Head
    rivalMesh.Scale = Vector3.new(2, 2, 2)
    rivalMesh.Parent = rivalPart

    -- Function to make the rival follow the player
    local function followPlayer()
        while true do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                rivalPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 10)
            end
            wait(0.1)
        end
    end
    
    -- Start following the player
    coroutine.wrap(followPlayer)()
end

-- Function to handle player added
local function onPlayerAdded(player)
    -- Create a rival for the player
    createRival(player)
end

-- Connect the player added event
Players.PlayerAdded:Connect(onPlayerAdded)

-- Handle existing players
for _, player in ipairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end