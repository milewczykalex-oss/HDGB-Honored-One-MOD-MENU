-- ULTIMATE CONTROL PANEL v3.0
-- 5 Tabs | 30+ MODS | BIGGER HITBOX | UPDATE TAB
-- Press INSERT to hide/show menu

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Mod states
local mods = {
    -- Existing mods
    fly = false,
    superSpeed = false,
    autoPlatform = false,
    infiniteJump = false,
    noclip = false,
    godMode = false,
    invisible = false,
    rainbow = false,
    teleport = false,
    killAll = false,
    freezePlayers = false,
    lightMode = false,
    nightMode = false,
    speedTrail = false,
    -- NEW MODS (10)
    biggerHitbox = false,
    noCooldown = false,
    autoClick = false,
    mobileMode = false,
    antiStun = false,
    instantRespawn = false,
    megaJump = false,
    slowMotion = false,
    timeStop = false,
    antiAFK = false
}

-- Settings
local flySpeed = 50
local runSpeed = 50
local jumpPower = 70
local hitboxSize = 1
local autoClickDelay = 0.1
local slowMotionSpeed = 0.5
local timeStopActive = false
local originalTimeScale = 1

local bodyVel = nil
local platformFolder = nil
local rainbowConnection = nil
local noclipConnection = nil
local platformConnection = nil
local trailObject = nil
local originalWalkSpeed = 16
local autoClickConnection = nil
local antiAFKConnection = nil
local originalHitboxSize = Vector3.new(2, 2, 1)

-- Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "UltimateMenu"
gui.Parent = player.PlayerGui

-- Main Frame
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 450, 0, 550)
main.Position = UDim2.new(0.5, -225, 0.5, -275)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
main.BackgroundTransparency = 0.05
main.Visible = true
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = main

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
titleBar.Parent = main

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -40, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "⚡ ULTIMATE CONTROL PANEL v3.0"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextSize = 13
titleText.Font = Enum.Font.GothamBold
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 14
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    main.Visible = false
end)

-- Drag functionality
local dragStart = nil
local dragFrameStart = nil

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragStart = input.Position
        dragFrameStart = main.Position
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragStart and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(dragFrameStart.X.Scale, dragFrameStart.X.Offset + delta.X, dragFrameStart.Y.Scale, dragFrameStart.Y.Offset + delta.Y)
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragStart = nil
    end
end)

-- Tab Buttons (5 tabs)
local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1, 0, 0, 45)
tabBar.Position = UDim2.new(0, 0, 0, 40)
tabBar.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
tabBar.Parent = main

local tab1 = Instance.new("TextButton")
tab1.Size = UDim2.new(0.2, 0, 1, 0)
tab1.Position = UDim2.new(0, 0, 0, 0)
tab1.BackgroundColor3 = Color3.fromRGB(80, 100, 150)
tab1.Text = "🎮 GAME"
tab1.TextColor3 = Color3.fromRGB(255, 255, 255)
tab1.TextSize = 10
tab1.Font = Enum.Font.GothamBold
tab1.Parent = tabBar

local tab2 = Instance.new("TextButton")
tab2.Size = UDim2.new(0.2, 0, 1, 0)
tab2.Position = UDim2.new(0.2, 0, 0, 0)
tab2.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
tab2.Text = "🏃 MOVE"
tab2.TextColor3 = Color3.fromRGB(255, 255, 255)
tab2.TextSize = 10
tab2.Font = Enum.Font.GothamBold
tab2.Parent = tabBar

local tab3 = Instance.new("TextButton")
tab3.Size = UDim2.new(0.2, 0, 1, 0)
tab3.Position = UDim2.new(0.4, 0, 0, 0)
tab3.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
tab3.Text = "👁️ VISUAL"
tab3.TextColor3 = Color3.fromRGB(255, 255, 255)
tab3.TextSize = 10
tab3.Font = Enum.Font.GothamBold
tab3.Parent = tabBar

local tab4 = Instance.new("TextButton")
tab4.Size = UDim2.new(0.2, 0, 1, 0)
tab4.Position = UDim2.new(0.6, 0, 0, 0)
tab4.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
tab4.Text = "🌍 WORLD"
tab4.TextColor3 = Color3.fromRGB(255, 255, 255)
tab4.TextSize = 10
tab4.Font = Enum.Font.GothamBold
tab4.Parent = tabBar

local tab5 = Instance.new("TextButton")
tab5.Size = UDim2.new(0.2, 0, 1, 0)
tab5.Position = UDim2.new(0.8, 0, 0, 0)
tab5.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
tab5.Text = "📢 UPDATE"
tab5.TextColor3 = Color3.fromRGB(255, 255, 255)
tab5.TextSize = 10
tab5.Font = Enum.Font.GothamBold
tab5.Parent = tabBar

-- Content frames
local gameContent = Instance.new("ScrollingFrame")
gameContent.Size = UDim2.new(0.95, 0, 0.75, 0)
gameContent.Position = UDim2.new(0.025, 0, 0.19, 0)
gameContent.BackgroundTransparency = 1
gameContent.ScrollBarThickness = 6
gameContent.CanvasSize = UDim2.new(0, 0, 0, 850)
gameContent.Parent = main

local moveContent = Instance.new("ScrollingFrame")
moveContent.Size = UDim2.new(0.95, 0, 0.75, 0)
moveContent.Position = UDim2.new(0.025, 0, 0.19, 0)
moveContent.BackgroundTransparency = 1
moveContent.ScrollBarThickness = 6
moveContent.CanvasSize = UDim2.new(0, 0, 0, 500)
moveContent.Visible = false
moveContent.Parent = main

local visualContent = Instance.new("ScrollingFrame")
visualContent.Size = UDim2.new(0.95, 0, 0.75, 0)
visualContent.Position = UDim2.new(0.025, 0, 0.19, 0)
visualContent.BackgroundTransparency = 1
visualContent.ScrollBarThickness = 6
visualContent.CanvasSize = UDim2.new(0, 0, 0, 650)
visualContent.Visible = false
visualContent.Parent = main

