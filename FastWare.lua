-- FastWare V1 - Trap N Bang Ultimate Script
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local workspace = game:GetService("Workspace")
local runService = game:GetService("RunService")
local camera = workspace.CurrentCamera
local userInputService = game:GetService("UserInputService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local tweenService = game:GetService("TweenService")

-- Main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FastWareV1"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 999

-- Main Panel
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 420)
mainFrame.Position = UDim2.new(0, 20, 0, 20)
mainFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 10)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.Active = true

-- Panel Corner
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- Panel Stroke
local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(255, 100, 0)
stroke.Transparency = 0.3
stroke.Parent = mainFrame

-- Gradient
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 35)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 5, 15))
})
gradient.Rotation = 90
gradient.Parent = mainFrame

-- ================ HEADER ================
local headerFrame = Instance.new("Frame")
headerFrame.Size = UDim2.new(1, 0, 0, 60)
headerFrame.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
headerFrame.BackgroundTransparency = 0.2
headerFrame.BorderSizePixel = 0
headerFrame.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 12)
headerCorner.Parent = headerFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.7, 0)
title.Text = "FASTWARE V1"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextStrokeTransparency = 0.3
title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
title.Parent = headerFrame

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0.3, 0)
subtitle.Position = UDim2.new(0, 0, 0.7, 0)
subtitle.Text = "TRAP N BANG"
subtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
subtitle.BackgroundTransparency = 1
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 12
subtitle.Parent = headerFrame

-- ================ CONTENT ================
local contentFrame = Instance.new("ScrollingFrame")
contentFrame.Size = UDim2.new(1, -20, 1, -80)
contentFrame.Position = UDim2.new(0, 10, 0, 70)
contentFrame.BackgroundTransparency = 1
contentFrame.BorderSizePixel = 0
contentFrame.ScrollBarThickness = 5
contentFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 100, 0)
contentFrame.CanvasSize = UDim2.new(0, 0, 0, 450)
contentFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
contentFrame.Parent = mainFrame

-- Button creator function
local function createButton(name, text, yPos, color)
    color = color or Color3.fromRGB(60, 60, 70)
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 45)
    button.Position = UDim2.new(0, 0, 0, yPos)
    button.BackgroundColor3 = color
    button.BackgroundTransparency = 0.1
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 15
    button.Name = name
    button.Parent = contentFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = button
    
    return button
end

-- Create buttons
local ammoBtn = createButton("AmmoBtn", "🔫 INFINITE AMMO [OFF]", 0)
local espBtn = createButton("EspBtn", "👁️ ESP [OFF]", 55)
local moneyBtn = createButton("MoneyBtn", "💰 INFINITE MONEY [OFF]", 110)
local speedBtn = createButton("SpeedBtn", "⚡ SPEED BOOST [OFF]", 165)
local aimBtn = createButton("AimBtn", "🎯 AIM ASSIST [OFF]", 220)
local teleportBtn = createButton("TeleportBtn", "🌍 TELEPORT MENU", 275, Color3.fromRGB(100, 50, 150))
local settingsBtn = createButton("SettingsBtn", "⚙️ SETTINGS", 330, Color3.fromRGB(80, 80, 100))

-- Status display
local statusFrame = Instance.new("Frame")
statusFrame.Size = UDim2.new(1, 0, 0, 40)
statusFrame.Position = UDim2.new(0, 0, 0, 395)
statusFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
statusFrame.BackgroundTransparency = 0.3
statusFrame.BorderSizePixel = 0
statusFrame.Parent = contentFrame

local statusCorner = Instance.new("UICorner")
statusCorner.CornerRadius = UDim.new(0, 8)
statusCorner.Parent = statusFrame

local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(0.7, 0, 1, 0)
statusText.Position = UDim2.new(0, 10, 0, 0)
statusText.Text = "STATUS: READY"
statusText.TextColor3 = Color3.fromRGB(0, 255, 0)
statusText.BackgroundTransparency = 1
statusText.Font = Enum.Font.GothamBold
statusText.TextSize = 14
statusText.TextXAlignment = Enum.TextXAlignment.Left
statusText.Parent = statusFrame

local playerCount = Instance.new("TextLabel")
playerCount.Size = UDim2.new(0.3, -10, 1, 0)
playerCount.Position = UDim2.new(0.7, 0, 0, 0)
playerCount.Text = "👥 0"
playerCount.TextColor3 = Color3.fromRGB(255, 200, 100)
playerCount.BackgroundTransparency = 1
playerCount.Font = Enum.Font.GothamBold
playerCount.TextSize = 14
playerCount.TextXAlignment = Enum.TextXAlignment.Right
playerCount.Parent = statusFrame

-- ================ DRAGGABLE ================
local dragging = false
local dragInput, dragStart, startPos

headerFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

headerFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

userInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

-- ================ FEATURE STATES ================
local features = {
    infiniteAmmo = false,
    esp = false,
    infiniteMoney = false,
    speedBoost = false,
    aimAssist = false
}

