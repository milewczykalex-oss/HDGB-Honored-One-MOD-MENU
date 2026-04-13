-- [[ HDGB REFINED SCRIPT ]] --
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local localPlayer = Players.LocalPlayer
local cam = workspace.CurrentCamera

if getgenv().HDGBLoaded then return end
getgenv().HDGBLoaded = true

-- Utility Functions
local function getChar() return localPlayer.Character end
local function getHum() return getChar() and getChar():FindFirstChildOfClass("Humanoid") end
local function getRoot() return getChar() and getChar():FindFirstChild("HumanoidRootPart") end
local function getHUI() return (gethui and gethui()) or CoreGui end

-- ===================== STATE =====================
local state = {
    fly = false, flySpeed = 80,
    noclip = false,
    godMode = false,
    boxESP = false,
    triggerbot = false,
    aimbot = false,
    aimassist = false,
    thirdPerson = false, thirdPersonDist = 15,
    silentAim = false,
    showFOVCircle = true,
    skinChangerEnabled = false,
    selectedWeapon = "Any Weapon",
    selectedSkin = "Default",
    speedBoost = false,
    speedBoostAmount = 50,
}

local SILENT_AIM_FOV = 135
local SILENT_AIM_SMOOTH = 0.25
local flyBV, flyBG = nil, nil
local connections = {}
local lastShotTime = 0
local espHighlights = {}
local currentSkinConnection = nil
local rainbowLoopActive = false

-- ===================== SKIN MAPS =====================
local colorMap = {
    ["Red Dragon"] = Color3.fromRGB(255,40,40), ["Ice Dragon"] = Color3.fromRGB(80,200,255),
    ["Golden"] = Color3.fromRGB(255,215,0), ["Neon Purple"] = Color3.fromRGB(200,0,255),
    ["Galaxy"] = Color3.fromRGB(120,60,255), ["Fire"] = Color3.fromRGB(255,80,0),
    ["Toxic"] = Color3.fromRGB(0,255,100), ["Shadow"] = Color3.fromRGB(20,20,30),
    ["Carbon Fiber"] = Color3.fromRGB(30,30,35), ["Chrome"] = Color3.fromRGB(200,200,210),
    ["Matte Black"] = Color3.fromRGB(15,15,15), ["Whiteout"] = Color3.fromRGB(240,240,255),
    ["Blood Red"] = Color3.fromRGB(180,0,0), ["Electric Blue"] = Color3.fromRGB(0,180,255),
    ["Pink Galaxy"] = Color3.fromRGB(255,100,200), ["Void"] = Color3.fromRGB(10,5,30),
    ["Inferno"] = Color3.fromRGB(255,120,0), ["Ocean"] = Color3.fromRGB(0,150,255),
    ["Emerald"] = Color3.fromRGB(0,255,120), ["Obsidian"] = Color3.fromRGB(25,20,40),
    ["Lightning"] = Color3.fromRGB(200,230,255),
}

local matMap = {
    ["Red Dragon"] = Enum.Material.Neon, ["Ice Dragon"] = Enum.Material.Ice,
    ["Golden"] = Enum.Material.ForceField, ["Neon Purple"] = Enum.Material.Neon,
    ["Fire"] = Enum.Material.Neon, ["Toxic"] = Enum.Material.Neon,
}

-- ===================== LOGIC FIXES =====================

local function applyVisualSkin(tool)
    if not tool or not state.skinChangerEnabled then return end
    local handle = tool:FindFirstChild("Handle") or tool:FindFirstChildWhichIsA("BasePart")
    if not handle then return end

    if state.selectedSkin == "Rainbow" then
        if rainbowLoopActive then return end
        rainbowLoopActive = true
        task.spawn(function()
            while tool.Parent == getChar() and state.selectedSkin == "Rainbow" and state.skinChangerEnabled do
                handle.Color = Color3.fromHSV((tick() % 5) / 5, 1, 1)
                handle.Material = Enum.Material.Neon
                task.wait()
            end
            rainbowLoopActive = false
        end)
    else
        handle.Color = colorMap[state.selectedSkin] or handle.Color
        handle.Material = matMap[state.selectedSkin] or Enum.Material.Plastic
    end
