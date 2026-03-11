-- Galactic Scripts - Trap N Bang (Optimized)
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local workspace = game:GetService("Workspace")
local runService = game:GetService("RunService")
local camera = workspace.CurrentCamera
local userInputService = game:GetService("UserInputService")
local replicatedStorage = game:GetService("ReplicatedStorage")

-- Main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GalacticScripts"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 999

-- Main Panel
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 280, 0, 380)
mainFrame.Position = UDim2.new(0, 20, 0, 20)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.Active = true
mainFrame.Draggable = false -- We'll use custom dragging

-- Panel Corner
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame

-- Panel Stroke
local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(0, 255, 255)
stroke.Transparency = 0.5
stroke.Parent = mainFrame

-- Gradient Background
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 5, 10))
})
gradient.Rotation = 90
gradient.Parent = mainFrame

-- ================ HEADER ================
local headerFrame = Instance.new("Frame")
headerFrame.Size = UDim2.new(1, 0, 0, 50)
headerFrame.BackgroundColor3 = Color3.fromRGB(0, 100, 100)
headerFrame.BackgroundTransparency = 0.3
headerFrame.BorderSizePixel = 0
headerFrame.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 10)
headerCorner.Parent = headerFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 1, 0)
title.Text = "GALACTIC SCRIPTS"
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextStrokeTransparency = 0.5
title.TextStrokeColor3 = Color3.fromRGB(0, 150, 150)
title.Parent = headerFrame

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 15)
subtitle.Position = UDim2.new(0, 0, 1, 0)
subtitle.Text = "TRAP N BANG"
subtitle.TextColor3 = Color3.fromRGB(200, 200, 255)
subtitle.BackgroundTransparency = 1
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 10
subtitle.Parent = headerFrame

-- ================ CONTENT ================
local contentFrame = Instance.new("ScrollingFrame") -- Changed to ScrollingFrame
contentFrame.Size = UDim2.new(1, -20, 1, -70)
contentFrame.Position = UDim2.new(0, 10, 0, 60)
contentFrame.BackgroundTransparency = 1
contentFrame.BorderSizePixel = 0
contentFrame.ScrollBarThickness = 4
contentFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 255)
contentFrame.CanvasSize = UDim2.new(0, 0, 0, 350)
contentFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
contentFrame.Parent = mainFrame

local function createButton(name, text, yPos, defaultColor)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 40)
    button.Position = UDim2.new(0, 0, 0, yPos)
    button.BackgroundColor3 = defaultColor or Color3.fromRGB(100, 100, 100)
    button.BackgroundTransparency = 0.2
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.Name = name
    button.Parent = contentFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = button
    
    return button
end

-- Create buttons
local ammoButton = createButton("AmmoButton", "🔫 INFINITE AMMO [OFF]", 0, Color3.fromRGB(100, 100, 100))
local espButton = createButton("ESPButton", "👁️ ESP [OFF]", 50, Color3.fromRGB(100, 100, 100))
local moneyButton = createButton("MoneyButton", "💰 INFINITE MONEY [OFF]", 100, Color3.fromRGB(100, 100, 100))
local speedButton = createButton("SpeedButton", "⚡ SPEED BOOST [OFF]", 150, Color3.fromRGB(100, 100, 100))
local aimButton = createButton("AimButton", "🎯 AIM ASSIST [OFF]", 200, Color3.fromRGB(100, 100, 100))

-- Status Label
local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, 0, 0, 25)
statusText.Position = UDim2.new(0, 0, 0, 260)
statusText.Text = "STATUS: READY"
statusText.TextColor3 = Color3.fromRGB(0, 255, 0)
statusText.BackgroundTransparency = 1
statusText.Font = Enum.Font.Gotham
statusText.TextSize = 12
statusText.Parent = contentFrame

