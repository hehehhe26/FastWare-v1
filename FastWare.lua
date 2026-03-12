-- FastWare V1 - Trap N Bang + Butcher Auto Farm + Infinite Money
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local workspace = game:GetService("Workspace")
local runService = game:GetService("RunService")
local camera = workspace.CurrentCamera
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")
local players = game:GetService("Players")

-- Main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FastWareV1"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 999

-- Main Panel
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 500)
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
subtitle.Text = "TRAP N BANG + AUTO FARM"
subtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
subtitle.BackgroundTransparency = 1
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 12
subtitle.Parent = headerFrame

-- ================ TAB MENU ================
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(1, -20, 0, 40)
tabFrame.Position = UDim2.new(0, 10, 0, 65)
tabFrame.BackgroundTransparency = 1
tabFrame.Parent = mainFrame

local combatTab = Instance.new("TextButton")
combatTab.Size = UDim2.new(0.5, -5, 1, 0)
combatTab.Position = UDim2.new(0, 0, 0, 0)
combatTab.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
combatTab.BackgroundTransparency = 0.1
combatTab.Text = "⚔️ COMBAT"
combatTab.TextColor3 = Color3.fromRGB(255, 255, 255)
combatTab.Font = Enum.Font.GothamBold
combatTab.TextSize = 16
combatTab.Parent = tabFrame

local combatTabCorner = Instance.new("UICorner")
combatTabCorner.CornerRadius = UDim.new(0, 8)
combatTabCorner.Parent = combatTab

local farmTab = Instance.new("TextButton")
farmTab.Size = UDim2.new(0.5, -5, 1, 0)
farmTab.Position = UDim2.new(0.5, 5, 0, 0)
farmTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
farmTab.BackgroundTransparency = 0.1
farmTab.Text = "🌾 AUTO FARM"
farmTab.TextColor3 = Color3.fromRGB(255, 255, 255)
farmTab.Font = Enum.Font.GothamBold
farmTab.TextSize = 16
farmTab.Parent = tabFrame

local farmTabCorner = Instance.new("UICorner")
farmTabCorner.CornerRadius = UDim.new(0, 8)
farmTabCorner.Parent = farmTab

-- ================ CONTENT PAGES ================
local combatPage = Instance.new("ScrollingFrame")
combatPage.Size = UDim2.new(1, -20, 1, -150)
combatPage.Position = UDim2.new(0, 10, 0, 110)
combatPage.BackgroundTransparency = 1
combatPage.BorderSizePixel = 0
combatPage.ScrollBarThickness = 5
combatPage.ScrollBarImageColor3 = Color3.fromRGB(255, 100, 0)
combatPage.CanvasSize = UDim2.new(0, 0, 0, 400)
combatPage.AutomaticCanvasSize = Enum.AutomaticSize.Y
combatPage.Parent = mainFrame
combatPage.Visible = true

local farmPage = Instance.new("ScrollingFrame")
farmPage.Size = UDim2.new(1, -20, 1, -150)
farmPage.Position = UDim2.new(0, 10, 0, 110)
farmPage.BackgroundTransparency = 1
farmPage.BorderSizePixel = 0
farmPage.ScrollBarThickness = 5
farmPage.ScrollBarImageColor3 = Color3.fromRGB(255, 100, 0)
farmPage.CanvasSize = UDim2.new(0, 0, 0, 400)
farmPage.AutomaticCanvasSize = Enum.AutomaticSize.Y
farmPage.Parent = mainFrame
farmPage.Visible = false

-- Tab switching
combatTab.MouseButton1Click:Connect(function()
    combatTab.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
    farmTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    combatPage.Visible = true
    farmPage.Visible = false
end)

farmTab.MouseButton1Click:Connect(function()
    farmTab.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
    combatTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    farmPage.Visible = true
    combatPage.Visible = false
end)

-- Button creator function
local function createButton(parent, name, text, yPos, color)
    color = color or Color3.fromRGB(60, 60, 70)
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 45)
    button.Position = UDim2.new(0, 5, 0, yPos)
    button.BackgroundColor3 = color
    button.BackgroundTransparency = 0.1
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 15
    button.Name = name
    button.Parent = parent
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = button
    
    return button