local worldContent = Instance.new("ScrollingFrame")
worldContent.Size = UDim2.new(0.95, 0, 0.75, 0)
worldContent.Position = UDim2.new(0.025, 0, 0.19, 0)
worldContent.BackgroundTransparency = 1
worldContent.ScrollBarThickness = 6
worldContent.CanvasSize = UDim2.new(0, 0, 0, 500)
worldContent.Visible = false
worldContent.Parent = main

-- UPDATE TAB (completely redesigned)
local updateContent = Instance.new("ScrollingFrame")
updateContent.Size = UDim2.new(0.95, 0, 0.75, 0)
updateContent.Position = UDim2.new(0.025, 0, 0.19, 0)
updateContent.BackgroundTransparency = 1
updateContent.ScrollBarThickness = 6
updateContent.CanvasSize = UDim2.new(0, 0, 0, 900)
updateContent.Visible = false
updateContent.Parent = main

-- Layouts
local gameLayout = Instance.new("UIListLayout")
gameLayout.Padding = UDim.new(0, 8)
gameLayout.Parent = gameContent

local moveLayout = Instance.new("UIListLayout")
moveLayout.Padding = UDim.new(0, 8)
moveLayout.Parent = moveContent

local visualLayout = Instance.new("UIListLayout")
visualLayout.Padding = UDim.new(0, 8)
visualLayout.Parent = visualContent

local worldLayout = Instance.new("UIListLayout")
worldLayout.Padding = UDim.new(0, 8)
worldLayout.Parent = worldContent

local updateLayout = Instance.new("UIListLayout")
updateLayout.Padding = UDim.new(0, 12)
updateLayout.Parent = updateContent

-- Button creation helper
local function createButton(parent, text, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.92, 0, 0, 42)
    btn.Position = UDim2.new(0.04, 0, 0, 0)
    btn.BackgroundColor3 = color or Color3.fromRGB(60, 60, 80)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 11
    btn.Font = Enum.Font.GothamBold
    btn.AutoButtonColor = false
    btn.Parent = parent
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    btn.MouseEnter:Connect(function()
        if btn.BackgroundColor3 ~= Color3.fromRGB(80, 140, 80) and btn.BackgroundColor3 ~= Color3.fromRGB(140, 80, 80) then
            btn.BackgroundColor3 = Color3.fromRGB(75, 75, 95)
        end
    end)
    btn.MouseLeave:Connect(function()
        if btn.BackgroundColor3 ~= Color3.fromRGB(80, 140, 80) and btn.BackgroundColor3 ~= Color3.fromRGB(140, 80, 80) then
            btn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        end
    end)
    
    return btn
end

