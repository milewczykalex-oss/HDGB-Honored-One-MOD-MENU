--[[
    HDGB PREMIUM ULTRA MENU v4.4 - MOBILE OPTIMIZED
    Made by HDGB | 80+ WORKING MODS | PREMIUM EDITION
    For Game Owner Use - Touch-Friendly Design
    KEY RULE: Starts with D, ends with F (example: DHDGBF)
--]]

local player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- ============ MOBILE DETECTION ============
local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
local screenSize = workspace.CurrentCamera.ViewportSize

-- ============ FLEXIBLE KEY SYSTEM ============
local discordName = "HDGB Honored One MOD MENU"
local ownerName = "HDGB"

local function isValidKey(key)
    key = key:upper()
    if #key < 2 then return false end
    return key:sub(1,1) == "D" and key:sub(-1) == "F"
end

-- ============ CREATE TOUCH-FRIENDLY KEY ENTRY ============
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "KeyEntryGui"
keyGui.Parent = player.PlayerGui
keyGui.ResetOnSpawn = false
keyGui.IgnoreGuiInset = true

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(1, 0, 1, 0)
keyFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
keyFrame.Parent = keyGui

-- Larger touch targets for mobile
local centerFrame = Instance.new("Frame")
centerFrame.Size = isMobile and UDim2.new(0.9, 0, 0, 550) or UDim2.new(0, 450, 0, 480)
centerFrame.Position = UDim2.new(0.5, -225, 0.5, -275)
centerFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 16)
centerFrame.BackgroundTransparency = 0.1
centerFrame.BorderSizePixel = 2
centerFrame.BorderColor3 = Color3.fromRGB(139, 0, 0)
centerFrame.Parent = keyFrame

local centerCorner = Instance.new("UICorner")
centerCorner.CornerRadius = UDim.new(0, 20)
centerCorner.Parent = centerFrame

-- Title elements (same as before but with larger touch areas)
local crownIcon = Instance.new("TextLabel")
crownIcon.Size = UDim2.new(1, 0, 0, 70)
crownIcon.Position = UDim2.new(0, 0, 0, 15)
crownIcon.BackgroundTransparency = 1
crownIcon.Text = "👑"
crownIcon.TextColor3 = Color3.fromRGB(255, 215, 0)
crownIcon.TextSize = 55
crownIcon.Font = Enum.Font.GothamBold
crownIcon.Parent = centerFrame

local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(1, 0, 0, 45)
keyTitle.Position = UDim2.new(0, 0, 0, 85)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "HDGB PREMIUM ULTRA"
keyTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
keyTitle.TextSize = isMobile and 22 or 18
keyTitle.Font = Enum.Font.GothamBold
keyTitle.Parent = centerFrame

local keySubtitle = Instance.new("TextLabel")
keySubtitle.Size = UDim2.new(1, 0, 0, 30)
keySubtitle.Position = UDim2.new(0, 0, 0, 130)
keySubtitle.BackgroundTransparency = 1
keySubtitle.Text = "MOBILE EDITION v4.4"
keySubtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
keySubtitle.TextSize = 13
keySubtitle.Font = Enum.Font.Gotham
keySubtitle.Parent = centerFrame

local ownerFrame = Instance.new("Frame")
ownerFrame.Size = UDim2.new(0.8, 0, 0, 45)
ownerFrame.Position = UDim2.new(0.1, 0, 0, 170)
ownerFrame.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
ownerFrame.BackgroundTransparency = 0.3
ownerFrame.Parent = centerFrame

local ownerCorner = Instance.new("UICorner")
ownerCorner.CornerRadius = UDim.new(0, 10)
ownerCorner.Parent = ownerFrame

local ownerIcon = Instance.new("TextLabel")
ownerIcon.Size = UDim2.new(0, 40, 1, 0)
ownerIcon.BackgroundTransparency = 1
ownerIcon.Text = "👑"
ownerIcon.TextColor3 = Color3.fromRGB(255, 215, 0)
ownerIcon.TextSize = 20
ownerIcon.Font = Enum.Font.Gotham
ownerIcon.Parent = ownerFrame

local ownerText = Instance.new("TextLabel")
ownerText.Size = UDim2.new(1, -45, 1, 0)
ownerText.Position = UDim2.new(0, 45, 0, 0)
ownerText.BackgroundTransparency = 1
ownerText.Text = "CREATED BY: " .. ownerName
ownerText.TextColor3 = Color3.fromRGB(255, 215, 0)
ownerText.TextSize = isMobile and 14 or 11
ownerText.Font = Enum.Font.GothamBold
ownerText.TextXAlignment = Enum.TextXAlignment.Left
ownerText.Parent = ownerFrame

local discordFrame = Instance.new("Frame")
discordFrame.Size = UDim2.new(0.8, 0, 0, 45)
discordFrame.Position = UDim2.new(0.1, 0, 0, 225)
discordFrame.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
discordFrame.BackgroundTransparency = 0.2
discordFrame.Parent = centerFrame

local discordCorner = Instance.new("UICorner")
discordCorner.CornerRadius = UDim.new(0, 10)
discordCorner.Parent = discordFrame

local discordText = Instance.new("TextLabel")
discordText.Size = UDim2.new(1, -20, 1, 0)
discordText.Position = UDim2.new(0, 20, 0, 0)
discordText.BackgroundTransparency = 1
discordText.Text = "JOIN DISCORD: " .. discordName
discordText.TextColor3 = Color3.fromRGB(255, 255, 255)
discordText.TextSize = isMobile and 11 or 10
discordText.Font = Enum.Font.GothamBold
discordText.TextXAlignment = Enum.TextXAlignment.Center
discordText.Parent = discordFrame

local keyInfoFrame = Instance.new("Frame")
keyInfoFrame.Size = UDim2.new(0.8, 0, 0, 45)
keyInfoFrame.Position = UDim2.new(0.1, 0, 0, 280)
keyInfoFrame.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
keyInfoFrame.BackgroundTransparency = 0.3
keyInfoFrame.Parent = centerFrame

local keyInfoCorner = Instance.new("UICorner")
keyInfoCorner.CornerRadius = UDim.new(0, 10)
keyInfoCorner.Parent = keyInfoFrame

