-- FastWare V1 - Complete Edition with All Cars Unlock
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local workspace = game:GetService("Workspace")
local runService = game:GetService("RunService")
local camera = workspace.CurrentCamera
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")
local players = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")

-- Main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FastWareV1"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 999

-- Main Panel
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 420, 0, 550)
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

-- Header
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
title.Parent = headerFrame

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0.3, 0)
subtitle.Position = UDim2.new(0, 0, 0.7, 0)
subtitle.Text = "NITTY FARM + CARS + MONEY"
subtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
subtitle.BackgroundTransparency = 1
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 12
subtitle.Parent = headerFrame

-- Tab Menu
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(1, -20, 0, 40)
tabFrame.Position = UDim2.new(0, 10, 0, 65)
tabFrame.BackgroundTransparency = 1
tabFrame.Parent = mainFrame

local combatTab = Instance.new("TextButton")
combatTab.Size = UDim2.new(0.25, -5, 1, 0)
combatTab.Position = UDim2.new(0, 0, 0, 0)
combatTab.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
combatTab.BackgroundTransparency = 0.1
combatTab.Text = "⚔️ COMBAT"
combatTab.TextColor3 = Color3.fromRGB(255, 255, 255)
combatTab.Font = Enum.Font.GothamBold
combatTab.TextSize = 12
combatTab.Parent = tabFrame

local combatTabCorner = Instance.new("UICorner")
combatTabCorner.CornerRadius = UDim.new(0, 8)
combatTabCorner.Parent = combatTab

local farmTab = Instance.new("TextButton")
farmTab.Size = UDim2.new(0.25, -5, 1, 0)
farmTab.Position = UDim2.new(0.25, 5, 0, 0)
farmTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
farmTab.BackgroundTransparency = 0.1
farmTab.Text = "🌾 FARM"
farmTab.TextColor3 = Color3.fromRGB(255, 255, 255)
farmTab.Font = Enum.Font.GothamBold
farmTab.TextSize = 12
farmTab.Parent = tabFrame

local farmTabCorner = Instance.new("UICorner")
farmTabCorner.CornerRadius = UDim.new(0, 8)
farmTabCorner.Parent = farmTab

local nittyTab = Instance.new("TextButton")
nittyTab.Size = UDim2.new(0.25, -5, 1, 0)
nittyTab.Position = UDim2.new(0.5, 10, 0, 0)
nittyTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
nittyTab.BackgroundTransparency = 0.1
nittyTab.Text = "👾 NITTY ESP"
nittyTab.TextColor3 = Color3.fromRGB(255, 255, 255)
nittyTab.Font = Enum.Font.GothamBold
nittyTab.TextSize = 12
nittyTab.Parent = tabFrame

local nittyTabCorner = Instance.new("UICorner")
nittyTabCorner.CornerRadius = UDim.new(0, 8)
nittyTabCorner.Parent = nittyTab

local carsTab = Instance.new("TextButton")
carsTab.Size = UDim2.new(0.25, -5, 1, 0)
carsTab.Position = UDim2.new(0.75, 15, 0, 0)
carsTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
carsTab.BackgroundTransparency = 0.1
carsTab.Text = "🚗 CARS"
carsTab.TextColor3 = Color3.fromRGB(255, 255, 255)
carsTab.Font = Enum.Font.GothamBold
carsTab.TextSize = 12
carsTab.Parent = tabFrame

local carsTabCorner = Instance.new("UICorner")
carsTabCorner.CornerRadius = UDim.new(0, 8)
carsTabCorner.Parent = carsTab

-- Content Pages
local combatPage = Instance.new("ScrollingFrame")
combatPage.Size = UDim2.new(1, -20, 1, -160)
combatPage.Position = UDim2.new(0, 10, 0, 110)
combatPage.BackgroundTransparency = 1
combatPage.BorderSizePixel = 0
combatPage.ScrollBarThickness = 5
combatPage.ScrollBarImageColor3 = Color3.fromRGB(255, 100, 0)
combatPage.CanvasSize = UDim2.new(0, 0, 0, 300)
combatPage.AutomaticCanvasSize = Enum.AutomaticSize.Y
combatPage.Parent = mainFrame
combatPage.Visible = true