local espObjects = {}
local moneyConnection = nil

-- ================ MONEY FINDER ================
local function findMoneyValues()
    local moneyValues = {}
    
    -- Search everywhere for money
    local searchFolders = {
        player,
        player:FindFirstChild("leaderstats"),
        player:FindFirstChild("Stats"),
        player:FindFirstChild("Data"),
        player:FindFirstChild("Values")
    }
    
    for _, folder in pairs(searchFolders) do
        if folder then
            for _, child in pairs(folder:GetChildren()) do
                if child:IsA("NumberValue") or child:IsA("IntValue") or child:IsA("DoubleValue") then
                    local name = child.Name:lower()
                    if name:find("cash") or name:find("money") or name:find("bal") or 
                       name:find("points") or name:find("coins") or name:find("credit") then
                        table.insert(moneyValues, child)
                        print("Found money:", child.Parent.Name .. "." .. child.Name, "=", child.Value)
                    end
                end
            end
        end
    end
    
    return moneyValues
end

-- ================ INFINITE MONEY ================
local function startMoneyLoop()
    local moneyValues = findMoneyValues()
    
    if #moneyValues == 0 then
        statusText.Text = "⚠️ NO MONEY FOUND"
        statusText.TextColor3 = Color3.fromRGB(255, 0, 0)
        return false
    end
    
    statusText.Text = "💰 FARMING " .. #moneyValues .. " SOURCES"
    statusText.TextColor3 = Color3.fromRGB(0, 255, 0)
    
    if moneyConnection then
        moneyConnection:Disconnect()
    end
    
    moneyConnection = runService.Heartbeat:Connect(function()
        if not features.infiniteMoney then
            if moneyConnection then
                moneyConnection:Disconnect()
                moneyConnection = nil
            end
            return
        end
        
        for _, moneyVal in pairs(moneyValues) do
            pcall(function()
                moneyVal.Value = moneyVal.Value + 1000
            end)
        end
    end)
    
    return true
end

-- ================ INFINITE AMMO ================
local function setupInfiniteAmmo()
    local character = player.Character or player.CharacterAdded:Wait()
    
    local function handleTool(tool)
        task.wait(0.1)
        -- Look for ammo in different places
        local ammo = tool:FindFirstChild("Ammo") or 
                    tool:FindFirstChild("CurrentAmmo") or 
                    tool:FindFirstChild("AmmoCount") or
                    tool:FindFirstChild("Magazine")
        
        if ammo and (ammo:IsA("NumberValue") or ammo:IsA("IntValue")) then
            spawn(function()
                while features.infiniteAmmo and tool.Parent do
                    ammo.Value = 9999
                    task.wait(0.3)
                end
            end)
        end
    end
    
    character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then
            handleTool(child)
        end
    end)
    
    for _, tool in pairs(character:GetChildren()) do
        if tool:IsA("Tool") then
            handleTool(tool)
        end
    end
end

-- ================ ESP ================
local function createESP(target, color)
    if not target:FindFirstChild("HumanoidRootPart") then return end
    
    local highlight = Instance.new("Highlight")
    highlight.FillColor = color or Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.4
    highlight.OutlineTransparency = 0.3
    highlight.Adornee = target
    highlight.Parent = screenGui
    
    -- Simple billboard with just name
    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 100, 0, 20)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Adornee = target.HumanoidRootPart
    billboard.Parent = screenGui
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = target.Name
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    nameLabel.TextStrokeTransparency = 0.3
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 13
    nameLabel.Parent = billboard
    
    table.insert(espObjects, {
        target = target,
        highlight = highlight,
        billboard = billboard
    })
end

local function clearESP()
    for _, obj in pairs(espObjects) do
        pcall(function()
            obj.highlight:Destroy()
            obj.billboard:Destroy()
        end)
    end
    espObjects = {}
end

local function updateESP()
    if not features.esp then
        clearESP()
        return
    end
    
    clearESP()
    
    -- ESP for players
    for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
        if plr ~= player and plr.Character then
            local color = Color3.fromRGB(255, 0, 0) -- Red enemies
            if plr.Team and player.Team and plr.Team == player.Team then
                color = Color3.fromRGB(0, 255, 0) -- Green teammates
            end
            createESP(plr.Character, color)
        end
    end
    
    -- ESP for NPCs
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and 
           not obj:FindFirstChild("HumanoidRootPart") then
            if obj.Name:find("Zombie") or obj.Name:find("Enemy") or obj.Name:find("NPC") then
                createESP(obj, Color3.fromRGB(255, 165, 0)) -- Orange NPCs
            end
        end
    end
end