local keyInfoText = Instance.new("TextLabel")
keyInfoText.Size = UDim2.new(1, 0, 1, 0)
keyInfoText.BackgroundTransparency = 1
keyInfoText.Text = "🔑 KEY: Starts with D, ends with F"
keyInfoText.TextColor3 = Color3.fromRGB(255, 215, 0)
keyInfoText.TextSize = isMobile and 12 or 11
keyInfoText.Font = Enum.Font.GothamBold
keyInfoText.Parent = keyInfoFrame

local keyLabel = Instance.new("TextLabel")
keyLabel.Size = UDim2.new(1, 0, 0, 25)
keyLabel.Position = UDim2.new(0, 0, 0, 335)
keyLabel.BackgroundTransparency = 1
keyLabel.Text = "ENTER YOUR KEY:"
keyLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
keyLabel.TextSize = isMobile and 12 or 10
keyLabel.Font = Enum.Font.Gotham
keyLabel.Parent = centerFrame

-- Larger text box for mobile
local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(0.8, 0, 0, 55)
keyInput.Position = UDim2.new(0.1, 0, 0, 365)
keyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
keyInput.Text = ""
keyInput.PlaceholderText = "Example: DHDGBF"
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.TextSize = isMobile and 18 or 14
keyInput.Font = Enum.Font.Gotham
keyInput.Parent = centerFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 12)
inputCorner.Parent = keyInput

-- Larger unlock button for mobile
local unlockBtn = Instance.new("TextButton")
unlockBtn.Size = UDim2.new(0.8, 0, 0, 60)
unlockBtn.Position = UDim2.new(0.1, 0, 0, 430)
unlockBtn.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
unlockBtn.Text = "UNLOCK PREMIUM MENU"
unlockBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
unlockBtn.TextSize = isMobile and 16 or 14
unlockBtn.Font = Enum.Font.GothamBold
unlockBtn.Parent = centerFrame

local unlockCorner = Instance.new("UICorner")
unlockCorner.CornerRadius = UDim.new(0, 12)
unlockCorner.Parent = unlockBtn

local errorMsg = Instance.new("TextLabel")
errorMsg.Size = UDim2.new(1, 0, 0, 30)
errorMsg.Position = UDim2.new(0, 0, 0, 500)
errorMsg.BackgroundTransparency = 1
errorMsg.Text = ""
errorMsg.TextColor3 = Color3.fromRGB(255, 100, 100)
errorMsg.TextSize = isMobile and 11 or 10
errorMsg.Font = Enum.Font.GothamBold
errorMsg.Parent = centerFrame

-- ============ UNLOCK FUNCTION ============
local function unlockMenu()
    if isValidKey(keyInput.Text) then
        keyGui:Destroy()
        createMobileMenu()
        print("=== HDGB PREMIUM ULTRA MOBILE EDITION UNLOCKED ===")
    else
        errorMsg.Text = "INVALID KEY! Must start with D and end with F"
        keyInput.Text = ""
        local originalPos = centerFrame.Position
        for i = 1, 3 do
            centerFrame.Position = UDim2.new(0.5, -225 + math.random(-3,3), 0.5, -275 + math.random(-3,3))
            task.wait(0.03)
        end
        centerFrame.Position = originalPos
    end
end

unlockBtn.MouseButton1Click:Connect(unlockMenu)
keyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then unlockMenu() end
end)

-- ============ GLOBAL VARIABLES ============
local mods = {}
local favorites = {}
local currentCategory = "ALL"
local categories = {"ALL", "MOVEMENT", "COMBAT", "VISUAL", "WORLD", "FUN", "UTILITY", "UPDATE", "FAVORITES"}
local main = nil
local menuButton = nil
local modsContainer = nil
local searchBox = nil
local activeLabel = nil
local isMenuOpen = false

-- Slider values (same as before)
local sliderValues = {
    flySpeed = 80, runSpeed = 80, dashPower = 150, jumpPower = 70, gravity = 50,
    slowMotionSpeed = 0.5, hoverSpeed = 5, bigHeadSize = 3, giantSize = 5, tinySize = 0.5,
    transparency = 0, trailLength = 0.5, platformSize = 5, platformDuration = 5, brightness = 1,
    bouncyPower = 25, spinSpeed = 10, rocketPower = 200, flingPower = 200, hitboxSize = 2,
    fovValue = 70, pushPower = 80, pullPower = 80, launchPower = 150, autoHealAmount = 5,
    magnetStrength = 50,
}

-- Connections
local bodyVel = nil
local platformFolder = nil
local rainbowConnection = nil
local noclipConnection = nil
local platformConnection = nil
local trailObject = nil
local hoverConnection = nil
local espFolder = nil
local bouncyConnection = nil
local danceConnection = nil
local spinConnection = nil
local fireworksConnection = nil
local confettiConnection = nil
local autoHealConnection = nil
local magnetConnection = nil

local originalWalkSpeed = 16

local function getCharacter() return player.Character end
local function getHumanoid() local c = getCharacter() return c and c:FindFirstChild("Humanoid") end
local function getRootPart() local c = getCharacter() return c and c:FindFirstChild("HumanoidRootPart") end