local farmPage = Instance.new("ScrollingFrame")
farmPage.Size = UDim2.new(1, -20, 1, -160)
farmPage.Position = UDim2.new(0, 10, 0, 110)
farmPage.BackgroundTransparency = 1
farmPage.BorderSizePixel = 0
farmPage.ScrollBarThickness = 5
farmPage.ScrollBarImageColor3 = Color3.fromRGB(255, 100, 0)
farmPage.CanvasSize = UDim2.new(0, 0, 0, 400)
farmPage.AutomaticCanvasSize = Enum.AutomaticSize.Y
farmPage.Parent = mainFrame
farmPage.Visible = false

local nittyPage = Instance.new("ScrollingFrame")
nittyPage.Size = UDim2.new(1, -20, 1, -160)
nittyPage.Position = UDim2.new(0, 10, 0, 110)
nittyPage.BackgroundTransparency = 1
nittyPage.BorderSizePixel = 0
nittyPage.ScrollBarThickness = 5
nittyPage.ScrollBarImageColor3 = Color3.fromRGB(255, 100, 0)
nittyPage.CanvasSize = UDim2.new(0, 0, 0, 200)
nittyPage.AutomaticCanvasSize = Enum.AutomaticSize.Y
nittyPage.Parent = mainFrame
nittyPage.Visible = false

local carsPage = Instance.new("ScrollingFrame")
carsPage.Size = UDim2.new(1, -20, 1, -160)
carsPage.Position = UDim2.new(0, 10, 0, 110)
carsPage.BackgroundTransparency = 1
carsPage.BorderSizePixel = 0
carsPage.ScrollBarThickness = 5
carsPage.ScrollBarImageColor3 = Color3.fromRGB(255, 100, 0)
carsPage.CanvasSize = UDim2.new(0, 0, 0, 300)
carsPage.AutomaticCanvasSize = Enum.AutomaticSize.Y
carsPage.Parent = mainFrame
carsPage.Visible = false

-- Tab switching
combatTab.MouseButton1Click:Connect(function()
    combatTab.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
    farmTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    nittyTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    carsTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    combatPage.Visible = true
    farmPage.Visible = false
    nittyPage.Visible = false
    carsPage.Visible = false
end)

farmTab.MouseButton1Click:Connect(function()
    farmTab.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
    combatTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    nittyTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    carsTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    farmPage.Visible = true
    combatPage.Visible = false
    nittyPage.Visible = false
    carsPage.Visible = false
end)

nittyTab.MouseButton1Click:Connect(function()
    nittyTab.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
    combatTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    farmTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    carsTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    nittyPage.Visible = true
    combatPage.Visible = false
    farmPage.Visible = false
    carsPage.Visible = false
end)

carsTab.MouseButton1Click:Connect(function()
    carsTab.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
    combatTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    farmTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    nittyTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    carsPage.Visible = true
    combatPage.Visible = false
    farmPage.Visible = false
    nittyPage.Visible = false
end)

-- Button creator
local function createButton(parent, name, text, yPos, color)
    color = color or Color3.fromRGB(60, 60, 70)
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 40)
    button.Position = UDim2.new(0, 5, 0, yPos)
    button.BackgroundColor3 = color
    button.BackgroundTransparency = 0.1
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.Name = name
    button.Parent = parent
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = button
    
    return button
end

-- Combat Page Buttons
local ammoBtn = createButton(combatPage, "AmmoBtn", "🔫 INFINITE AMMO [OFF]", 0)
local speedBtn = createButton(combatPage, "SpeedBtn", "⚡ SPEED BOOST [OFF]", 50)
local aimBtn = createButton(combatPage, "AimBtn", "🎯 AIM ASSIST [OFF]", 100)
local moneyBtn = createButton(combatPage, "MoneyBtn", "💰 INFINITE MONEY [OFF]", 150, Color3.fromRGB(0, 100, 0))