-- Player Count
local playerCount = Instance.new("TextLabel")
playerCount.Size = UDim2.new(1, 0, 0, 25)
playerCount.Position = UDim2.new(0, 0, 0, 290)
playerCount.Text = "PLAYERS: 0"
playerCount.TextColor3 = Color3.fromRGB(150, 150, 255)
playerCount.BackgroundTransparency = 1
playerCount.Font = Enum.Font.Gotham
playerCount.TextSize = 12
playerCount.Parent = contentFrame

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
local infiniteAmmo = false
local espEnabled = false
local infiniteMoney = false
local speedBoost = false
local aimAssist = false
local espObjects = {}
local moneyLoop = nil

-- ================ INFINITE AMMO ================
local function setupInfiniteAmmo()
    local character = player.Character or player.CharacterAdded:Wait()
    
    local function handleTool(tool)
        task.wait(0.1)
        local ammo = tool:FindFirstChild("Ammo") or tool:FindFirstChild("CurrentAmmo") or tool:FindFirstChild("AmmoCount")
        if ammo and (ammo:IsA("NumberValue") or ammo:IsA("IntValue")) then
            spawn(function()
                while infiniteAmmo and tool.Parent do
                    ammo.Value = 999999
                    task.wait(0.5) -- Increased wait time to reduce lag
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

-- ================ INFINITE MONEY ================
local function startMoneyLoop()
    if moneyLoop then
        moneyLoop:Disconnect()
        moneyLoop = nil
    end
    
    moneyLoop = runService.Heartbeat:Connect(function()
        if not infiniteMoney then
            if moneyLoop then
                moneyLoop:Disconnect()
                moneyLoop = nil
            end
            return
        end
        
        -- Try different money methods
        pcall(function()
            -- Method 1: LocalPlayer cash
            if player:FindFirstChild("leaderstats") then
                local cash = player.leaderstats:FindFirstChild("Cash") or player.leaderstats:FindFirstChild("Money")
                if cash then
                    cash.Value = cash.Value + 5000
                end
            end
            
            -- Method 2: Stats folder
            if player:FindFirstChild("Stats") then
                local money = player.Stats:FindFirstChild("Money") or player.Stats:FindFirstChild("Cash")
                if money then
                    money.Value = money.Value + 5000
                end
            end
            
            -- Method 3: Data folder
            if player:FindFirstChild("Data") then
                local money = player.Data:FindFirstChild("Money") or player.Data:FindFirstChild("Cash")
                if money then
                    money.Value = money.Value + 5000
                end
            end
            
            -- Update status
            statusText.Text = "💰 +5000 MONEY"
            statusText.TextColor3 = Color3.fromRGB(0, 255, 0)
        end)
    end)
end

-- ================ ESP (OPTIMIZED) ================
local function createESP(target, color)
    if not target:FindFirstChild("HumanoidRootPart") then return end
    
    -- Simple highlight only (no billboard for less lag)
    local highlight = Instance.new("Highlight")
    highlight.FillColor = color or Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.4
    highlight.OutlineTransparency = 0.3
    highlight.Adornee = target
    highlight.Parent = screenGui
    
    table.insert(espObjects, {
        target = target,
        highlight = highlight
    })
end

local function clearESP()
    for _, obj in pairs(espObjects) do
        pcall(function()
            obj.highlight:Destroy()
        end)
    end
    espObjects = {}
end

local function updateESP()
    if not espEnabled then
        clearESP()
        return
    end
    
    -- Clear old ESP
    clearESP()
    
    -- ESP for all players (throttled)
    for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
        if plr ~= player and plr.Character then
            local color = Color3.fromRGB(255, 0, 0) -- Red for enemies
            if plr.Team and player.Team and plr.Team == player.Team then
                color = Color3.fromRGB(0, 255, 0) -- Green for teammates
            end
            createESP(plr.Character, color)
        end
    end
end

-- ================ BUTTON FUNCTIONS ================
ammoButton.MouseButton1Click:Connect(function()
    infiniteAmmo = not infiniteAmmo
    if infiniteAmmo then
        ammoButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        ammoButton.Text = "🔫 INFINITE AMMO [ON]"
        setupInfiniteAmmo()
        statusText.Text = "AMMO: INFINITE"
    else
        ammoButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        ammoButton.Text = "🔫 INFINITE AMMO [OFF]"
        statusText.Text = "AMMO: NORMAL"
    end
end)

espButton.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    if espEnabled then
        espButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        espButton.Text = "👁️ ESP [ON]"
        statusText.Text = "ESP: ENABLED"
        updateESP()
    else
        espButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        espButton.Text = "👁️ ESP [OFF]"
        statusText.Text = "ESP: DISABLED"
        clearESP()
    end
end)