end

-- ================ COMBAT PAGE BUTTONS ================
local ammoBtn = createButton(combatPage, "AmmoBtn", "🔫 INFINITE AMMO [OFF]", 0)
local espBtn = createButton(combatPage, "EspBtn", "👁️ ESP [ON]", 55, Color3.fromRGB(0, 255, 0))
local moneyBtn = createButton(combatPage, "MoneyBtn", "💰 INFINITE MONEY [OFF]", 110)
local speedBtn = createButton(combatPage, "SpeedBtn", "⚡ SPEED BOOST [OFF]", 165)
local aimBtn = createButton(combatPage, "AimBtn", "🎯 AIM ASSIST [OFF]", 220)

-- ================ FARM PAGE BUTTONS ================
local farmStatus = Instance.new("TextLabel")
farmStatus.Size = UDim2.new(1, -10, 0, 30)
farmStatus.Position = UDim2.new(0, 5, 0, 0)
farmStatus.Text = "FARM STATUS: READY"
farmStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
farmStatus.BackgroundTransparency = 1
farmStatus.Font = Enum.Font.GothamBold
farmStatus.TextSize = 14
farmStatus.Parent = farmPage

local startFarmBtn = createButton(farmPage, "StartFarmBtn", "▶️ START AUTO FARM", 40, Color3.fromRGB(0, 100, 0))
local stopFarmBtn = createButton(farmPage, "StopFarmBtn", "⏹️ STOP FARM", 95, Color3.fromRGB(100, 0, 0))
local carcassBtn = createButton(farmPage, "CarcassBtn", "🥩 TP TO CARCASS", 150)
local chopBtn = createButton(farmPage, "ChopBtn", "🔪 TP TO CHOP", 205)
local sellBtn = createButton(farmPage, "SellBtn", "💰 TP TO SELL", 260)

local farmInfo = Instance.new("TextLabel")
farmInfo.Size = UDim2.new(1, -10, 0, 60)
farmInfo.Position = UDim2.new(0, 5, 0, 315)
farmInfo.Text = "CYCLE: 0\nMONEY: $0"
farmInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
farmInfo.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
farmInfo.BackgroundTransparency = 0.3
farmInfo.Font = Enum.Font.Gotham
farmInfo.TextSize = 14
farmInfo.Parent = farmPage

local farmInfoCorner = Instance.new("UICorner")
farmInfoCorner.CornerRadius = UDim.new(0, 8)
farmInfoCorner.Parent = farmInfo

-- Status text (shared)
local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, -20, 0, 30)
statusText.Position = UDim2.new(0, 10, 1, -40)
statusText.Text = "STATUS: READY"
statusText.TextColor3 = Color3.fromRGB(0, 255, 0)
statusText.BackgroundTransparency = 1
statusText.Font = Enum.Font.GothamBold
statusText.TextSize = 14
statusText.Parent = mainFrame

-- Player count
local playerCount = Instance.new("TextLabel")
playerCount.Size = UDim2.new(0, 100, 0, 30)
playerCount.Position = UDim2.new(1, -110, 1, -40)
playerCount.Text = "👥 0"
playerCount.TextColor3 = Color3.fromRGB(255, 200, 100)
playerCount.BackgroundTransparency = 1
playerCount.Font = Enum.Font.GothamBold
playerCount.TextSize = 14
playerCount.TextXAlignment = Enum.TextXAlignment.Right
playerCount.Parent = mainFrame

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
    esp = true,
    infiniteMoney = false,
    speedBoost = false,
    aimAssist = false,
    autoFarm = false
}

local espObjects = {}
local moneyConnection = nil
local farmLoop = nil
local farmStats = {
    cycle = 0,
    money = 0
}