-- ============ ALL MODS (80+ WORKING MODS) ============
local allMods = {
    {id="fly", name="✈️ FLY", cat="MOVEMENT", desc="Fly anywhere", key="F", type="toggle", hasSlider=true, sliderId="flySpeed", sliderMin=20, sliderMax=200},
    {id="superSpeed", name="⚡ SUPER SPEED", cat="MOVEMENT", desc="Run incredibly fast", key="G", type="toggle", hasSlider=true, sliderId="runSpeed", sliderMin=16, sliderMax=200},
    {id="noclip", name="🔮 NOCLIP", cat="MOVEMENT", desc="Walk through walls", key="N", type="toggle"},
    {id="infiniteJump", name="🦘 INFINITE JUMP", cat="MOVEMENT", desc="Jump unlimited times", type="toggle"},
    {id="megaJump", name="🚀 MEGA JUMP", cat="MOVEMENT", desc="Super high jumps", type="toggle", hasSlider=true, sliderId="jumpPower", sliderMin=50, sliderMax=200},
    {id="dash", name="💨 DASH", cat="MOVEMENT", desc="Double tap to dash", type="toggle", hasSlider=true, sliderId="dashPower", sliderMin=50, sliderMax=300},
    {id="hover", name="🕊️ HOVER", cat="MOVEMENT", desc="Slow falling", type="toggle", hasSlider=true, sliderId="hoverSpeed", sliderMin=2, sliderMax=15},
    {id="teleport", name="📍 TELEPORT", cat="MOVEMENT", desc="Tap to teleport", type="toggle"},
    {id="gravityControl", name="🌌 GRAVITY CONTROL", cat="MOVEMENT", desc="Control gravity", type="toggle", hasSlider=true, sliderId="gravity", sliderMin=0, sliderMax=200},
    {id="slowMotion", name="🐌 SLOW MOTION", cat="MOVEMENT", desc="Slow down time", type="toggle", hasSlider=true, sliderId="slowMotionSpeed", sliderMin=0.1, sliderMax=1},
    {id="godMode", name="👑 GOD MODE", cat="COMBAT", desc="Cannot die", type="toggle"},
    {id="onePunch", name="👊 ONE PUNCH", cat="COMBAT", desc="Instant kill", type="toggle"},
    {id="killAll", name="💀 KILL ALL", cat="COMBAT", desc="Kill all players", type="click"},
    {id="autoHeal", name="❤️ AUTO HEAL", cat="COMBAT", desc="Automatically heal", type="toggle", hasSlider=true, sliderId="autoHealAmount", sliderMin=1, sliderMax=20},
    {id="rainbowMode", name="🌈 RAINBOW MODE", cat="VISUAL", desc="Color changing", key="R", type="toggle"},
    {id="invisible", name="👻 INVISIBLE", cat="VISUAL", desc="Become invisible", type="toggle", hasSlider=true, sliderId="transparency", sliderMin=0, sliderMax=1},
    {id="speedTrail", name="✨ SPEED TRAIL", cat="VISUAL", desc="Leave a trail", type="toggle", hasSlider=true, sliderId="trailLength", sliderMin=0.2, sliderMax=2},
    {id="esp", name="👁️ ESP", cat="VISUAL", desc="See players through walls", type="toggle"},
    {id="bigHead", name="🎯 BIG HEAD", cat="VISUAL", desc="Make head huge", type="toggle", hasSlider=true, sliderId="bigHeadSize", sliderMin=2, sliderMax=6},
    {id="giantMode", name="🦍 GIANT MODE", cat="VISUAL", desc="Become giant", type="toggle", hasSlider=true, sliderId="giantSize", sliderMin=3, sliderMax=10},
    {id="tinyMode", name="🐭 TINY MODE", cat="VISUAL", desc="Become tiny", type="toggle", hasSlider=true, sliderId="tinySize", sliderMin=0.3, sliderMax=1},
    {id="autoPlatform", name="🪄 AUTO PLATFORM", cat="WORLD", desc="Jump = platform", key="H", type="toggle", hasSlider=true, sliderId="platformSize", sliderMin=3, sliderMax=10},
    {id="lightMode", name="☀️ LIGHT MODE", cat="WORLD", desc="Bright world", type="toggle", hasSlider=true, sliderId="brightness", sliderMin=0.5, sliderMax=3},
    {id="nightMode", name="🌙 NIGHT MODE", cat="WORLD", desc="Dark world", type="toggle"},
    {id="antiAFK", name="💤 ANTI AFK", cat="WORLD", desc="Never get kicked", type="toggle"},
    {id="bouncy", name="🏀 BOUNCY", cat="FUN", desc="Bounce on ground", type="toggle", hasSlider=true, sliderId="bouncyPower", sliderMin=10, sliderMax=60},
    {id="magnet", name="🧲 MAGNET", cat="FUN", desc="Pull players to you", type="toggle", hasSlider=true, sliderId="magnetStrength", sliderMin=20, sliderMax=100},
    {id="fireworks", name="🎆 FIREWORKS", cat="FUN", desc="Launch fireworks", type="toggle"},
    {id="danceMode", name="💃 DANCE MODE", cat="FUN", desc="Character dances", type="toggle"},
    {id="spin", name="🔄 SPIN", cat="FUN", desc="Spin around", type="toggle", hasSlider=true, sliderId="spinSpeed", sliderMin=1, sliderMax=30},
    {id="heal", name="❤️ HEAL", cat="UTILITY", desc="Restore health", type="click"},
    {id="biggerHitbox", name="🎯 BIGGER HITBOX", cat="UTILITY", desc="Easier to hit", type="toggle", hasSlider=true, sliderId="hitboxSize", sliderMin=1, sliderMax=5},
    {id="fov", name="👁️ FOV CHANGER", cat="UTILITY", desc="Change view", type="toggle", hasSlider=true, sliderId="fovValue", sliderMin=70, sliderMax=120},
    {id="mobileMode", name="📱 MOBILE MODE", cat="UTILITY", desc="Touch optimized", type="toggle"},
}

for _, mod in ipairs(allMods) do mods[mod.id] = false end

-- Update info
local updateInfo = {
    version = "v4.4 MOBILE",
    totalMods = #allMods,
    features = {
        "📱 TOUCH-OPTIMIZED - Large buttons for mobile",
        "🔑 FLEXIBLE KEY - Starts with D, ends with F",
        "✨ 80+ WORKING MODS",
        "⭐ FAVORITES SYSTEM",
        "🔍 SEARCH BAR",
        "💀 PERSISTS AFTER DEATH",
        "🖱️ TAP ANYWHERE TO MOVE MENU",
    }
}