moneyButton.MouseButton1Click:Connect(function()
    infiniteMoney = not infiniteMoney
    if infiniteMoney then
        moneyButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        moneyButton.Text = "💰 INFINITE MONEY [ON]"
        statusText.Text = "MONEY: FARMING"
        statusText.TextColor3 = Color3.fromRGB(0, 255, 0)
        startMoneyLoop()
    else
        moneyButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        moneyButton.Text = "💰 INFINITE MONEY [OFF]"
        statusText.Text = "MONEY: STOPPED"
        if moneyLoop then
            moneyLoop:Disconnect()
            moneyLoop = nil
        end
    end
end)

speedButton.MouseButton1Click:Connect(function()
    speedBoost = not speedBoost
    local character = player.Character
    if character and character:FindFirstChild("Humanoid") then
        if speedBoost then
            speedButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            speedButton.Text = "⚡ SPEED BOOST [ON]"
            character.Humanoid.WalkSpeed = 50
            statusText.Text = "SPEED: BOOSTED"
        else
            speedButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            speedButton.Text = "⚡ SPEED BOOST [OFF]"
            character.Humanoid.WalkSpeed = 16
            statusText.Text = "SPEED: NORMAL"
        end
    end
end)

aimButton.MouseButton1Click:Connect(function()
    aimAssist = not aimAssist
    if aimAssist then
        aimButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        aimButton.Text = "🎯 AIM ASSIST [ON]"
        statusText.Text = "AIM: ASSIST ON"
    else
        aimButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        aimButton.Text = "🎯 AIM ASSIST [OFF]"
        statusText.Text = "AIM: ASSIST OFF"
    end
end)

-- ================ AIM ASSIST (Optimized) ================
runService.RenderStepped:Connect(function()
    if aimAssist and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local closestTarget = nil
        local closestDistance = math.huge
        local playerPos = player.Character.HumanoidRootPart.Position
        
        for _, obj in pairs(espObjects) do
            if obj.target and obj.target:FindFirstChild("HumanoidRootPart") then
                local targetPos = obj.target.HumanoidRootPart.Position
                local dist = (targetPos - playerPos).Magnitude
                
                if dist < closestDistance and dist < 100 then
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

-- ================ UPDATE LOOPS (Optimized) ================
-- Update ESP every 2 seconds (reduced from 1 second)
spawn(function()
    while true do
        if espEnabled then
            updateESP()
        end
        task.wait(2)
    end
end)

-- Update player count every 2 seconds
spawn(function()
    while true do
        local count = #game:GetService("Players"):GetPlayers()
        playerCount.Text = "PLAYERS: " .. count
        task.wait(2)
    end
end)

-- Character respawn handling
player.CharacterAdded:Connect(function(newChar)
    task.wait(1)
    if speedBoost and newChar:FindFirstChild("Humanoid") then
        newChar.Humanoid.WalkSpeed = 50
    end
    if infiniteAmmo then
        setupInfiniteAmmo()
    end
    statusText.Text = "CHARACTER: RESPAWNED"
    task.wait(1)
    statusText.Text = "STATUS: READY"
end)

-- Initialize
print("✅ Galactic Scripts - Trap N Bang Loaded!")
statusText.Text = "STATUS: READY"