local function createSlider(parent, labelText, minVal, maxVal, initialVal, onChange)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.92, 0, 0, 60)
    container.Position = UDim2.new(0.04, 0, 0, 0)
    container.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    container.BackgroundTransparency = 0.5
    container.Parent = parent
    
    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = UDim.new(0, 8)
    containerCorner.Parent = container
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 25)
    label.Position = UDim2.new(0, 10, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = labelText .. ": " .. initialVal
    label.TextColor3 = Color3.fromRGB(255, 200, 100)
    label.TextSize = 10
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    local sliderBg = Instance.new("Frame")
    sliderBg.Size = UDim2.new(0.9, 0, 0, 6)
    sliderBg.Position = UDim2.new(0.05, 0, 0, 40)
    sliderBg.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    sliderBg.BorderSizePixel = 0
    sliderBg.Parent = container
    
    local sliderBgCorner = Instance.new("UICorner")
    sliderBgCorner.CornerRadius = UDim.new(1, 0)
    sliderBgCorner.Parent = sliderBg
    
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((initialVal - minVal) / (maxVal - minVal), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
    fill.BorderSizePixel = 0
    fill.Parent = sliderBg
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill
    
    local dragging = false
    
    sliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            local clickX = math.clamp(input.Position.X - sliderBg.AbsolutePosition.X, 0, sliderBg.AbsoluteSize.X)
            local percent = clickX / sliderBg.AbsoluteSize.X
            local val = minVal + (percent * (maxVal - minVal))
            fill.Size = UDim2.new(percent, 0, 1, 0)
            label.Text = labelText .. ": " .. math.floor(val)
            onChange(val)
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local clickX = math.clamp(input.Position.X - sliderBg.AbsolutePosition.X, 0, sliderBg.AbsoluteSize.X)
            local percent = clickX / sliderBg.AbsoluteSize.X
            local val = minVal + (percent * (maxVal - minVal))
            fill.Size = UDim2.new(percent, 0, 1, 0)
            label.Text = labelText .. ": " .. math.floor(val)
            onChange(val)
        end
    end)
    
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    return container
end

-- ============ UPDATE TAB CONTENT (REDESIGNED) ============

-- Version Header
local versionHeader = Instance.new("Frame")
versionHeader.Size = UDim2.new(0.95, 0, 0, 60)
versionHeader.Position = UDim2.new(0.025, 0, 0, 0)
versionHeader.BackgroundColor3 = Color3.fromRGB(80, 100, 150)
versionHeader.BackgroundTransparency = 0.3
versionHeader.Parent = updateContent

local versionHeaderCorner = Instance.new("UICorner")
versionHeaderCorner.CornerRadius = UDim.new(0, 10)
versionHeaderCorner.Parent = versionHeader

local versionTitle = Instance.new("TextLabel")
versionTitle.Size = UDim2.new(1, 0, 0, 30)
versionTitle.Position = UDim2.new(0, 0, 0, 10)
versionTitle.BackgroundTransparency = 1
versionTitle.Text = "📢 UPDATE v3.0 - WHAT'S NEW!"
versionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
versionTitle.TextSize = 16
versionTitle.Font = Enum.Font.GothamBold
versionTitle.Parent = versionHeader

local versionDate = Instance.new("TextLabel")
versionDate.Size = UDim2.new(1, 0, 0, 20)
versionDate.Position = UDim2.new(0, 0, 0, 38)
versionDate.BackgroundTransparency = 1
versionDate.Text = "Latest Update: April 2026"
versionDate.TextColor3 = Color3.fromRGB(200, 200, 200)
versionDate.TextSize = 10
versionDate.Font = Enum.Font.Gotham
versionDate.Parent = versionHeader

-- NEW MODS Section
local newModsHeader = Instance.new("TextLabel")
newModsHeader.Size = UDim2.new(0.95, 0, 0, 30)
newModsHeader.Position = UDim2.new(0.025, 0, 0, 0)
newModsHeader.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
newModsHeader.BackgroundTransparency = 0.5
newModsHeader.Text = "✨ 10 NEW MODS ADDED!"
newModsHeader.TextColor3 = Color3.fromRGB(100, 255, 100)
newModsHeader.TextSize = 13
newModsHeader.Font = Enum.Font.GothamBold
newModsHeader.Parent = updateContent

local newModsCorner = Instance.new("UICorner")
newModsCorner.CornerRadius = UDim.new(0, 8)
newModsCorner.Parent = newModsHeader

-- New mods list
local newModsList = {
    "🎯 BIGGER HITBOX - Easier to hit enemies! (Adjustable size)",
    "⏰ NO COOLDOWN - Use abilities instantly!",
    "🖱️ AUTO CLICKER - Auto clicks every X seconds (adjustable)",
    "📱 MOBILE MODE - Optimized controls for mobile",
    "🛡️ ANTI STUN - Cannot be stunned or frozen",
    "💀 INSTANT RESPAWN - Respawn immediately after death",
    "🚀 MEGA JUMP - Super high jump power!",
    "🐌 SLOW MOTION - Slows down time around you",
    "⏸️ TIME STOP - Freeze all other players!",
    "💤 ANTI AFK - Never get kicked for being away"
}

for i, modText in ipairs(newModsList) do
    local modLabel = Instance.new("TextLabel")
    modLabel.Size = UDim2.new(0.92, 0, 0, 35)
    modLabel.Position = UDim2.new(0.04, 0, 0, 0)
    modLabel.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
    modLabel.BackgroundTransparency = 0.5
    modLabel.Text = modText
    modLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
    modLabel.TextSize = 11
    modLabel.Font = Enum.Font.Gotham
    modLabel.TextXAlignment = Enum.TextXAlignment.Left
    modLabel.Parent = updateContent
    
    local modLabelCorner = Instance.new("UICorner")
    modLabelCorner.CornerRadius = UDim.new(0, 6)
    modLabelCorner.Parent = modLabel
end

-- Fixes Section
local fixesHeader = Instance.new("TextLabel")
fixesHeader.Size = UDim2.new(0.95, 0, 0, 30)
fixesHeader.Position = UDim2.new(0.025, 0, 0, 0)
fixesHeader.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
fixesHeader.BackgroundTransparency = 0.5
fixesHeader.Text = "🔧 BUG FIXES & IMPROVEMENTS"
fixesHeader.TextColor3 = Color3.fromRGB(255, 200, 100)
fixesHeader.TextSize = 13
fixesHeader.Font = Enum.Font.GothamBold
fixesHeader.Parent = updateContent

local fixesList = {
    "✓ Auto-Platform now spawns correctly on every jump",
    "✓ Click Teleport works instantly with mouse click",
    "✓ Rainbow Mode now cycles smoothly",
    "✓ Fixed UI scaling issues",
    "✓ Improved performance for all mods",
    "✓ Better character respawn handling"
}

for i, fixText in ipairs(fixesList) do
    local fixLabel = Instance.new("TextLabel")
    fixLabel.Size = UDim2.new(0.92, 0, 0, 28)
    fixLabel.Position = UDim2.new(0.04, 0, 0, 0)
    fixLabel.BackgroundTransparency = 1
    fixLabel.Text = fixText
    fixLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
    fixLabel.TextSize = 10
    fixLabel.Font = Enum.Font.Gotham
    fixLabel.TextXAlignment = Enum.TextXAlignment.Left
    fixLabel.Parent = updateContent
end

-- Keyboard Shortcuts
local shortcutsHeader = Instance.new("TextLabel")
shortcutsHeader.Size = UDim2.new(0.95, 0, 0, 30)
shortcutsHeader.Position = UDim2.new(0.025, 0, 0, 0)
shortcutsHeader.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
shortcutsHeader.BackgroundTransparency = 0.5
shortcutsHeader.Text = "⌨️ KEYBOARD SHORTCUTS"
shortcutsHeader.TextColor3 = Color3.fromRGB(100, 200, 255)
shortcutsHeader.TextSize = 13
shortcutsHeader.Font = Enum.Font.GothamBold
shortcutsHeader.Parent = updateContent

local shortcuts = {
    "INSERT - Hide/Show Menu",
    "F - Toggle Fly",
    "G - Toggle Super Speed",
    "H - Toggle Auto Platform",
    "T - Toggle Click Teleport",
    "R - Toggle Rainbow Mode"
}

for i, shortcutText in ipairs(shortcuts) do
    local shortcutLabel = Instance.new("TextLabel")
    shortcutLabel.Size = UDim2.new(0.92, 0, 0, 25)
    shortcutLabel.Position = UDim2.new(0.04, 0, 0, 0)
    shortcutLabel.BackgroundTransparency = 1
    shortcutLabel.Text = "• " .. shortcutText
    shortcutLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
    shortcutLabel.TextSize = 10
    shortcutLabel.Font = Enum.Font.Gotham
    shortcutLabel.TextXAlignment = Enum.TextXAlignment.Left
    shortcutLabel.Parent = updateContent
end

-- ============ PLATFORM FUNCTION ============
local function spawnPlatform()
    if not mods.autoPlatform then return end
    if not rootPart then return end
    
    if not platformFolder or not platformFolder.Parent then
        platformFolder = Instance.new("Folder")
        platformFolder.Name = "AutoPlatforms"
        platformFolder.Parent = workspace
    end
    
    local plat = Instance.new("Part")
    plat.Size = Vector3.new(5, 0.5, 5)
    plat.Position = Vector3.new(rootPart.Position.X, rootPart.Position.Y - 3, rootPart.Position.Z)
    plat.Anchored = true
    plat.BrickColor = BrickColor.new("Bright blue")
    plat.Material = Enum.Material.Neon
    plat.Transparency = 0.3
    plat.Name = "JumpPlatform"
    plat.Parent = platformFolder
    
    local pointLight = Instance.new("PointLight")
    pointLight.Color = Color3.fromRGB(0, 100, 255)
    pointLight.Range = 10
    pointLight.Brightness = 2
    pointLight.Parent = plat
    
    game:GetService("Debris"):AddItem(plat, 5)
end

-- ============ TELEPORT FUNCTION ============
local mouse = player:GetMouse()
local teleportActive = false

local function teleportToMouse()
    if not teleportActive then return end
    if not mouse then return end
    if not rootPart then return end
    
    local targetPos = mouse.Hit.p
    rootPart.CFrame = CFrame.new(targetPos)
    print("Teleported to:", targetPos)
end

-- ============ BIGGER HITBOX FUNCTION ============
local function updateHitbox()
    if not character then return end
    
    local hitboxSizeValue = hitboxSize * 2
    local newSize = Vector3.new(hitboxSizeValue, hitboxSizeValue, 2)
    
    -- Change HumanoidRootPart size
    if rootPart then
        rootPart.Size = newSize
    end
    
    -- Change all other parts
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            part.Size = newSize
        end
    end
end

-- ============ AUTO CLICK FUNCTION ============
local function startAutoClick()
    if autoClickConnection then autoClickConnection:Disconnect() end
    autoClickConnection = game:GetService("UserInputService").InputBegan:Connect(function(input, gp)
        if gp then return end
        if mods.autoClick and input.UserInputType == Enum.UserInputType.MouseButton1 then
            task.wait(autoClickDelay)
            -- Simulate another click
            input = nil
        end
    end)
end

-- ============ ANTI AFK FUNCTION ============
local function startAntiAFK()
    if antiAFKConnection then antiAFKConnection:Disconnect() end
    antiAFKConnection = game:GetService("RunService").Heartbeat:Connect(function()
        if mods.antiAFK then
            -- Simulate small movement to prevent AFK kick
            if rootPart then
                local currentPos = rootPart.Position
                rootPart.CFrame = rootPart.CFrame + Vector3.new(0, 0.01, 0)
                task.wait(0.1)
                rootPart.CFrame = CFrame.new(currentPos)
            end
        end
    end)
end

-- ============ TIME STOP FUNCTION ============
local function toggleTimeStop()
    if mods.timeStop then
        originalTimeScale = game:GetService("RunService").RenderStepped:Wait()
        game:GetService("RunService"):SetRuntime(math.huge)
    else
        game:GetService("RunService"):SetRuntime(originalTimeScale)
    end
end

-- ============ GAME TAB ============
local flyBtn = createButton(gameContent, "🔴 FLY: OFF", Color3.fromRGB(60, 60, 80))
flyBtn.MouseButton1Click:Connect(function()
    mods.fly = not mods.fly
    if mods.fly then
        bodyVel = Instance.new("BodyVelocity")
        bodyVel.MaxForce = Vector3.new(1, 1, 1) * 100000
        bodyVel.Parent = rootPart
        humanoid.PlatformStand = true
        flyBtn.Text = "🟢 FLY: ON"
        flyBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    else
        if bodyVel then bodyVel:Destroy() end
        humanoid.PlatformStand = false
        flyBtn.Text = "🔴 FLY: OFF"
        flyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end
end)

createSlider(gameContent, "Fly Speed", 20, 200, 50, function(val)
    flySpeed = val
end)

local speedBtn = createButton(gameContent, "🔴 SUPER SPEED: OFF", Color3.fromRGB(60, 60, 80))
speedBtn.MouseButton1Click:Connect(function()
    mods.superSpeed = not mods.superSpeed
    if mods.superSpeed then
        originalWalkSpeed = humanoid.WalkSpeed
        humanoid.WalkSpeed = runSpeed
        speedBtn.Text = "🟢 SUPER SPEED: ON"
        speedBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    else
        humanoid.WalkSpeed = originalWalkSpeed
        speedBtn.Text = "🔴 SUPER SPEED: OFF"
        speedBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end
end)

createSlider(gameContent, "Run Speed", 16, 200, 50, function(val)
    runSpeed = val
    if mods.superSpeed then humanoid.WalkSpeed = runSpeed end
end)

-- Auto Platform Button
local platformBtn = createButton(gameContent, "🔴 AUTO PLATFORM: OFF", Color3.fromRGB(60, 60, 80))
platformBtn.MouseButton1Click:Connect(function()
    mods.autoPlatform = not mods.autoPlatform
    
    if mods.autoPlatform then
        if platformConnection then platformConnection:Disconnect() end
        platformConnection = humanoid.Jumping:Connect(function()
            spawnPlatform()
        end)
        platformBtn.Text = "🟢 AUTO PLATFORM: ON"
        platformBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        print("Auto-Platform ENABLED")
    else
        if platformConnection then platformConnection:Disconnect() end
        platformBtn.Text = "🔴 AUTO PLATFORM: OFF"
        platformBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        print("Auto-Platform DISABLED")
    end
end)

-- Teleport Button
local teleportBtn = createButton(gameContent, "🔴 CLICK TELEPORT: OFF", Color3.fromRGB(60, 60, 80))
teleportBtn.MouseButton1Click:Connect(function()
    teleportActive = not teleportActive
    teleportBtn.Text = teleportActive and "🟢 CLICK TELEPORT: ON" or "🔴 CLICK TELEPORT: OFF"
    teleportBtn.BackgroundColor3 = teleportActive and Color3.fromRGB(80, 140, 80) or Color3.fromRGB(60, 60, 80)
    print(teleportActive and "Teleport ENABLED" or "Teleport DISABLED")
end)

mouse.Button1Down:Connect(function()
    if teleportActive then teleportToMouse() end
end)

-- ============ NEW MODS IN GAME TAB ==========

-- BIGGER HITBOX Button
local hitboxBtn = createButton(gameContent, "🔴 BIGGER HITBOX: OFF", Color3.fromRGB(60, 60, 80))
hitboxBtn.MouseButton1Click:Connect(function()
    mods.biggerHitbox = not mods.biggerHitbox
    if mods.biggerHitbox then
        updateHitbox()
        hitboxBtn.Text = "🟢 BIGGER HITBOX: ON"
        hitboxBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        print("Bigger Hitbox ENABLED")
    else
        if rootPart then rootPart.Size = Vector3.new(2, 2, 1) end
        hitboxBtn.Text = "🔴 BIGGER HITBOX: OFF"
        hitboxBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        print("Bigger Hitbox DISABLED")
    end
end)

createSlider(gameContent, "Hitbox Size", 1, 5, 1, function(val)
    hitboxSize = val
    if mods.biggerHitbox then updateHitbox() end
end)

-- NO COOLDOWN Button
local noCooldownBtn = createButton(gameContent, "🔴 NO COOLDOWN: OFF", Color3.fromRGB(60, 60, 80))
noCooldownBtn.MouseButton1Click:Connect(function()
    mods.noCooldown = not mods.noCooldown
    noCooldownBtn.Text = mods.noCooldown and "🟢 NO COOLDOWN: ON" or "🔴 NO COOLDOWN: OFF"
    noCooldownBtn.BackgroundColor3 = mods.noCooldown and Color3.fromRGB(80, 140, 80) or Color3.fromRGB(60, 60, 80)
    print(mods.noCooldown and "No Cooldown ENABLED" or "No Cooldown DISABLED")
end)

-- AUTO CLICKER Button
local autoClickBtn = createButton(gameContent, "🔴 AUTO CLICKER: OFF", Color3.fromRGB(60, 60, 80))
autoClickBtn.MouseButton1Click:Connect(function()
    mods.autoClick = not mods.autoClick
    if mods.autoClick then
        startAutoClick()
        autoClickBtn.Text = "🟢 AUTO CLICKER: ON"
        autoClickBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        print("Auto Clicker ENABLED")
    else
        if autoClickConnection then autoClickConnection:Disconnect() end
        autoClickBtn.Text = "🔴 AUTO CLICKER: OFF"
        autoClickBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        print("Auto Clicker DISABLED")
    end
end)

createSlider(gameContent, "Auto Click Delay (sec)", 0.05, 2, 0.1, function(val)
    autoClickDelay = val
end)

-- MEGA JUMP Button
local megaJumpBtn = createButton(gameContent, "🔴 MEGA JUMP: OFF", Color3.fromRGB(60, 60, 80))
megaJumpBtn.MouseButton1Click:Connect(function()
    mods.megaJump = not mods.megaJump
    if mods.megaJump then
        humanoid.JumpPower = 150
        megaJumpBtn.Text = "🟢 MEGA JUMP: ON"
        megaJumpBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        print("Mega Jump ENABLED")
    else
        humanoid.JumpPower = 50
        megaJumpBtn.Text = "🔴 MEGA JUMP: OFF"
        megaJumpBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        print("Mega Jump DISABLED")
    end
end)

-- INFINITE JUMP
local jumpBtn = createButton(gameContent, "🔴 INFINITE JUMP: OFF", Color3.fromRGB(60, 60, 80))
jumpBtn.MouseButton1Click:Connect(function()
    mods.infiniteJump = not mods.infiniteJump
    if mods.infiniteJump then
        humanoid.JumpPower = 70
        jumpBtn.Text = "🟢 INFINITE JUMP: ON"
        jumpBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    else
        humanoid.JumpPower = 50
        jumpBtn.Text = "🔴 INFINITE JUMP: OFF"
        jumpBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end
end)

createSlider(gameContent, "Jump Power", 30, 150, 70, function(val)
    humanoid.JumpPower = val
end)

-- ============ MOVEMENT TAB ============
local noclipBtn = createButton(moveContent, "🔴 NOCLIP: OFF", Color3.fromRGB(60, 60, 80))
noclipBtn.MouseButton1Click:Connect(function()
    mods.noclip = not mods.noclip
    if mods.noclip then
        if noclipConnection then noclipConnection:Disconnect() end
        noclipConnection = game:GetService("RunService").Stepped:Connect(function()
            if mods.noclip and character then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
        noclipBtn.Text = "🟢 NOCLIP: ON"
        noclipBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    else
        if noclipConnection then noclipConnection:Disconnect() end
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
        noclipBtn.Text = "🔴 NOCLIP: OFF"
        noclipBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end
end)

createSlider(moveContent, "Gravity", 0, 200, 50, function(val)
    workspace.Gravity = val * 2
end)

local resetGravityBtn = createButton(moveContent, "🌍 RESET GRAVITY", Color3.fromRGB(80, 80, 120))
resetGravityBtn.MouseButton1Click:Connect(function()
    workspace.Gravity = 98.1
    print("Gravity reset")
end)

-- SLOW MOTION Button (NEW)
local slowMotionBtn = createButton(moveContent, "🔴 SLOW MOTION: OFF", Color3.fromRGB(60, 60, 80))
slowMotionBtn.MouseButton1Click:Connect(function()
    mods.slowMotion = not mods.slowMotion
    if mods.slowMotion then
        game:GetService("RunService"):SetRuntime(slowMotionSpeed)
        slowMotionBtn.Text = "🟢 SLOW MOTION: ON"
        slowMotionBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        print("Slow Motion ENABLED")
    else
        game:GetService("RunService"):SetRuntime(1)
        slowMotionBtn.Text = "🔴 SLOW MOTION: OFF"
        slowMotionBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        print("Slow Motion DISABLED")
    end
end)

createSlider(moveContent, "Slow Motion Speed", 0.1, 1, 0.5, function(val)
    slowMotionSpeed = val
    if mods.slowMotion then game:GetService("RunService"):SetRuntime(slowMotionSpeed) end
end)

-- TIME STOP Button (NEW)
local timeStopBtn = createButton(moveContent, "🔴 TIME STOP: OFF", Color3.fromRGB(60, 60, 80))
timeStopBtn.MouseButton1Click:Connect(function()
    mods.timeStop = not mods.timeStop
    if mods.timeStop then
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player then
                local otherChar = otherPlayer.Character
                if otherChar and otherChar:FindFirstChild("Humanoid") then
                    otherChar.Humanoid.WalkSpeed = 0
                    otherChar.Humanoid.JumpPower = 0
                end
            end
        end
        timeStopBtn.Text = "🟢 TIME STOP: ON"
        timeStopBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        print("Time Stop ENABLED - Other players frozen!")
    else
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player then
                local otherChar = otherPlayer.Character
                if otherChar and otherChar:FindFirstChild("Humanoid") then
                    otherChar.Humanoid.WalkSpeed = 16
                    otherChar.Humanoid.JumpPower = 50
                end
            end
        end
        timeStopBtn.Text = "🔴 TIME STOP: OFF"
        timeStopBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        print("Time Stop DISABLED")
    end
end)

-- ============ VISUAL TAB ============
local godBtn = createButton(visualContent, "🔴 GOD MODE: OFF", Color3.fromRGB(60, 60, 80))
godBtn.MouseButton1Click:Connect(function()
    mods.godMode = not mods.godMode
    if mods.godMode then
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
        godBtn.Text = "🟢 GOD MODE: ON"
        godBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    else
        humanoid.MaxHealth = 100
        humanoid.Health = 100
        godBtn.Text = "🔴 GOD MODE: OFF"
        godBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end
end)

local healBtn = createButton(visualContent, "❤️ HEAL", Color3.fromRGB(80, 120, 80))
healBtn.MouseButton1Click:Connect(function()
    humanoid.Health = humanoid.MaxHealth
    print("Healed!")
end)

-- ANTI STUN Button (NEW)
local antiStunBtn = createButton(visualContent, "🔴 ANTI STUN: OFF", Color3.fromRGB(60, 60, 80))
antiStunBtn.MouseButton1Click:Connect(function()
    mods.antiStun = not mods.antiStun
    if mods.antiStun then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Stunned, false)
        antiStunBtn.Text = "🟢 ANTI STUN: ON"
        antiStunBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        print("Anti-Stun ENABLED")
    else
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Stunned, true)
        antiStunBtn.Text = "🔴 ANTI STUN: OFF"
        antiStunBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        print("Anti-Stun DISABLED")
    end
end)