-- ================ INFINITE MONEY (UNIVERSAL) ================
local function findAllMoney()
    local moneyValues = {}
    
    -- Search everywhere
    local locations = {
        player,
        player:FindFirstChild("leaderstats"),
        player:FindFirstChild("Stats"),
        player:FindFirstChild("Data"),
        player:FindFirstChild("Values")
    }
    
    for _, location in pairs(locations) do
        if location then
            for _, child in pairs(location:GetChildren()) do
                if child:IsA("NumberValue") or child:IsA("IntValue") or child:IsA("DoubleValue") then
                    local name = child.Name:lower()
                    if name:find("cash") or name:find("money") or name:find("bal") or 
                       name:find("points") or name:find("coins") or name:find("credit") then
                        table.insert(moneyValues, child)
                        print("💰 Found money: " .. location.Name .. "." .. child.Name .. " = " .. child.Value)
                    end
                end
            end
        end
    end
    
    return moneyValues
end

local function startMoneyLoop()
    local moneyValues = findAllMoney()
    
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
                moneyVal.Value = moneyVal.Value + 5000
            end)
        end
    end)
    
    return true
end

-- ================ ESP (FIXED) ================
local function createESP(target, color)
    if not target or not target:FindFirstChild("HumanoidRootPart") then return end
    
    -- Highlight
    local highlight = Instance.new("Highlight")
    highlight.FillColor = color or Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.3
    highlight.OutlineTransparency = 0.2
    highlight.Adornee = target
    highlight.Parent = screenGui
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    
    -- Billboard with name and distance
    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 150, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Adornee = target.HumanoidRootPart
    billboard.Parent = screenGui
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 0.6, 0)
    nameLabel.Position = UDim2.new(0, 0, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = target.Name
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    nameLabel.TextStrokeTransparency = 0.3
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 14
    nameLabel.Parent = billboard
    
    local distLabel = Instance.new("TextLabel")
    distLabel.Size = UDim2.new(1, 0, 0.4, 0)
    distLabel.Position = UDim2.new(0, 0, 0.6, 0)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = "0m"
    distLabel.TextColor3 = Color3.fromRGB(200, 200, 0)
    distLabel.Font = Enum.Font.Gotham
    distLabel.TextSize = 12
    distLabel.Parent = billboard
    
    table.insert(espObjects, {
        target = target,
        highlight = highlight,
        billboard = billboard,
        distLabel = distLabel
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
    
    -- Clear old ESP
    clearESP()
    
    -- ESP for all players
    for _, plr in pairs(players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local color = Color3.fromRGB(255, 0, 0) -- Red for enemies
            if plr.Team and player.Team and plr.Team == player.Team then
                color = Color3.fromRGB(0, 255, 0) -- Green for teammates
            end
            createESP(plr.Character, color)
        end
    end
    
    -- ESP for NPCs
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and 
           obj:FindFirstChild("HumanoidRootPart") and not players:GetPlayerFromCharacter(obj) then
            if obj.Name:find("Zombie") or obj.Name:find("Enemy") or obj.Name:find("NPC") or 
               obj.Name:find("Butcher") or obj.Name:find("Carcass") then
                createESP(obj, Color3.fromRGB(255, 165, 0)) -- Orange for NPCs
            end
        end
    end
end

-- ================ AUTO FARM ================
local farmPositions = {
    {
        position = Vector3.new(-681.16, 3.36, -497.09),
        name = "Carcass",
        waitTime = 0.8
    },
    {
        position = Vector3.new(-356.14, 3.36, -497.93),
        name = "Chop",
        waitTime = 0.8
    },
    {
        position = Vector3.new(-342.1, 3.36, -509.72),
        name = "Sell",
        waitTime = 0.1
    }
}

local function teleportTo(position)
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(position)
    end
end

local function interactWithPrompt()
    local character = player.Character
    if not character then return end
    
    for _, descendant in pairs(workspace:GetDescendants()) do
        if descendant:IsA("ProximityPrompt") and descendant.Enabled then
            local part = descendant.Parent
            if part and part:IsA("BasePart") then
                local dist = (part.Position - character.HumanoidRootPart.Position).Magnitude
                if dist < (descendant.MaxActivationDistance or 10) then
                    fireproximityprompt(descendant, 0)
                    return true
                end
            end
        end
    end
    return false
end

local function startAutoFarm()
    if farmLoop then
        farmLoop:Disconnect()
        farmLoop = nil
    end
    
    features.autoFarm = true
    farmStatus.Text = "FARM STATUS: ACTIVE"
    farmStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
    
    local currentStep = 1
    
    farmLoop = runService.Heartbeat:Connect(function()
        if not features.autoFarm then
            if farmLoop then
                farmLoop:Disconnect()
                farmLoop = nil
            end
            return
        end
        
        local step = farmPositions[currentStep]
        teleportTo(step.position)
        task.wait(0.2)
        interactWithPrompt()
        task.wait(step.waitTime)
        
        currentStep = currentStep + 1
        if currentStep > #farmPositions then
            currentStep = 1
            farmStats.cycle = farmStats.cycle + 1
            farmStats.money = farmStats.money + 500
            farmInfo.Text = "CYCLE: " .. farmStats.cycle .. "\nMONEY: $" .. farmStats.money
        end
    end)
end

local function stopAutoFarm()
    features.autoFarm = false
    if farmLoop then
        farmLoop:Disconnect()
        farmLoop = nil
    end
    farmStatus.Text = "FARM STATUS: STOPPED"
    farmStatus.TextColor3 = Color3.fromRGB(255, 0, 0)
end

-- ================ BUTTON FUNCTIONS ================
ammoBtn.MouseButton1Click:Connect(function()
    features.infiniteAmmo = not features.infiniteAmmo
    ammoBtn.BackgroundColor3 = features.infiniteAmmo and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(60, 60, 70)
    ammoBtn.Text = features.infiniteAmmo and "🔫 INFINITE AMMO [ON]" or "🔫 INFINITE AMMO [OFF]"
    statusText.Text = features.infiniteAmmo and "AMMO: INFINITE" or "AMMO: NORMAL"
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
        startMoneyLoop()
    elseif moneyConnection then
        moneyConnection:Disconnect()
        moneyConnection = nil
        statusText.Text = "MONEY: STOPPED"
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
    end
end)

aimBtn.MouseButton1Click:Connect(function()
    features.aimAssist = not features.aimAssist
    aimBtn.BackgroundColor3 = features.aimAssist and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(60, 60, 70)
    aimBtn.Text = features.aimAssist and "🎯 AIM ASSIST [ON]" or "🎯 AIM ASSIST [OFF]"
    statusText.Text = features.aimAssist and "AIM: ASSIST ON" or "AIM: ASSIST OFF"
end)

-- Farm buttons
startFarmBtn.MouseButton1Click:Connect(startAutoFarm)
stopFarmBtn.MouseButton1Click:Connect(stopAutoFarm)

carcassBtn.MouseButton1Click:Connect(function()
    teleportTo(farmPositions[1].position)
    statusText.Text = "📍 TP TO CARCASS"
end)

chopBtn.MouseButton1Click:Connect(function()
    teleportTo(farmPositions[2].position)
    statusText.Text = "📍 TP TO CHOP"
end)

sellBtn.MouseButton1Click:Connect(function()
    teleportTo(farmPositions[3].position)
    statusText.Text = "📍 TP TO SELL"
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

-- Distance update loop
runService.RenderStepped:Connect(function()
    if features.esp and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local playerPos = player.Character.HumanoidRootPart.Position
        for _, obj in pairs(espObjects) do
            if obj.target and obj.target:FindFirstChild("HumanoidRootPart") and obj.distLabel then
                local dist = (obj.target.HumanoidRootPart.Position - playerPos).Magnitude
                obj.distLabel.Text = math.floor(dist) .. "m"
            end
        end
    end
end)

-- Player count update
spawn(function()
    while true do
        local count = #players:GetPlayers()
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
    if features.esp then
        updateESP()
    end
    statusText.Text = "CHARACTER: RESPAWNED"
    task.wait(1)
    statusText.Text = "STATUS: READY"
end)

-- Initialize
print("✅ FastWare V1 Loaded - All features enabled")
statusText.Text = "STATUS: READY"
updateESP()

-- Show money locations on startup
task.wait(1)
local moneyValues = findAllMoney()
if #moneyValues > 0 then
    statusText.Text = "💰 MONEY SYSTEM READY"
else
    statusText.Text = "⚠️ NO MONEY FOUND"
    statusText.TextColor3 = Color3.fromRGB(255, 255, 0)
end