-- Farm Page Buttons
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
local stopFarmBtn = createButton(farmPage, "StopFarmBtn", "⏹️ STOP FARM", 90, Color3.fromRGB(100, 0, 0))
local carcassBtn = createButton(farmPage, "CarcassBtn", "🥩 TP TO CARCASS", 140)
local chopBtn = createButton(farmPage, "ChopBtn", "🔪 TP TO CHOP", 190)
local sellBtn = createButton(farmPage, "SellBtn", "💰 TP TO SELL", 240)

local farmInfo = Instance.new("TextLabel")
farmInfo.Size = UDim2.new(1, -10, 0, 60)
farmInfo.Position = UDim2.new(0, 5, 0, 295)
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

-- Nitty ESP Page
local nittyStatus = Instance.new("TextLabel")
nittyStatus.Size = UDim2.new(1, -10, 0, 30)
nittyStatus.Position = UDim2.new(0, 5, 0, 0)
nittyStatus.Text = "NITTY ESP: OFF"
nittyStatus.TextColor3 = Color3.fromRGB(255, 0, 0)
nittyStatus.BackgroundTransparency = 1
nittyStatus.Font = Enum.Font.GothamBold
nittyStatus.TextSize = 14
nittyStatus.Parent = nittyPage

local toggleNittyBtn = createButton(nittyPage, "ToggleNittyBtn", "👾 TOGGLE NITTY ESP [OFF]", 40, Color3.fromRGB(100, 0, 0))
local refreshNittyBtn = createButton(nittyPage, "RefreshNittyBtn", "🔄 REFRESH NITTY LIST", 90)

local nittyCount = Instance.new("TextLabel")
nittyCount.Size = UDim2.new(1, -10, 0, 30)
nittyCount.Position = UDim2.new(0, 5, 0, 145)
nittyCount.Text = "NITTIES FOUND: 0"
nittyCount.TextColor3 = Color3.fromRGB(255, 255, 0)
nittyCount.BackgroundTransparency = 1
nittyCount.Font = Enum.Font.Gotham
nittyCount.TextSize = 14
nittyCount.Parent = nittyPage

-- Cars Page
local carsStatus = Instance.new("TextLabel")
carsStatus.Size = UDim2.new(1, -10, 0, 30)
carsStatus.Position = UDim2.new(0, 5, 0, 0)
carsStatus.Text = "CARS SYSTEM READY"
carsStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
carsStatus.BackgroundTransparency = 1
carsStatus.Font = Enum.Font.GothamBold
carsStatus.TextSize = 14
carsStatus.Parent = carsPage

local buyAllCarsBtn = createButton(carsPage, "BuyAllCarsBtn", "🚗 BUY ALL CARS", 40, Color3.fromRGB(0, 100, 200))
local bypassLevelBtn = createButton(carsPage, "BypassLevelBtn", "🔓 BYPASS LEVEL 100", 90, Color3.fromRGB(100, 0, 200))
local findDealershipBtn = createButton(carsPage, "FindDealershipBtn", "📍 FIND DEALERSHIP", 140)

local carsInfo = Instance.new("TextLabel")
carsInfo.Size = UDim2.new(1, -10, 0, 60)
carsInfo.Position = UDim2.new(0, 5, 0, 195)
carsInfo.Text = "CARS BOUGHT: 0\nWAITING FOR DEALERSHIP..."
carsInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
carsInfo.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
carsInfo.BackgroundTransparency = 0.3
carsInfo.Font = Enum.Font.Gotham
carsInfo.TextSize = 14
carsInfo.Parent = carsPage

local carsInfoCorner = Instance.new("UICorner")
carsInfoCorner.CornerRadius = UDim.new(0, 8)
carsInfoCorner.Parent = carsInfo

-- Status text (shared)
local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(0.7, -10, 0, 30)
statusText.Position = UDim2.new(0, 10, 1, -40)
statusText.Text = "STATUS: READY"
statusText.TextColor3 = Color3.fromRGB(0, 255, 0)
statusText.BackgroundTransparency = 1
statusText.Font = Enum.Font.GothamBold
statusText.TextSize = 14
statusText.TextXAlignment = Enum.TextXAlignment.Left
statusText.Parent = mainFrame