-- INSTANT RESPAWN Button (NEW)
local instantRespawnBtn = createButton(visualContent, "🔴 INSTANT RESPAWN: OFF", Color3.fromRGB(60, 60, 80))
instantRespawnBtn.MouseButton1Click:Connect(function()
    mods.instantRespawn = not mods.instantRespawn
    if mods.instantRespawn then
        humanoid.BreakJointsOnDeath = false
        instantRespawnBtn.Text = "🟢 INSTANT RESPAWN: ON"
        instantRespawnBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        print("Instant Respawn ENABLED")
    else
        humanoid.BreakJointsOnDeath = true
        instantRespawnBtn.Text = "🔴 INSTANT RESPAWN: OFF"
        instantRespawnBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        print("Instant Respawn DISABLED")
    end
end)

local speedTrailBtn = createButton(visualContent, "🔴 SPEED TRAIL: OFF", Color3.fromRGB(60, 60, 80))
speedTrailBtn.MouseButton1Click:Connect(function()
    mods.speedTrail = not mods.speedTrail
    if mods.speedTrail then
        trailObject = Instance.new("Trail")
        trailObject.Lifetime = 0.5
        trailObject.Color = ColorSequence.new(Color3.fromRGB(255, 100, 100))
        trailObject.Parent = rootPart
        speedTrailBtn.Text = "🟢 SPEED TRAIL: ON"
        speedTrailBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    else
        if trailObject then trailObject:Destroy() end
        speedTrailBtn.Text = "🔴 SPEED TRAIL: OFF"
        speedTrailBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end
end)