-- ================ BUTTON FUNCTIONS ================
ammoBtn.MouseButton1Click:Connect(function()
    features.infiniteAmmo = not features.infiniteAmmo
    ammoBtn.BackgroundColor3 = features.infiniteAmmo and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(60, 60, 70)
    ammoBtn.Text = features.infiniteAmmo and "🔫 INFINITE AMMO [ON]" or "🔫 INFINITE AMMO [OFF]"
    statusText.Text = features.infiniteAmmo and "AMMO: INFINITE" or "AMMO: NORMAL"
    statusText.TextColor3 = features.infiniteAmmo and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
    
    if features.infiniteAmmo then
        setupInfiniteAmmo()
    end
end)

espBtn.MouseButton1Click:Connect(function()
    features.esp = not features.esp
    espBtn.BackgroundColor3 = features.esp and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(60, 60, 70)
    espBtn.Text = features.esp and "👁️ ESP [ON]" or "👁️ ESP [OFF]"
    statusText.Text = features.esp and "ESP: ENABLED" or "ESP: DISABLED"
    updateESP()
end)

moneyBtn.MouseButton1Click:Connect(function()
    features.infiniteMoney = not features.infiniteMoney
    moneyBtn.BackgroundColor3 = features.infiniteMoney and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(60, 60, 70)
    moneyBtn.Text = features.infiniteMoney and "💰 INFINITE MONEY [ON]" or "💰 INFINITE MONEY [OFF]"
    
    if features.infiniteMoney then
        local success = startMoneyLoop()
        if not success then
            features.infiniteMoney = false
            moneyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
            moneyBtn.Text = "💰 INFINITE MONEY [OFF]"
        end
    elseif moneyConnection then
        moneyConnection:Disconnect()
        moneyConnection = nil
        statusText.Text = "MONEY: STOPPED"
        statusText.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

speedBtn.MouseButton1Click:Connect(function()
    features.speedBoost = not features.speedBoost
    local character = player.Character
    if character and character:FindFirstChild("Humanoid") then
        if features.speedBoost then
            speedBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            speedBtn.Text = "⚡ SPEED BOOST [ON]"
            character.Humanoid.WalkSpeed = 50
            statusText.Text = "SPEED: BOOSTED"
        else
            speedBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
            speedBtn.Text = "⚡ SPEED BOOST [OFF]"
            character.Humanoid.WalkSpeed = 16
            statusText.Text = "SPEED: NORMAL"
        end
        statusText.TextColor3 = features.speedBoost and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
    end
end)

aimBtn.MouseButton1Click:Connect(function()
    features.aimAssist = not features.aimAssist
    aimBtn.BackgroundColor3 = features.aimAssist and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(60, 60, 70)
    aimBtn.Text = features.aimAssist and "🎯 AIM ASSIST [ON]" or "🎯 AIM ASSIST [OFF]"
    statusText.Text = features.aimAssist and "AIM: ASSIST ON" or "AIM: ASSIST OFF"
    statusText.TextColor3 = features.aimAssist and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 255, 255)
end)

-- ================ AIM ASSIST ================
runService.RenderStepped:Connect(function()
    if features.aimAssist and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local closestTarget = nil
        local closestDistance = math.huge
        local playerPos = player.Character.HumanoidRootPart.Position
        
        for _, obj in pairs(espObjects) do
            if obj.target and obj.target:FindFirstChild("HumanoidRootPart") then
                local targetPos = obj.target.HumanoidRootPart.Position
                local dist = (targetPos - playerPos).Magnitude
                
                if dist < closestDistance and dist < 150 then
                    closestDistance = dist
                    closestTarget = obj.target
                end
            end
        end
        
        if closestTarget and closestTarget:FindFirstChild("HumanoidRootPart") then
            local targetPos = closestTarget.HumanoidRootPart.Position
            camera.CFrame = CFrame.new(camera.CFrame.Position, targetPos)
        end
    end
end)

-- ================ UPDATE LOOPS ================
-- ESP update loop
spawn(function()
    while true do
        if features.esp then
            updateESP()
        end
        task.wait(2)
    end
end)

-- Player count update
spawn(function()
    while true do
        local count = #game:GetService("Players"):GetPlayers()
        playerCount.Text = "👥 " .. count
        task.wait(1)
    end
end)

-- Character respawn
player.CharacterAdded:Connect(function(newChar)
    task.wait(1)
    if features.speedBoost and newChar:FindFirstChild("Humanoid") then
        newChar.Humanoid.WalkSpeed = 50
    end
    if features.infiniteAmmo then
        setupInfiniteAmmo()
    end
    statusText.Text = "CHARACTER: RESPAWNED"
    task.wait(1)
    statusText.Text = "STATUS: READY"
end)

-- Initialize
print("✅ FastWare V1 Loaded Successfully!")
statusText.Text = "STATUS: READY"

-- Show money locations on startup
task.wait(1)
local moneyValues = findMoneyValues()
if #moneyValues > 0 then
    statusText.Text = "💰 MONEY SYSTEM READY"
else
    statusText.Text = "⚠️ MONEY NOT FOUND"
    statusText.TextColor3 = Color3.fromRGB(255, 255, 0)
end