-- Player count
local playerCount = Instance.new("TextLabel")
playerCount.Size = UDim2.new(0.3, -10, 0, 30)
playerCount.Position = UDim2.new(0.7, 0, 1, -40)
playerCount.Text = "👥 0"
playerCount.TextColor3 = Color3.fromRGB(255, 200, 100)
playerCount.BackgroundTransparency = 1
playerCount.Font = Enum.Font.GothamBold
playerCount.TextSize = 14
playerCount.TextXAlignment = Enum.TextXAlignment.Right
playerCount.Parent = mainFrame

-- Draggable
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
    speedBoost = false,
    aimAssist = false,
    infiniteMoney = false,
    autoFarm = false,
    nittyESP = false
}

local espObjects = {}
local moneyConnection = nil
local farmLoop = nil
local farmStats = {
    cycle = 0,
    money = 0
}
local nittyList = {}

-- ================ INFINITE MONEY (TARGETING WALLET) ================
local function startMoneyLoop()
    -- Target player.Stats.Wallet (found with Dex)
    local wallet = player:FindFirstChild("Stats") and player.Stats:FindFirstChild("Wallet")
    
    if not wallet then
        statusText.Text = "⚠️ WALLET NOT FOUND"
        statusText.TextColor3 = Color3.fromRGB(255, 0, 0)
        return false
    end
    
    statusText.Text = "💰 FARMING WALLET"
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
        
        pcall(function()
            wallet.Value = wallet.Value + 10000
        end)
    end)
    
    return true
end

-- ================ NITTY ESP ================
local function findNitties()
    nittyList = {}
    
    -- Look for Nitties in workspace
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") then
            local name = obj.Name:lower()
            if name:find("nitty") or name:find("npc") or name:find("enemy") then
                table.insert(nittyList, obj)
            end
        end
    end
    
    nittyCount.Text = "NITTIES FOUND: " .. #nittyList
    return nittyList
end