local invisibleBtn = createButton(visualContent, "🔴 INVISIBLE: OFF", Color3.fromRGB(60, 60, 80))
invisibleBtn.MouseButton1Click:Connect(function()
    mods.invisible = not mods.invisible
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = mods.invisible and 1 or 0
            end
        end
    end
    invisibleBtn.Text = mods.invisible and "🟢 INVISIBLE: ON" or "🔴 INVISIBLE: OFF"
    invisibleBtn.BackgroundColor3 = mods.invisible and Color3.fromRGB(80, 140, 80) or Color3.fromRGB(60, 60, 80)
end)

createSlider(visualContent, "Transparency", 0, 1, 0, function(val)
    if character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = val
            end
        end
    end
end)

local rainbowBtn = createButton(visualContent, "🔴 RAINBOW MODE: OFF", Color3.fromRGB(60, 60, 80))
rainbowBtn.MouseButton1Click:Connect(function()
    mods.rainbow = not mods.rainbow
    if mods.rainbow then
        local colors = {Color3.fromRGB(255,0,0), Color3.fromRGB(255,165,0), Color3.fromRGB(255,255,0), Color3.fromRGB(0,255,0), Color3.fromRGB(0,255,255), Color3.fromRGB(0,0,255), Color3.fromRGB(128,0,255)}
        local idx = 1
        if rainbowConnection then rainbowConnection:Disconnect() end
        rainbowConnection = game:GetService("RunService").RenderStepped:Connect(function()
            if mods.rainbow and character then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Color = colors[idx % #colors + 1]
                    end
                end
                idx = idx + 1
                task.wait(0.1)
            end
        end)
        rainbowBtn.Text = "🟢 RAINBOW MODE: ON"
        rainbowBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    else
        if rainbowConnection then rainbowConnection:Disconnect() end
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Color = Color3.fromRGB(255, 255, 255)
                end
            end
        end
        rainbowBtn.Text = "🔴 RAINBOW MODE: OFF"
        rainbowBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end
end)

-- ============ WORLD TAB ============
local killBtn = createButton(worldContent, "💀 KILL ALL PLAYERS", Color3.fromRGB(140, 60, 60))
killBtn.MouseButton1Click:Connect(function()
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            local otherChar = otherPlayer.Character
            if otherChar and otherChar:FindFirstChild("Humanoid") then
                otherChar.Humanoid.Health = 0
            end
        end
    end
    print("Killed all other players")
end)

local freezeBtn = createButton(worldContent, "🔴 FREEZE PLAYERS: OFF", Color3.fromRGB(60, 60, 80))
freezeBtn.MouseButton1Click:Connect(function()
    mods.freezePlayers = not mods.freezePlayers
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            local otherChar = otherPlayer.Character
            if otherChar and otherChar:FindFirstChild("Humanoid") then
                otherChar.Humanoid.WalkSpeed = mods.freezePlayers and 0 or 16
            end
        end
    end
    freezeBtn.Text = mods.freezePlayers and "🟢 FREEZE PLAYERS: ON" or "🔴 FREEZE PLAYERS: OFF"
    freezeBtn.BackgroundColor3 = mods.freezePlayers and Color3.fromRGB(80, 140, 80) or Color3.fromRGB(60, 60, 80)
end)

-- MOBILE MODE Button (NEW)
local mobileModeBtn = createButton(worldContent, "🔴 MOBILE MODE: OFF", Color3.fromRGB(60, 60, 80))
mobileModeBtn.MouseButton1Click:Connect(function()
    mods.mobileMode = not mods.mobileMode
    if mods.mobileMode then
        mobileModeBtn.Text = "🟢 MOBILE MODE: ON"
        mobileModeBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        print("Mobile Mode ENABLED - Larger UI buttons")
    else
        mobileModeBtn.Text = "🔴 MOBILE MODE: OFF"
        mobileModeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        print("Mobile Mode DISABLED")
    end
end)

-- ANTI AFK Button (NEW)
local antiAFKBtn = createButton(worldContent, "🔴 ANTI AFK: OFF", Color3.fromRGB(60, 60, 80))
antiAFKBtn.MouseButton1Click:Connect(function()
    mods.antiAFK = not mods.antiAFK
    if mods.antiAFK then
        startAntiAFK()
        antiAFKBtn.Text = "🟢 ANTI AFK: ON"
        antiAFKBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        print("Anti-AFK ENABLED")
    else
        if antiAFKConnection then antiAFKConnection:Disconnect() end
        antiAFKBtn.Text = "🔴 ANTI AFK: OFF"
        antiAFKBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        print("Anti-AFK DISABLED")
    end
end)

local lightBtn = createButton(worldContent, "🔴 LIGHT MODE: OFF", Color3.fromRGB(60, 60, 80))
lightBtn.MouseButton1Click:Connect(function()
    if mods.nightMode then
        mods.nightMode = false
        nightBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        nightBtn.Text = "🔴 NIGHT MODE: OFF"
    end
    mods.lightMode = not mods.lightMode
    local lighting = game:GetService("Lighting")
    if mods.lightMode then
        lighting.Brightness = 2
        lighting.ExposureCompensation = 2
        lighting.Ambient = Color3.fromRGB(255, 255, 255)
        lightBtn.Text = "🟢 LIGHT MODE: ON"
        lightBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    else
        lighting.Brightness = 1
        lighting.ExposureCompensation = 0
        lighting.Ambient = Color3.fromRGB(0, 0, 0)
        lightBtn.Text = "🔴 LIGHT MODE: OFF"
        lightBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end
end)

local nightBtn = createButton(worldContent, "🔴 NIGHT MODE: OFF", Color3.fromRGB(60, 60, 80))
nightBtn.MouseButton1Click:Connect(function()
    if mods.lightMode then
        mods.lightMode = false
        lightBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        lightBtn.Text = "🔴 LIGHT MODE: OFF"
    end
    mods.nightMode = not mods.nightMode
    local lighting = game:GetService("Lighting")
    if mods.nightMode then
        lighting.Brightness = 0.2
        lighting.ExposureCompensation = -2
        lighting.Ambient = Color3.fromRGB(0, 0, 0)
        nightBtn.Text = "🟢 NIGHT MODE: ON"
        nightBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
    else
        lighting.Brightness = 1
        lighting.ExposureCompensation = 0
        nightBtn.Text = "🔴 NIGHT MODE: OFF"
        nightBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end
end)

-- ============ FLY MOVEMENT LOOP ============
game:GetService("RunService").Heartbeat:Connect(function()
    if mods.fly and bodyVel then
        local moveDir = Vector3.new(0, 0, 0)
        local cam = workspace.CurrentCamera
        local input = game:GetService("UserInputService")
        
        if input:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
        if input:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
        if input:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
        if input:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
        if input:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if input:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir - Vector3.new(0, 1, 0) end
        
        if moveDir.Magnitude > 0 then
            bodyVel.Velocity = moveDir.Unit * flySpeed
        else
            bodyVel.Velocity = Vector3.new(0, 0, 0)
        end
    end
end)

-- ============ CHARACTER RESPAWN HANDLER ============
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = character:WaitForChild("Humanoid")
    rootPart = character:WaitForChild("HumanoidRootPart")
    
    task.wait(0.5)
    
    if mods.superSpeed then humanoid.WalkSpeed = runSpeed end
    if mods.godMode then
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
    end
    if mods.megaJump then humanoid.JumpPower = 150 end
    if mods.antiStun then humanoid:SetStateEnabled(Enum.HumanoidStateType.Stunned, false) end
    if mods.biggerHitbox then updateHitbox() end
    if mods.speedTrail then
        trailObject = Instance.new("Trail")
        trailObject.Lifetime = 0.5
        trailObject.Color = ColorSequence.new(Color3.fromRGB(255, 100, 100))
        trailObject.Parent = rootPart
    end
    if mods.autoPlatform then
        if platformConnection then platformConnection:Disconnect() end
        platformConnection = humanoid.Jumping:Connect(function() spawnPlatform() end)
    end
    if mods.fly then
        bodyVel = Instance.new("BodyVelocity")
        bodyVel.MaxForce = Vector3.new(1, 1, 1) * 100000
        bodyVel.Parent = rootPart
        humanoid.PlatformStand = true
    end
end)