end

-- Improved ESP Cleanup
local function updateBoxESP()
    for plr, hl in pairs(espHighlights) do
        if not plr.Parent or not plr.Character or not state.boxESP then
            hl:Destroy()
            espHighlights[plr] = nil
        end
    end

    if not state.boxESP then return end

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= localPlayer and plr.Character then
            local hum = plr.Character:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                local hl = espHighlights[plr] or Instance.new("Highlight")
                hl.Adornee = plr.Character
                hl.FillTransparency = 0.6
                hl.OutlineTransparency = 0
                hl.FillColor = hum.Health > 30 and Color3.new(0,1,0) or Color3.new(1,0,0)
                hl.Parent = getHUI()
                espHighlights[plr] = hl
            end
        end
    end
end

-- Optimized Fly Logic
local function stopFly()
    if flyBV then flyBV:Destroy() flyBV = nil end
    if flyBG then flyBG:Destroy() flyBG = nil end
    local hum = getHum() if hum then hum.PlatformStand = false end
end

local function startFly()
    stopFly()
    local root = getRoot()
    local hum = getHum()
    if not root or not hum then return end
    hum.PlatformStand = true
    flyBV = Instance.new("BodyVelocity", root)
    flyBV.MaxForce = Vector3.new(1e9,1e9,1e9)
    flyBG = Instance.new("BodyGyro", root)
    flyBG.MaxTorque = Vector3.new(1e9,1e9,1e9)
end

-- ===================== RENDER LOOP =====================
local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 2
fovCircle.NumSides = 64
fovCircle.Color = Color3.fromRGB(255, 80, 80)

RunService.RenderStepped:Connect(function()
    fovCircle.Visible = (state.silentAim or state.aimbot) and state.showFOVCircle
    fovCircle.Position = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
    fovCircle.Radius = SILENT_AIM_FOV

    if state.noclip then
        local char = getChar()
        if char then
            for _, v in pairs(char:GetChildren()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end

    if state.boxESP then updateBoxESP() end
end)

-- ===================== UI SETUP =====================
local Window = Rayfield:CreateWindow({
    Name = "HDGB | Optimized",
    LoadingTitle = "HDGB Hub",
    KeySystem = true,
    KeySettings = {
        Title = "HDGB",
        Key = {"HDGB"}
    }
})

local CombatTab = Window:CreateTab("🎯 Combat")
CombatTab:CreateToggle({Name = "Silent Aim", CurrentValue = false, Callback = function(v) state.silentAim = v end})
CombatTab:CreateSlider({Name = "FOV Size", Range = {30, 300}, CurrentValue = 135, Callback = function(v) SILENT_AIM_FOV = v end})

local MoveTab = Window:CreateTab("✈️ Movement")
MoveTab:CreateToggle({Name = "Fly", CurrentValue = false, Callback = function(v) state.fly = v if v then startFly() else stopFly() end end})
MoveTab:CreateSlider({Name = "Fly Speed", Range = {30, 200}, CurrentValue = 80, Callback = function(v) state.flySpeed = v end})
MoveTab:CreateToggle({Name = "Noclip", CurrentValue = false, Callback = function(v) state.noclip = v end})

-- Heartbeat Loop for Flying/Speed
RunService.Heartbeat:Connect(function()
    if state.fly and flyBV and flyBG then
        local root = getRoot()
        if root then
            local dir = Vector3.zero
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += cam.CFrame.RightVector end
            flyBV.Velocity = dir * state.flySpeed
            flyBG.CFrame = cam.CFrame
        end
    end
    
    if state.speedBoost then
        local hum = getHum()
        if hum then hum.WalkSpeed = 16 + state.speedBoostAmount end
    end
end)

Rayfield:Notify({Title = "HDGB", Content = "Script Ready!", Duration = 5})