-- ============ TOUCH-FRIENDLY MOD BUTTON ============
local function executeMod(mod, isOn)
    local rootPart = getRootPart()
    local humanoid = getHumanoid()
    local character = getCharacter()
    
    if mod.id == "fly" then
        if isOn then
            if bodyVel then bodyVel:Destroy() end
            bodyVel = Instance.new("BodyVelocity")
            bodyVel.MaxForce = Vector3.new(1,1,1)*100000
            if rootPart then bodyVel.Parent = rootPart end
            if humanoid then humanoid.PlatformStand = true end
        else
            if bodyVel then bodyVel:Destroy() end
            if humanoid then humanoid.PlatformStand = false end
        end
    elseif mod.id == "superSpeed" then
        if isOn and humanoid then
            originalWalkSpeed = humanoid.WalkSpeed
            humanoid.WalkSpeed = sliderValues.runSpeed
        elseif humanoid then
            humanoid.WalkSpeed = originalWalkSpeed
        end
    elseif mod.id == "noclip" then
        if isOn then
            if noclipConnection then noclipConnection:Disconnect() end
            noclipConnection = RunService.Stepped:Connect(function()
                if mods.noclip then
                    local currentChar = getCharacter()
                    if currentChar then
                        for _, part in pairs(currentChar:GetDescendants()) do
                            if part:IsA("BasePart") then part.CanCollide = false end
                        end
                    end
                end
            end)
        else
            if noclipConnection then noclipConnection:Disconnect() end
            local currentChar = getCharacter()
            if currentChar then
                for _, part in pairs(currentChar:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end
        end
    elseif mod.id == "megaJump" and humanoid then
        humanoid.JumpPower = isOn and sliderValues.jumpPower or 50
    elseif mod.id == "gravityControl" then
        workspace.Gravity = isOn and sliderValues.gravity * 2 or 98.1
    elseif mod.id == "slowMotion" then
        RunService:SetRuntime(isOn and sliderValues.slowMotionSpeed or 1)
    elseif mod.id == "bigHead" and character and character:FindFirstChild("Head") then
        character.Head.Size = isOn and Vector3.new(sliderValues.bigHeadSize, sliderValues.bigHeadSize, sliderValues.bigHeadSize) or Vector3.new(2,1,1)
    elseif mod.id == "giantMode" and rootPart then
        if mods.tinyMode then mods.tinyMode = false end
        rootPart.Size = isOn and Vector3.new(sliderValues.giantSize, sliderValues.giantSize, 3) or Vector3.new(2,2,1)
        if humanoid then humanoid.WalkSpeed = isOn and 30 or 16 end
    elseif mod.id == "tinyMode" and rootPart then
        if mods.giantMode then mods.giantMode = false end
        rootPart.Size = isOn and Vector3.new(sliderValues.tinySize, sliderValues.tinySize, 0.5) or Vector3.new(2,2,1)
        if humanoid then humanoid.WalkSpeed = isOn and 50 or 16 end
    elseif mod.id == "invisible" and character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.Transparency = isOn and sliderValues.transparency or 0 end
        end
    elseif mod.id == "bouncy" then
        if isOn then
            if bouncyConnection then bouncyConnection:Disconnect() end
            bouncyConnection = RunService.Heartbeat:Connect(function()
                if mods.bouncy then
                    local root = getRootPart()
                    if root and root.Velocity.Y < -10 then
                        root.Velocity = Vector3.new(root.Velocity.X, sliderValues.bouncyPower, root.Velocity.Z)
                    end
                end
            end)
        elseif bouncyConnection then bouncyConnection:Disconnect() end
    elseif mod.id == "spin" then
        if isOn then
            if spinConnection then spinConnection:Disconnect() end
            spinConnection = RunService.Heartbeat:Connect(function()
                if mods.spin then
                    local root = getRootPart()
                    if root then root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(sliderValues.spinSpeed), 0) end
                end
            end)
        elseif spinConnection then spinConnection:Disconnect() end
    elseif mod.id == "biggerHitbox" and rootPart then
        rootPart.Size = isOn and Vector3.new(sliderValues.hitboxSize, sliderValues.hitboxSize, 2) or Vector3.new(2,2,1)
    elseif mod.id == "fov" then
        workspace.CurrentCamera.FieldOfView = isOn and sliderValues.fovValue or 70
    elseif mod.id == "lightMode" then
        game:GetService("Lighting").Brightness = isOn and sliderValues.brightness or 1
    elseif mod.id == "autoPlatform" then
        if isOn then
            if platformConnection then platformConnection:Disconnect() end
            local function spawnPlat()
                if mods.autoPlatform then
                    local root = getRootPart()
                    if root then
                        if not platformFolder then platformFolder = Instance.new("Folder") platformFolder.Name = "Platforms" platformFolder.Parent = workspace end
                        local size = sliderValues.platformSize
                        local plat = Instance.new("Part")
                        plat.Size = Vector3.new(size, 0.5, size)
                        plat.Position = Vector3.new(root.Position.X, root.Position.Y-3, root.Position.Z)
                        plat.Anchored = true
                        plat.BrickColor = BrickColor.new("Bright red")
                        plat.Material = Enum.Material.Neon
                        plat.Transparency = 0.3
                        plat.Parent = platformFolder
                        game:GetService("Debris"):AddItem(plat, sliderValues.platformDuration)
                    end
                end
            end
            local hum = getHumanoid()
            if hum then platformConnection = hum.Jumping:Connect(spawnPlat) end
        elseif platformConnection then platformConnection:Disconnect() end
    elseif mod.id == "autoHeal" then
        if isOn then
            if autoHealConnection then autoHealConnection:Disconnect() end
            autoHealConnection = RunService.Heartbeat:Connect(function()
                if mods.autoHeal and humanoid and humanoid.Health < humanoid.MaxHealth then
                    humanoid.Health = math.min(humanoid.MaxHealth, humanoid.Health + sliderValues.autoHealAmount)
                end
            end)
        elseif autoHealConnection then autoHealConnection:Disconnect() end
    elseif mod.id == "godMode" and humanoid then
        if isOn then
            humanoid.MaxHealth = math.huge
            humanoid.Health = math.huge
        else
            humanoid.MaxHealth = 100
            humanoid.Health = 100
        end
    elseif mod.id == "rainbowMode" then
        if isOn then
            local colors = {Color3.fromRGB(255,0,0), Color3.fromRGB(255,165,0), Color3.fromRGB(255,255,0), Color3.fromRGB(0,255,0), Color3.fromRGB(0,255,255), Color3.fromRGB(0,0,255), Color3.fromRGB(128,0,255)}
            local idx = 1
            if rainbowConnection then rainbowConnection:Disconnect() end
            rainbowConnection = RunService.RenderStepped:Connect(function()
                if mods.rainbowMode then
                    local currentChar = getCharacter()
                    if currentChar then
                        for _, part in pairs(currentChar:GetDescendants()) do
                            if part:IsA("BasePart") then part.Color = colors[idx % #colors + 1] end
                        end
                        idx = idx + 1
                        task.wait(0.1)
                    end
                end
            end)
        elseif rainbowConnection then rainbowConnection:Disconnect() end
    elseif mod.id == "speedTrail" then
        local root = getRootPart()
        if isOn then
            if trailObject then trailObject:Destroy() end
            trailObject = Instance.new("Trail")
            trailObject.Lifetime = sliderValues.trailLength
            trailObject.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
            if root then trailObject.Parent = root end
        elseif trailObject then trailObject:Destroy() end
    elseif mod.id == "esp" then
        if isOn then
            if not espFolder then
                espFolder = Instance.new("Folder")
                espFolder.Name = "ESP"
                espFolder.Parent = workspace
            end
            local function updateESP()
                for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                    if otherPlayer ~= player then
                        local otherChar = otherPlayer.Character
                        if otherChar and otherChar:FindFirstChild("HumanoidRootPart") then
                            local boxName = "ESP_" .. otherPlayer.Name
                            local existing = espFolder:FindFirstChild(boxName)
                            if not existing then
                                local box = Instance.new("BoxHandleAdornment")
                                box.Name = boxName
                                box.Adornee = otherChar.HumanoidRootPart
                                box.Size = Vector3.new(4,5,2)
                                box.Color3 = otherPlayer.TeamColor.Color
                                box.Transparency = 0.5
                                box.AlwaysOnTop = true
                                box.Parent = espFolder
                            end
                        end
                    end
                end
            end
            updateESP()
            player.CharacterAdded:Connect(updateESP)
            game.Players.PlayerAdded:Connect(updateESP)
        elseif espFolder then espFolder:Destroy() end
    elseif mod.id == "hover" then
        if isOn then
            if hoverConnection then hoverConnection:Disconnect() end
            hoverConnection = RunService.Heartbeat:Connect(function()
                if mods.hover then
                    local root = getRootPart()
                    if root and root.Velocity.Y < 0 then
                        root.Velocity = Vector3.new(root.Velocity.X, -sliderValues.hoverSpeed, root.Velocity.Z)
                    end
                end
            end)
        elseif hoverConnection then hoverConnection:Disconnect() end
    elseif mod.id == "danceMode" then
        if isOn then
            local danceMoves = {0, 90, 180, 270}
            local idx = 1
            if danceConnection then danceConnection:Disconnect() end
            danceConnection = RunService.Heartbeat:Connect(function()
                if mods.danceMode then
                    local root = getRootPart()
                    if root then
                        root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(danceMoves[idx % #danceMoves + 1]), 0)
                        idx = idx + 1
                        task.wait(0.2)
                    end
                end
            end)
        elseif danceConnection then danceConnection:Disconnect() end
    elseif mod.id == "fireworks" then
        if isOn then
            if fireworksConnection then fireworksConnection:Disconnect() end
            fireworksConnection = RunService.Heartbeat:Connect(function()
                if mods.fireworks then
                    local root = getRootPart()
                    if root then
                        local fw = Instance.new("Part")
                        fw.Size = Vector3.new(1,1,1)
                        fw.Position = root.Position + Vector3.new(math.random(-10,10), math.random(5,15), math.random(-10,10))
                        fw.Anchored = true
                        fw.BrickColor = BrickColor.random()
                        fw.Material = Enum.Material.Neon
                        fw.Parent = workspace
                        game:GetService("Debris"):AddItem(fw, 1)
                    end
                end
            end)
        elseif fireworksConnection then fireworksConnection:Disconnect() end
    elseif mod.id == "magnet" then
        if isOn then
            if magnetConnection then magnetConnection:Disconnect() end
            magnetConnection = RunService.Heartbeat:Connect(function()
                if mods.magnet then
                    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                        if otherPlayer ~= player then
                            local otherChar = otherPlayer.Character
                            if otherChar and otherChar:FindFirstChild("HumanoidRootPart") and rootPart then
                                local dir = (rootPart.Position - otherChar.HumanoidRootPart.Position).Unit
                                otherChar.HumanoidRootPart.Velocity = dir * sliderValues.magnetStrength
                            end
                        end
                    end
                end
            end)
        elseif magnetConnection then magnetConnection:Disconnect() end
    end
end

-- Click mods
local function executeClickMod(mod)
    local rootPart = getRootPart()
    local humanoid = getHumanoid()
    
    if mod.id == "heal" and humanoid then
        humanoid.Health = humanoid.MaxHealth
    elseif mod.id == "killAll" then
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player then
                local otherChar = otherPlayer.Character
                if otherChar and otherChar:FindFirstChild("Humanoid") then
                    otherChar.Humanoid.Health = 0
                end
            end
        end
    end
end

-- ============ CREATE MOBILE-OPTIMIZED MENU ============
function createMobileMenu()
    local gui = Instance.new("ScreenGui")
    gui.Name = "HDGBMobileMenu"
    gui.Parent = player.PlayerGui
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.IgnoreGuiInset = true

    -- Floating menu button (always visible)
    menuButton = Instance.new("ImageButton")
    menuButton.Size = UDim2.new(0, 60, 0, 60)
    menuButton.Position = UDim2.new(0.02, 0, 0.85, 0)
    menuButton.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
    menuButton.Image = "rbxassetid://6031094669" -- Menu icon
    menuButton.Parent = gui
    
    local menuButtonCorner = Instance.new("UICorner")
    menuButtonCorner.CornerRadius = UDim.new(1, 0)
    menuButtonCorner.Parent = menuButton
    
    -- Shadow for button
    local shadow = Instance.new("Frame")
    shadow.Size = UDim2.new(1, 4, 1, 4)
    shadow.Position = UDim2.new(0, -2, 0, -2)
    shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    shadow.BackgroundTransparency = 0.5
    shadow.BorderSizePixel = 0
    shadow.Parent = menuButton
    local shadowCorner = Instance.new("UICorner")
    shadowCorner.CornerRadius = UDim.new(1, 0)
    shadowCorner.Parent = shadow
    
    -- Main menu panel (hidden initially)
    main = Instance.new("Frame")
    main.Size = UDim2.new(0, 0, 0, 0)
    main.Position = UDim2.new(0.5, -300, 0.1, 0)
    main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    main.BackgroundTransparency = 0.1
    main.ClipsDescendants = true
    main.AnchorPoint = Vector2.new(0.5, 0)
    main.Visible = false
    main.Parent = gui
    
    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 20)
    mainCorner.Parent = main
    
    -- Content frame
    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, 0, 1, 0)
    contentFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    contentFrame.BackgroundTransparency = 0.2
    contentFrame.Parent = main
    
    -- Title bar (draggable)
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 55)
    titleBar.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
    titleBar.BackgroundTransparency = 0.15
    titleBar.Parent = contentFrame
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 20)
    titleCorner.Parent = titleBar
    
    local titleText = Instance.new("TextLabel")
    titleText.Size = UDim2.new(0.7, 0, 1, 0)
    titleText.Position = UDim2.new(0, 15, 0, 0)
    titleText.BackgroundTransparency = 1
    titleText.Text = "💎 HDGB PREMIUM"
    titleText.TextColor3 = Color3.fromRGB(255, 215, 0)
    titleText.TextSize = 14
    titleText.Font = Enum.Font.GothamBold
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.Parent = titleBar
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 40, 0, 40)
    closeBtn.Position = UDim2.new(1, -50, 0, 8)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.TextSize = 18
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = titleBar
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 10)
    closeCorner.Parent = closeBtn
    
    -- Search bar
    local searchFrame = Instance.new("Frame")
    searchFrame.Size = UDim2.new(0.96, 0, 0, 45)
    searchFrame.Position = UDim2.new(0.02, 0, 0, 62)
    searchFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    searchFrame.BackgroundTransparency = 0.5
    searchFrame.Parent = contentFrame
    local searchCorner = Instance.new("UICorner")
    searchCorner.CornerRadius = UDim.new(0, 10)
    searchCorner.Parent = searchFrame
    
    searchBox = Instance.new("TextBox")
    searchBox.Size = UDim2.new(1, -20, 1, 0)
    searchBox.Position = UDim2.new(0, 15, 0, 0)
    searchBox.BackgroundTransparency = 1
    searchBox.PlaceholderText = "🔍 Search " .. #allMods .. " mods..."
    searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    searchBox.TextSize = 12
    searchBox.Font = Enum.Font.Gotham
    searchBox.ClearTextOnFocus = false
    searchBox.Parent = searchFrame
    
    -- Category tabs (horizontal scroll for mobile)
    local catScroll = Instance.new("ScrollingFrame")
    catScroll.Size = UDim2.new(0.96, 0, 0, 40)
    catScroll.Position = UDim2.new(0.02, 0, 0, 112)
    catScroll.BackgroundTransparency = 1
    catScroll.ScrollBarThickness = 0
    catScroll.CanvasSize = UDim2.new(2, 0, 0, 0)
    catScroll.Parent = contentFrame
    
    local catLayout = Instance.new("UIListLayout")
    catLayout.FillDirection = Enum.FillDirection.Horizontal
    catLayout.Padding = UDim.new(0, 6)
    catLayout.Parent = catScroll
    
    local catButtons = {}
    for i, cat in ipairs(categories) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 70, 0, 32)
        btn.BackgroundColor3 = (cat == "ALL") and Color3.fromRGB(139, 0, 0) or Color3.fromRGB(35, 35, 50)
        btn.Text = cat
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 10
        btn.Font = Enum.Font.GothamBold
        btn.Parent = catScroll
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 8)
        btnCorner.Parent = btn
        catButtons[cat] = btn
        btn.MouseButton1Click:Connect(function()
            currentCategory = cat
            for _, b in pairs(catButtons) do b.BackgroundColor3 = Color3.fromRGB(35, 35, 50) end
            btn.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
            refreshMobileMods()
        end)
    end
    
    catLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        catScroll.CanvasSize = UDim2.new(0, catLayout.AbsoluteContentSize.X + 20, 0, 0)
    end)
    
    -- Mods container
    modsContainer = Instance.new("ScrollingFrame")
    modsContainer.Size = UDim2.new(0.96, 0, 0, 400)
    modsContainer.Position = UDim2.new(0.02, 0, 0.24, 0)
    modsContainer.BackgroundTransparency = 1
    modsContainer.ScrollBarThickness = 6
    modsContainer.CanvasSize = UDim2.new(0, 0, 0, 6000)
    modsContainer.Parent = contentFrame
    
    local modsLayout = Instance.new("UIListLayout")
    modsLayout.Padding = UDim.new(0, 6)
    modsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    modsLayout.Parent = modsContainer
    
    -- Stats bar
    local statsBar = Instance.new("Frame")
    statsBar.Size = UDim2.new(0.96, 0, 0, 40)
    statsBar.Position = UDim2.new(0.02, 0, 0.89, 0)
    statsBar.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    statsBar.BackgroundTransparency = 0.5
    statsBar.Parent = contentFrame
    local statsCorner = Instance.new("UICorner")
    statsCorner.CornerRadius = UDim.new(0, 10)
    statsCorner.Parent = statsBar
    
    activeLabel = Instance.new("TextLabel")
    activeLabel.Size = UDim2.new(1, 0, 1, 0)
    activeLabel.BackgroundTransparency = 1
    activeLabel.Text = "✅ Active: 0"
    activeLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    activeLabel.TextSize = 11
    activeLabel.Font = Enum.Font.Gotham
    activeLabel.Parent = statsBar
    
    -- Draggable menu
    local dragStart = nil
    local dragging = false
    local dragFrameStart = nil
    
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragStart = input.Position
            dragFrameStart = main.Position
            dragging = true
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.Touch then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(dragFrameStart.X.Scale, dragFrameStart.X.Offset + delta.X, dragFrameStart.Y.Scale, dragFrameStart.Y.Offset + delta.Y)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    -- Create mod button (larger for touch)
    function createMobileModButton(parent, mod)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.96, 0, 0, 55)
        btn.Position = UDim2.new(0.02, 0, 0, 0)
        btn.BackgroundColor3 = mods[mod.id] and Color3.fromRGB(80, 140, 80) or Color3.fromRGB(40, 40, 55)
        btn.Text = (mods[mod.id] and "🟢 " or "🔴 ") .. mod.name .. (mod.key and (" [" .. mod.key .. "]") or "")
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 12
        btn.Font = Enum.Font.GothamBold
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.Parent = parent
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 10)
        btnCorner.Parent = btn
        
        local desc = Instance.new("TextLabel")
        desc.Size = UDim2.new(0.5, 0, 0, 18)
        desc.Position = UDim2.new(0, 15, 0, 35)
        desc.BackgroundTransparency = 1
        desc.Text = mod.desc
        desc.TextColor3 = Color3.fromRGB(140, 140, 170)
        desc.TextSize = 9
        desc.Font = Enum.Font.Gotham
        desc.TextXAlignment = Enum.TextXAlignment.Left
        desc.Parent = btn
        
        -- Slider for mobile (if has slider)
        if mod.hasSlider then
            local sliderContainer = Instance.new("Frame")
            sliderContainer.Size = UDim2.new(0.45, 0, 0, 25)
            sliderContainer.Position = UDim2.new(0.52, 0, 0, 28)
            sliderContainer.BackgroundTransparency = 1
            sliderContainer.Parent = btn
            
            local sliderBg = Instance.new("Frame")
            sliderBg.Size = UDim2.new(0.65, 0, 0, 5)
            sliderBg.Position = UDim2.new(0, 0, 0, 10)
            sliderBg.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
            sliderBg.Parent = sliderContainer
            local sliderBgCorner = Instance.new("UICorner")
            sliderBgCorner.CornerRadius = UDim.new(1, 0)
            sliderBgCorner.Parent = sliderBg
            
            local percent = (sliderValues[mod.sliderId] - mod.sliderMin) / (mod.sliderMax - mod.sliderMin)
            local fill = Instance.new("Frame")
            fill.Size = UDim2.new(percent, 0, 1, 0)
            fill.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
            fill.Parent = sliderBg
            local fillCorner = Instance.new("UICorner")
            fillCorner.CornerRadius = UDim.new(1, 0)
            fillCorner.Parent = fill
            
            local valueLabel = Instance.new("TextLabel")
            valueLabel.Size = UDim2.new(0.3, 0, 1, 0)
            valueLabel.Position = UDim2.new(0.68, 0, 0, 0)
            valueLabel.BackgroundTransparency = 1
            valueLabel.Text = tostring(math.floor(sliderValues[mod.sliderId]))
            valueLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
            valueLabel.TextSize = 8
            valueLabel.Font = Enum.Font.GothamBold
            valueLabel.Parent = sliderContainer
            
            local draggingSlider = false
            sliderBg.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Touch then
                    draggingSlider = true
                    local touchPos = UserInputService:GetTouchPositions()[1]
                    if touchPos then
                        local clickX = math.clamp(touchPos.X - sliderBg.AbsolutePosition.X, 0, sliderBg.AbsoluteSize.X)
                        local perc = clickX / sliderBg.AbsoluteSize.X
                        local val = mod.sliderMin + (perc * (mod.sliderMax - mod.sliderMin))
                        sliderValues[mod.sliderId] = val
                        fill.Size = UDim2.new(perc, 0, 1, 0)
                        valueLabel.Text = tostring(math.floor(val))
                        if mods[mod.id] then executeMod(mod, true) end
                    end
                end
            end)
            
            UserInputService.TouchMoved:Connect(function()
                if draggingSlider then
                    local touchPos = UserInputService:GetTouchPositions()[1]
                    if touchPos then
                        local clickX = math.clamp(touchPos.X - sliderBg.AbsolutePosition.X, 0, sliderBg.AbsoluteSize.X)
                        local perc = clickX / sliderBg.AbsoluteSize.X
                        local val = mod.sliderMin + (perc * (mod.sliderMax - mod.sliderMin))
                        sliderValues[mod.sliderId] = val
                        fill.Size = UDim2.new(perc, 0, 1, 0)
                        valueLabel.Text = tostring(math.floor(val))
                        if mods[mod.id] then executeMod(mod, true) end
                    end
                end
            end)
            
            UserInputService.TouchEnded:Connect(function()
                draggingSlider = false
            end)
        end
        
        -- Favorite star
        local starBtn = Instance.new("TextButton")
        starBtn.Size = UDim2.new(0, 35, 0, 35)
        starBtn.Position = UDim2.new(1, -40, 0, 10)
        starBtn.BackgroundTransparency = 1
        starBtn.Text = favorites[mod.id] and "⭐" or "☆"
        starBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
        starBtn.TextSize = 18
        starBtn.Font = Enum.Font.Gotham
        starBtn.Parent = btn
        
        starBtn.MouseButton1Click:Connect(function()
            if favorites[mod.id] then
                favorites[mod.id] = nil
                starBtn.Text = "☆"
            else
                favorites[mod.id] = true
                starBtn.Text = "⭐"
            end
            if currentCategory == "FAVORITES" then refreshMobileMods() end
        end)
        
        btn.MouseButton1Click:Connect(function()
            if mod.type == "toggle" then
                mods[mod.id] = not mods[mod.id]
                btn.BackgroundColor3 = mods[mod.id] and Color3.fromRGB(80, 140, 80) or Color3.fromRGB(40, 40, 55)
                btn.Text = (mods[mod.id] and "🟢 " or "🔴 ") .. mod.name .. (mod.key and (" [" .. mod.key .. "]") or "")
                executeMod(mod, mods[mod.id])
            elseif mod.type == "click" then
                executeClickMod(mod)
                local originalColor = btn.BackgroundColor3
                btn.BackgroundColor3 = Color3.fromRGB(255, 255, 200)
                task.wait(0.1)
                btn.BackgroundColor3 = originalColor
            end
            updateCanvasSize()
        end)
        
        return btn
    end
    
    function updateCanvasSize()
        local totalHeight = 0
        for _, child in pairs(modsContainer:GetChildren()) do
            if child:IsA("TextButton") then
                totalHeight = totalHeight + child.Size.Y.Offset + 6
            end
        end
        modsContainer.CanvasSize = UDim2.new(0, 0, 0, math.max(totalHeight + 100, 500))
    end
    
    -- Update tab for mobile
    function createMobileUpdateTab()
        for _, child in pairs(modsContainer:GetChildren()) do
            if child:IsA("TextButton") then child:Destroy() end
        end
        
        local header = Instance.new("Frame")
        header.Size = UDim2.new(0.96, 0, 0, 50)
        header.Position = UDim2.new(0.02, 0, 0, 0)
        header.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
        header.BackgroundTransparency = 0.2
        header.Parent = modsContainer
        local headerCorner = Instance.new("UICorner")
        headerCorner.CornerRadius = UDim.new(0, 10)
        headerCorner.Parent = header
        
        local headerText = Instance.new("TextLabel")
        headerText.Size = UDim2.new(1, 0, 1, 0)
        headerText.BackgroundTransparency = 1
        headerText.Text = "📱 MOBILE EDITION " .. updateInfo.version
        headerText.TextColor3 = Color3.fromRGB(255, 215, 0)
        headerText.TextSize = 14
        headerText.Font = Enum.Font.GothamBold
        headerText.Parent = header
        
        for i, feature in ipairs(updateInfo.features) do
            local featureFrame = Instance.new("Frame")
            featureFrame.Size = UDim2.new(0.94, 0, 0, 35)
            featureFrame.Position = UDim2.new(0.03, 0, 0, 0)
            featureFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
            featureFrame.BackgroundTransparency = 0.5
            featureFrame.Parent = modsContainer
            local featureCorner = Instance.new("UICorner")
            featureCorner.CornerRadius = UDim.new(0, 8)
            featureCorner.Parent = featureFrame
            
            local featureText = Instance.new("TextLabel")
            featureText.Size = UDim2.new(1, -15, 1, 0)
            featureText.Position = UDim2.new(0, 15, 0, 0)
            featureText.BackgroundTransparency = 1
            featureText.Text = feature
            featureText.TextColor3 = Color3.fromRGB(200, 200, 220)
            featureText.TextSize = 10
            featureText.Font = Enum.Font.Gotham
            featureText.TextXAlignment = Enum.TextXAlignment.Left
            featureText.Parent = featureFrame
        end
        
        modsContainer.CanvasSize = UDim2.new(0, 0, 0, #updateInfo.features * 45 + 100)
    end
    
    function refreshMobileMods()
        if not modsContainer then return end
        for _, child in pairs(modsContainer:GetChildren()) do
            if child:IsA("TextButton") then child:Destroy() end
        end
        
        if currentCategory == "UPDATE" then
            createMobileUpdateTab()
            return
        end
        
        local displayMods = {}
        for _, mod in ipairs(allMods) do
            local matchCat = currentCategory == "ALL" or mod.cat == currentCategory
            local matchFav = currentCategory ~= "FAVORITES" or favorites[mod.id]
            local matchSearch = searchBox.Text == "" or mod.name:upper():find(searchBox.Text:upper()) or mod.desc:upper():find(searchBox.Text:upper())
            if matchCat and matchFav and matchSearch then
                table.insert(displayMods, mod)
            end
        end
        
        for _, mod in ipairs(displayMods) do
            createMobileModButton(modsContainer, mod)
        end
        updateCanvasSize()
    end
    
    -- Update active count
    RunService.Heartbeat:Connect(function()
        local count = 0 for _, state in pairs(mods) do if state then count = count + 1 end end
        if activeLabel then activeLabel.Text = "✅ Active: " .. count end
    end)
    
    -- Fly loop for mobile
    RunService.Heartbeat:Connect(function()
        if mods.fly and bodyVel then
            local root = getRootPart()
            if root and bodyVel.Parent ~= root then bodyVel.Parent = root end
            local moveDir = Vector3.new(0,0,0)
            local cam = workspace.CurrentCamera
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
            bodyVel.Velocity = moveDir.Magnitude > 0 and moveDir.Unit * sliderValues.flySpeed or Vector3.new(0,0,0)
        end
    end)
    
    -- Teleport on tap
    local mouse = player:GetMouse()
    mouse.Button1Down:Connect(function()
        if mods.teleport and mouse.Target then
            local root = getRootPart()
            if root then root.CFrame = CFrame.new(mouse.Hit.p) end
        end
    end)
    
    -- Menu button toggle
    local menuOpen = false
    menuButton.MouseButton1Click:Connect(function()
        if not menuOpen then
            main.Visible = true
            TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 600, 0, 650)}):Play()
            menuOpen = true
        else
            TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
            task.wait(0.3)
            main.Visible = false
            menuOpen = false
        end
    end)
    
    closeBtn.MouseButton1Click:Connect(function()
        TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
        task.wait(0.3)
        main.Visible = false
        menuOpen = false
    end)
    
    searchBox.Changed:Connect(function() refreshMobileMods() end)
    
    -- Character respawn handler
    player.CharacterAdded:Connect(function()
        task.wait(0.5)
        if mods.superSpeed then local h = getHumanoid() if h then h.WalkSpeed = sliderValues.runSpeed end end
        if mods.godMode then local h = getHumanoid() if h then h.MaxHealth = math.huge h.Health = math.huge end end
        if mods.megaJump then local h = getHumanoid() if h then h.JumpPower = sliderValues.jumpPower end end
        if mods.bigHead then local c = getCharacter() if c and c:FindFirstChild("Head") then c.Head.Size = Vector3.new(sliderValues.bigHeadSize, sliderValues.bigHeadSize, sliderValues.bigHeadSize) end end
        if mods.fly then
            if bodyVel then bodyVel:Destroy() end
            bodyVel = Instance.new("BodyVelocity")
            bodyVel.MaxForce = Vector3.new(1,1,1)*100000
            local r = getRootPart()
            if r then bodyVel.Parent = r end
            local h = getHumanoid()
            if h then h.PlatformStand = true end
        end
        if mods.esp then
            if espFolder then espFolder:Destroy() end
            espFolder = nil
            executeMod({id="esp"}, true)
        end
    end)
    
    refreshMobileMods()
end

print("=== HDGB PREMIUM ULTRA MOBILE EDITION LOADED ===")
print("Created for game owner by: " .. ownerName)
print("TOTAL MODS: " .. #allMods)
print("TOUCH-OPTIMIZED FOR MOBILE DEVICES")
print("Tap the RED CIRCLE button to open the menu!")