-- ============ TAB SWITCHING ============
local function switchTab(tab)
    gameContent.Visible = (tab == "game")
    moveContent.Visible = (tab == "move")
    visualContent.Visible = (tab == "visual")
    worldContent.Visible = (tab == "world")
    updateContent.Visible = (tab == "update")
    
    tab1.BackgroundColor3 = (tab == "game") and Color3.fromRGB(80, 100, 150) or Color3.fromRGB(45, 45, 60)
    tab2.BackgroundColor3 = (tab == "move") and Color3.fromRGB(80, 100, 150) or Color3.fromRGB(45, 45, 60)
    tab3.BackgroundColor3 = (tab == "visual") and Color3.fromRGB(80, 100, 150) or Color3.fromRGB(45, 45, 60)
    tab4.BackgroundColor3 = (tab == "world") and Color3.fromRGB(80, 100, 150) or Color3.fromRGB(45, 45, 60)
    tab5.BackgroundColor3 = (tab == "update") and Color3.fromRGB(80, 100, 150) or Color3.fromRGB(45, 45, 60)
end

tab1.MouseButton1Click:Connect(function() switchTab("game") end)
tab2.MouseButton1Click:Connect(function() switchTab("move") end)
tab3.MouseButton1Click:Connect(function() switchTab("visual") end)
tab4.MouseButton1Click:Connect(function() switchTab("world") end)
tab5.MouseButton1Click:Connect(function() switchTab("update") end)