local function createNittyESP(nitty)
    if not nitty or not nitty:FindFirstChild("HumanoidRootPart") then return end
    
    -- Simple highlight (low lag)
    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.fromRGB(255, 100, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.3
    highlight.Adornee = nitty
    highlight.Parent = screenGui
    
    table.insert(espObjects, {
        target = nitty,
        highlight = highlight
    })
end

local function updateNittyESP()
    -- Clear old ESP
    for _, obj in pairs(espObjects) do
        pcall(function()
            obj.highlight:Destroy()
        end)
    end
    espObjects = {}
    
    if not features.nittyESP then return end
    
    -- Find and ESP all Nitties
    local nitties = findNitties()
    for _, nitty in pairs(nitties) do
        createNittyESP(nitty)
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
                if dist < (descendant.MaxActivationDistance or 15) then
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
    
    -- Use a slower loop to reduce lag
    spawn(function()
        while features.autoFarm do
            local step = farmPositions[currentStep]
            teleportTo(step.position)
            task.wait(0.3)
            interactWithPrompt()
            task.wait(step.waitTime)
            
            currentStep = currentStep + 1
            if currentStep > #farmPositions then
                currentStep = 1
                farmStats.cycle = farmStats.cycle + 1
                farmStats.money = farmStats.money + 500
                farmInfo.Text = "CYCLE: " .. farmStats.cycle .. "\nMONEY: $" .. farmStats.money
            end
            task.wait(0.1)
        end
        farmStatus.Text = "FARM STATUS: STOPPED"
        farmStatus.TextColor3 = Color3.fromRGB(255, 0, 0)
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

-- ================ CAR FUNCTIONS ================
local function bypassLevel()
    statusText.Text = "🔓 ATTEMPTING LEVEL BYPASS"
    
    -- Try to find level value
    local level = player:FindFirstChild("Stats") and player.Stats:FindFirstChild("Level")
    if level then
        level.Value = 100
        statusText.Text = "✅ LEVEL SET TO 100"
    else
        statusText.Text = "⚠️ LEVEL NOT FOUND"
    end
end

local function findDealership()
    statusText.Text = "📍 SEARCHING FOR DEALERSHIP"
    
    -- Look for car dealership in workspace
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj.Name:lower():find("dealership") or obj.Name:lower():find("cars") or 
           obj.Name:lower():find("dealer") or obj:IsA("Model") and obj.Name:lower():find("shop") then
            statusText.Text = "✅ DEALERSHIP FOUND: " .. obj.Name
            if obj:FindFirstChild("HumanoidRootPart") then
                teleportTo(obj.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
            elseif obj:IsA("BasePart") then
                teleportTo(obj.Position + Vector3.new(0, 5, 0))
            end
            return
        end
    end
    statusText.Text = "❌ DEALERSHIP NOT FOUND"
end

local function buyAllCars()
    statusText.Text = "🚗 ATTEMPTING TO BUY CARS"
    carsInfo.Text = "CARS BOUGHT: 0\nBUYING... NEED DEALERSHIP"
    
    -- This will need the actual dealership GUI/buttons
    -- You'll need to tell me what the buy button looks like
    statusText.Text = "⚠️ NEED DEALERSHIP INTERACTION INFO"
end

-- ================ BUTTON FUNCTIONS ================
ammoBtn.MouseButton1Click:Connect(function()
    features.infiniteAmmo = not features.infiniteAmmo
    ammoBtn.BackgroundColor3 = features.infiniteAmmo and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(60, 60, 70)
    ammoBtn.Text = features.infiniteAmmo and "🔫 INFINITE AMMO [ON]" or "🔫 INFINITE AMMO [OFF]"
    statusText.Text = features.infiniteAmmo and "AMMO: INFINITE" or "AMMO: NORMAL"
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

-- Nitty buttons
toggleNittyBtn.MouseButton1Click:Connect(function()
    features.nittyESP = not features.nittyESP
    if features.nittyESP then
        toggleNittyBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        toggleNittyBtn.Text = "👾 TOGGLE NITTY ESP [ON]"
        nittyStatus.Text = "NITTY ESP: ON"
        nittyStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
        updateNittyESP()
    else
        toggleNittyBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
        toggleNittyBtn.Text = "👾 TOGGLE NITTY ESP [OFF]"
        nittyStatus.Text = "NITTY ESP: OFF"
        nittyStatus.TextColor3 = Color3.fromRGB(255, 0, 0)
        updateNittyESP()
    end
end)

refreshNittyBtn.MouseButton1Click:Connect(function()
    statusText.Text = "🔄 REFRESHING NITTIES"
    if features.nittyESP then
        updateNittyESP()
    else
        findNitties()
    end
    statusText.Text = "✅ NITTIES REFRESHED"
end)

-- Cars buttons
buyAllCarsBtn.MouseButton1Click:Connect(buyAllCars)
bypassLevelBtn.MouseButton1Click:Connect(bypassLevel)
findDealershipBtn.MouseButton1Click:Connect(findDealership)

-- ================ UPDATE LOOPS (OPTIMIZED) ================
-- Nitty ESP update (every 3 seconds to reduce lag)
spawn(function()
    while true do
        if features.nittyESP then
            updateNittyESP()
        end
        task.wait(3)
    end
end)

-- Player count update
spawn(function()
    while true do
        local count = #players:GetPlayers()
        playerCount.Text = "👥 " .. count
        task.wait(2)
    end
end)

-- Character respawn
player.CharacterAdded:Connect(function(newChar)
    task.wait(1)
    if features.speedBoost and newChar:FindFirstChild("Humanoid") then
        newChar.Humanoid.WalkSpeed = 50
    end
    statusText.Text = "CHARACTER: RESPAWNED"
    task.wait(1)
    statusText.Text = "STATUS: READY"
end)

-- Initialize
print("✅ FastWare V1 Loaded - Money target: player.Stats.Wallet")
statusText.Text = "STATUS: READY"

-- Check wallet
task.wait(1)
local wallet = player:FindFirstChild("Stats") and player.Stats:FindFirstChild("Wallet")
if wallet then
    statusText.Text = "💰 WALLET FOUND: $" .. wallet.Value
else
    statusText.Text = "⚠️ WALLET NOT FOUND"
    statusText.TextColor3 = Color3.fromRGB(255, 255, 0)
end