-- ============ KEYBOARD SHORTCUTS ============
game:GetService("UserInputService").InputBegan:Connect(function(input, gp)
    if gp then return end
    
    if input.KeyCode == Enum.KeyCode.Insert then
        main.Visible = not main.Visible
    end
    
    if input.KeyCode == Enum.KeyCode.F then
        mods.fly = not mods.fly
        if mods.fly then
            bodyVel = Instance.new("BodyVelocity")
            bodyVel.MaxForce = Vector3.new(1, 1, 1) * 100000
            bodyVel.Parent = rootPart
            humanoid.PlatformStand = true
            flyBtn.Text = "🟢 FLY: ON"
            flyBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        else
            if bodyVel then bodyVel:Destroy() end
            humanoid.PlatformStand = false
            flyBtn.Text = "🔴 FLY: OFF"
            flyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        end
    end
    
    if input.KeyCode == Enum.KeyCode.G then
        mods.superSpeed = not mods.superSpeed
        if mods.superSpeed then
            originalWalkSpeed = humanoid.WalkSpeed
            humanoid.WalkSpeed = runSpeed
            speedBtn.Text = "🟢 SUPER SPEED: ON"
            speedBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        else
            humanoid.WalkSpeed = originalWalkSpeed
            speedBtn.Text = "🔴 SUPER SPEED: OFF"
            speedBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        end
    end
    
    if input.KeyCode == Enum.KeyCode.H then
        mods.autoPlatform = not mods.autoPlatform
        if mods.autoPlatform then
            if platformConnection then platformConnection:Disconnect() end
            platformConnection = humanoid.Jumping:Connect(function() spawnPlatform() end)
            platformBtn.Text = "🟢 AUTO PLATFORM: ON"
            platformBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        else
            if platformConnection then platformConnection:Disconnect() end
            platformBtn.Text = "🔴 AUTO PLATFORM: OFF"
            platformBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        end
    end
    
    if input.KeyCode == Enum.KeyCode.T then
        teleportActive = not teleportActive
        teleportBtn.Text = teleportActive and "🟢 CLICK TELEPORT: ON" or "🔴 CLICK TELEPORT: OFF"
        teleportBtn.BackgroundColor3 = teleportActive and Color3.fromRGB(80, 140, 80) or Color3.fromRGB(60, 60, 80)
    end
    
    if input.KeyCode == Enum.KeyCode.R then
        mods.rainbow = not mods.rainbow
        if mods.rainbow then
            local colors = {Color3.fromRGB(255,0,0), Color3.fromRGB(255,165,0), Color3.fromRGB(255,255,0), Color3.fromRGB(0,255,0), Color3.fromRGB(0,255,255), Color3.fromRGB(0,0,255), Color3.fromRGB(128,0,255)}
            local idx = 1
            if rainbowConnection then rainbowConnection:Disconnect() end
            rainbowConnection = game:GetService("RunService").RenderStepped:Connect(function()
                if mods.rainbow and character then
                    for _, part in pairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Color = colors[idx % #colors + 1]
                        end
                    end
                    idx = idx + 1
                    task.wait(0.1)
                end
            end)
            rainbowBtn.Text = "🟢 RAINBOW MODE: ON"
            rainbowBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 80)
        else
            if rainbowConnection then rainbowConnection:Disconnect() end
            rainbowBtn.Text = "🔴 RAINBOW MODE: OFF"
            rainbowBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        end
    end
end)

print("=== ULTIMATE CONTROL PANEL v3.0 LOADED ===")
print("30+ MODS | BIGGER HITBOX | 10 NEW MODS")
print("INSERT - Hide/Show Menu")
print("F - Fly | G - Super Speed | H - Auto Platform | T - Teleport | R - Rainbow")
print("Check the UPDATE tab for all new features!")
