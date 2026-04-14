local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Debris = game:GetService("Debris")
local TweenService = game:GetService("TweenService")
local localPlayer = Players.LocalPlayer

local function getChar() return localPlayer.Character end
local function getHum() return getChar() and getChar():FindFirstChildOfClass("Humanoid") end
local function getRoot() return getChar() and getChar():FindFirstChild("HumanoidRootPart") end
local function getCam() return workspace.CurrentCamera end

-- =====================
-- STATE
-- =====================
local state = {
    -- Movement
    fly = false, flySpeed = 80,
    superSpeed = false, speedAmount = 80,
    noclip = false, infiniteJump = false,
    megaJump = false, jumpPower = 150,
    gravityEnabled = false, gravityAmount = 20,
    hover = false, hoverSpeed = 5,
    teleportMode = false,
    wallClimb = false,
    platform = false, platformSize = 5,
    autoDash = false, dashSpeed = 150,
    -- Combat
    godMode = false,
    autoHeal = false, autoHealAmount = 10,
    noFallDamage = false,
    -- Visuals
    esp = false, chams = false,
    rainbow = false, invisible = false,
    spin = false, spinSpeed = 5,
    trail = false, fullbright = false,
    playerLines = false,
    bigHead = false, bigHeadSize = 3,
    giant = false, giantSize = 3,
    tiny = false,
    dance = false,
    bouncy = false, bouncyPower = 25,
    fireworks = false, confetti = false,
    nightMode = false, fog = false,
    rainbowSky = false, snow = false,
    -- Volleyball Legends
    hitboxEnabled = false, showVisual = true, hitboxSize = 10,
    powerBoostEnabled = false, powerBoostAmount = 50,
    autoRotate = false,
    -- Rivals
    silentAim = false, showFOVCircle = true,
    triggerbot = false, aimbot = false,
    boxESP = false,
    thirdPerson = false, thirdPersonDist = 15,
    -- Blox Fruits
    autoFarm = false,
    fruitESP = false,
    chestESP = false,
    mobESP = false,
    -- Utility
    antiAFK = false, autoClick = false,
    fov = 70,
    -- Extra
    superBounce = false,
    giantHead = false,
    superSpin = false,
    fastHeal = false,
    noGravity = false,
    moonGravity = false,
    magnetMode = false,
    freeze = false,
    chamsColor = false,
    redBody = false,
    blueBody = false,
    goldBody = false,
    blackBody = false,
    whiteBody = false,
    neonBody = false,
    shadowBody = false,
    longTrail = false,
    rainbowSkyEnabled = false,
    snowEnabled = false,
    redSky = false,
    blueSky = false,
    purpleSky = false,
    autoJump = false,
    crosshair = false,
}

local SILENT_AIM_FOV = 135
local SILENT_AIM_SMOOTH = 0.25
local connections = {}
local lastShotTime = 0
local espHighlights = {}
local espFolder = nil
local lineAdornments = {}
local chamsFolder = nil
local trailObj, trailA0, trailA1 = nil, nil, nil
local flyBV, flyBG = nil, nil
local originalGravity = workspace.Gravity
local originalJumpPower = 50
local crosshairGui = nil
local danceAngle = 0

-- =====================
-- VOLLEYBALL HITBOX
-- =====================
local ballSphere, lastBall, origBallSize = nil, nil, nil
local function getBall()
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj.Name:match("CLIENT_BALL_") then
            return obj:FindFirstChild("Sphere.001")
                or obj:FindFirstChild("Cube.001")
                or obj:FindFirstChildWhichIsA("BasePart")
        end
    end
end
local function removeBallVisual()
    if ballSphere then ballSphere:Destroy() ballSphere = nil end
end
local function createBallVisual()
    removeBallVisual()
    if not state.showVisual then return end
    local ball = getBall()
    if not ball then return end
    ballSphere = Instance.new("SelectionSphere")
    ballSphere.Adornee = ball
    ballSphere.Color3 = Color3.fromRGB(0,200,255)
    ballSphere.SurfaceTransparency = 0.5
    ballSphere.SurfaceColor3 = Color3.fromRGB(0,200,255)
    ballSphere.Parent = game:GetService("CoreGui")
end
local function expandBall(size)
    local ball = getBall()
    if ball then
        if not origBallSize then origBallSize = ball.Size end
        ball.Size = Vector3.new(size,size,size)
    end
end
local function resetBall()
    local ball = getBall()
    if ball and origBallSize then ball.Size = origBallSize origBallSize = nil end
end
local function applyPowerBoost(on, amt)
    local val = on and amt or 1
    for _, a in ipairs({"GameSpikePowerMultiplier","GameBumpPowerMultiplier","GameSetPowerMultiplier","GameServePowerMultiplier","GameBlockPowerMultiplier","GameTiltPowerMultiplier","GameJumpPowerMultiplier"}) do
        localPlayer:SetAttribute(a, val)
    end
end

-- =====================
-- FLY
-- =====================
local function stopFly()
    if flyBV then flyBV:Destroy() flyBV = nil end
    if flyBG then flyBG:Destroy() flyBG = nil end
    local hum = getHum()
    if hum then hum.PlatformStand = false end
end
local function startFly()
    stopFly()
    local root = getRoot() local hum = getHum()
    if not root or not hum then return end
    hum.PlatformStand = true
    flyBV = Instance.new("BodyVelocity")
    flyBV.MaxForce = Vector3.new(1e9,1e9,1e9)
    flyBV.Velocity = Vector3.zero
    flyBV.Parent = root
    flyBG = Instance.new("BodyGyro")
    flyBG.MaxTorque = Vector3.new(1e9,1e9,1e9)
    flyBG.P = 9e4
    flyBG.CFrame = root.CFrame
    flyBG.Parent = root
end

-- =====================
-- NOCLIP
-- =====================
local function startNoclip()
    if connections.noclip then connections.noclip:Disconnect() end
    connections.noclip = RunService.Stepped:Connect(function()
        if not state.noclip then return end
        local char = getChar()
        if char then for _,p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end end
    end)
end
local function stopNoclip()
    if connections.noclip then connections.noclip:Disconnect() connections.noclip = nil end
    local char = getChar()
    if char then for _,p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = true end end end
end

-- =====================
-- ESP (Universal Highlight)
-- =====================
local function clearESP()
    for _, h in pairs(espHighlights) do pcall(function() h:Destroy() end) end
    espHighlights = {}
    for k, c in pairs(connections) do
        if k:match("^esp_") then c:Disconnect() connections[k] = nil end
    end
end
local function buildESP()
    clearESP()
    if not state.esp then return end
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= localPlayer then
            local function attach(char)
                if not char then return end
                local hrp = char:FindFirstChild("HumanoidRootPart")
                local hum = char:FindFirstChildOfClass("Humanoid")
                if not hrp then return end
                local hl = Instance.new("Highlight")
                hl.Adornee = char
                hl.FillColor = Color3.fromRGB(255,50,50)
                hl.OutlineColor = Color3.fromRGB(255,255,255)
                hl.FillTransparency = 0.65
                hl.OutlineTransparency = 0
                hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                hl.Parent = game:GetService("CoreGui")
                espHighlights[p] = hl
                local bill = Instance.new("BillboardGui")
                bill.Size = UDim2.new(0,160,0,55)
                bill.StudsOffset = Vector3.new(0,4,0)
                bill.Adornee = hrp
                bill.AlwaysOnTop = true
                bill.Parent = game:GetService("CoreGui")
                local nameL = Instance.new("TextLabel")
                nameL.Size = UDim2.new(1,0,0.45,0)
                nameL.BackgroundTransparency = 1
                nameL.Text = "🎯 "..p.Name
                nameL.TextColor3 = Color3.fromRGB(255,80,80)
                nameL.TextSize = 14
                nameL.Font = Enum.Font.GothamBold
                nameL.TextStrokeTransparency = 0
                nameL.Parent = bill
                local hpL = Instance.new("TextLabel")
                hpL.Size = UDim2.new(1,0,0.3,0)
                hpL.Position = UDim2.new(0,0,0.45,0)
                hpL.BackgroundTransparency = 1
                hpL.TextSize = 11
                hpL.Font = Enum.Font.Gotham
                hpL.TextStrokeTransparency = 0
                hpL.Parent = bill
                local distL = Instance.new("TextLabel")
                distL.Size = UDim2.new(1,0,0.25,0)
                distL.Position = UDim2.new(0,0,0.75,0)
                distL.BackgroundTransparency = 1
                distL.TextColor3 = Color3.fromRGB(200,200,200)
                distL.TextSize = 10
                distL.Font = Enum.Font.Gotham
                distL.TextStrokeTransparency = 0
                distL.Parent = bill
                local key = "esp_"..p.Name
                if connections[key] then connections[key]:Disconnect() end
                connections[key] = RunService.Heartbeat:Connect(function()
                    if not (hum and hpL and hpL.Parent and hrp) then return end
                    local pct = math.floor((hum.Health/math.max(hum.MaxHealth,1))*100)
                    hpL.Text = "❤️ "..math.floor(hum.Health).." ("..pct.."%)"
                    hpL.TextColor3 = pct>60 and Color3.fromRGB(100,255,100) or pct>30 and Color3.fromRGB(255,200,0) or Color3.fromRGB(255,50,50)
                    local myRoot = getRoot()
                    if myRoot then distL.Text = "📏 "..math.floor((hrp.Position-myRoot.Position).Magnitude).." studs" end
                end)
            end
            attach(p.Character)
            p.CharacterAdded:Connect(function(c) task.wait(1) if state.esp then attach(c) end end)
        end
    end
end

-- =====================
-- CHAMS
-- =====================
local function clearChams()
    if chamsFolder then chamsFolder:Destroy() chamsFolder = nil end
end
local function buildChams()
    clearChams()
    if not state.chams then return end
    chamsFolder = Instance.new("Folder")
    chamsFolder.Name = "Chams"
    chamsFolder.Parent = game:GetService("CoreGui")
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= localPlayer then
            local function applyChams(char)
                if not char then return end
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                local sphere = Instance.new("SelectionSphere")
                sphere.Adornee = hrp
                sphere.Color3 = Color3.fromRGB(255,0,80)
                sphere.SurfaceTransparency = 0.3
                sphere.SurfaceColor3 = Color3.fromRGB(255,0,80)
                sphere.Parent = chamsFolder
            end
            applyChams(p.Character)
            p.CharacterAdded:Connect(function(c) task.wait(1) if state.chams then applyChams(c) end end)
        end
    end
end

-- =====================
-- PLAYER LINES
-- =====================
local function clearLines()
    for _, a in pairs(lineAdornments) do pcall(function() a:Destroy() end) end
    lineAdornments = {}
end
local function rebuildLines()
    clearLines()
    if not state.playerLines then return end
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= localPlayer and p.Character then
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local line = Instance.new("BoxHandleAdornment")
                line.Adornee = hrp
                line.Size = Vector3.new(0.08,0.08,14)
                line.CFrame = CFrame.new(0,0,-7)
                line.Color3 = Color3.fromRGB(255,50,50)
                line.AlwaysOnTop = true
                line.Transparency = 0.1
                line.Parent = game:GetService("CoreGui")
                table.insert(lineAdornments, line)
            end
        end
    end
end

-- =====================
-- TRAIL
-- =====================
local function removeTrail()
    if trailObj then trailObj:Destroy() trailObj = nil end
    if trailA0 then trailA0:Destroy() trailA0 = nil end
    if trailA1 then trailA1:Destroy() trailA1 = nil end
end
local function createTrail(lifetime)
    removeTrail()
    local root = getRoot() if not root then return end
    trailA0 = Instance.new("Attachment") trailA0.Position = Vector3.new(0,1,0) trailA0.Parent = root
    trailA1 = Instance.new("Attachment") trailA1.Position = Vector3.new(0,-1,0) trailA1.Parent = root
    trailObj = Instance.new("Trail")
    trailObj.Attachment0 = trailA0 trailObj.Attachment1 = trailA1
    trailObj.Lifetime = lifetime or 0.6 trailObj.MinLength = 0
    trailObj.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,128)),
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0,200,255)),
        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(128,0,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255,200,0)),
    })
    trailObj.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0)})
    trailObj.Parent = root
end

-- =====================
-- FULLBRIGHT
-- =====================
local function setFullbright(on)
    if on then Lighting.Brightness=10 Lighting.ClockTime=14 Lighting.FogEnd=1e6 Lighting.GlobalShadows=false Lighting.Ambient=Color3.fromRGB(255,255,255)
    else Lighting.Brightness=1 Lighting.ClockTime=14 Lighting.FogEnd=1e4 Lighting.GlobalShadows=true Lighting.Ambient=Color3.fromRGB(127,127,127) end
end

-- =====================
-- BODY COLOR
-- =====================
local function setBodyColor(on, color)
    local char = getChar() if not char then return end
    for _,p in pairs(char:GetDescendants()) do
        if p:IsA("BasePart") then
            if on then p.Color = color p.Material = Enum.Material.SmoothPlastic
            else p.Material = Enum.Material.SmoothPlastic end
        end
    end
end

-- =====================
-- CROSSHAIR
-- =====================
local function createCrosshair()
    if crosshairGui then crosshairGui:Destroy() end
    crosshairGui = Instance.new("ScreenGui")
    crosshairGui.Name = "Crosshair"
    crosshairGui.ResetOnSpawn = false
    crosshairGui.IgnoreGuiInset = true
    crosshairGui.Parent = game:GetService("CoreGui")
    local function makeLine(w,h,ox,oy)
        local f = Instance.new("Frame")
        f.Size = UDim2.new(0,w,0,h)
        f.Position = UDim2.new(0.5,ox,0.5,oy)
        f.BackgroundColor3 = Color3.fromRGB(0,255,100)
        f.BorderSizePixel = 0
        f.Parent = crosshairGui
    end
    makeLine(20,2,-10,-1) makeLine(2,20,-1,-10)
    local dot = Instance.new("Frame")
    dot.Size = UDim2.new(0,4,0,4) dot.Position = UDim2.new(0.5,-2,0.5,-2)
    dot.BackgroundColor3 = Color3.fromRGB(0,255,100) dot.BorderSizePixel = 0 dot.Parent = crosshairGui
    Instance.new("UICorner",dot).CornerRadius = UDim.new(1,0)
end
local function removeCrosshair()
    if crosshairGui then crosshairGui:Destroy() crosshairGui = nil end
end

-- =====================
-- RIVALS: SILENT AIM TARGET
-- =====================
local function getSilentAimTarget()
    local closest, minAngle = nil, SILENT_AIM_FOV
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= localPlayer and p.Character then
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            if hrp and hum and hum.Health > 0 then
                local _, onScreen = getCam():WorldToScreenPoint(hrp.Position)
                if onScreen then
                    local dir = (hrp.Position - getCam().CFrame.Position).Unit
                    local angle = math.deg(math.acos(math.clamp(getCam().CFrame.LookVector:Dot(dir),-1,1)))
                    if angle < minAngle then minAngle = angle closest = hrp end
                end
            end
        end
    end
    return closest
end

-- RIVALS: TRIGGERBOT
local function getTargetUnderCrosshair()
    local ray = getCam():ScreenPointToRay(getCam().ViewportSize.X/2, getCam().ViewportSize.Y/2)
    local params = RaycastParams.new()
    params.FilterDescendantsInstances = {localPlayer.Character}
    params.FilterType = Enum.RaycastFilterType.Exclude
    local result = workspace:Raycast(ray.Origin, ray.Direction*1000, params)
    if result and result.Instance then
        local model = result.Instance:FindFirstAncestorWhichIsA("Model")
        if model and model ~= getChar() then
            local hum = model:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then return model:FindFirstChild("HumanoidRootPart") end
        end
    end
    return nil
end
local function canShoot() return tick() - lastShotTime > 0.12 end
local function shootGun()
    if not canShoot() then return end
    local char = getChar() if not char then return end
    local tool = char:FindFirstChildWhichIsA("Tool")
    if tool then tool:Activate() lastShotTime = tick() end
end

-- =====================
-- FOV CIRCLE
-- =====================
local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 2
fovCircle.Filled = false
fovCircle.NumSides = 64
fovCircle.Color = Color3.fromRGB(255,80,80)
fovCircle.Visible = false

-- =====================
-- BLOX FRUITS: FRUIT ESP
-- =====================
local fruitESPFolder = nil
local function clearFruitESP()
    if fruitESPFolder then fruitESPFolder:Destroy() fruitESPFolder = nil end
end
local function buildFruitESP()
    clearFruitESP()
    if not state.fruitESP then return end
    fruitESPFolder = Instance.new("Folder")
    fruitESPFolder.Name = "FruitESP"
    fruitESPFolder.Parent = game:GetService("CoreGui")
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj.Name:lower():find("fruit") then
            local hrp = obj:FindFirstChildWhichIsA("BasePart")
            if hrp then
                local bill = Instance.new("BillboardGui")
                bill.Size = UDim2.new(0,120,0,40)
                bill.StudsOffset = Vector3.new(0,3,0)
                bill.Adornee = hrp
                bill.AlwaysOnTop = true
                bill.Parent = fruitESPFolder
                local lbl = Instance.new("TextLabel")
                lbl.Size = UDim2.new(1,0,1,0)
                lbl.BackgroundTransparency = 1
                lbl.Text = "🍎 "..obj.Name
                lbl.TextColor3 = Color3.fromRGB(255,200,0)
                lbl.TextSize = 13
                lbl.Font = Enum.Font.GothamBold
                lbl.TextStrokeTransparency = 0
                lbl.Parent = bill
            end
        end
    end
end

-- BLOX FRUITS: CHEST ESP
local chestESPFolder = nil
local function clearChestESP()
    if chestESPFolder then chestESPFolder:Destroy() chestESPFolder = nil end
end
local function buildChestESP()
    clearChestESP()
    if not state.chestESP then return end
    chestESPFolder = Instance.new("Folder")
    chestESPFolder.Name = "ChestESP"
    chestESPFolder.Parent = game:GetService("CoreGui")
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and (obj.Name:lower():find("chest") or obj.Name:lower():find("box")) then
            local hrp = obj:FindFirstChildWhichIsA("BasePart")
            if hrp then
                local bill = Instance.new("BillboardGui")
                bill.Size = UDim2.new(0,120,0,35)
                bill.StudsOffset = Vector3.new(0,3,0)
                bill.Adornee = hrp
                bill.AlwaysOnTop = true
                bill.Parent = chestESPFolder
                local lbl = Instance.new("TextLabel")
                lbl.Size = UDim2.new(1,0,1,0)
                lbl.BackgroundTransparency = 1
                lbl.Text = "📦 "..obj.Name
                lbl.TextColor3 = Color3.fromRGB(255,165,0)
                lbl.TextSize = 13
                lbl.Font = Enum.Font.GothamBold
                lbl.TextStrokeTransparency = 0
                lbl.Parent = bill
            end
        end
    end
end

-- =====================
-- DISABLE ALL
-- =====================
local function disableAll()
    for k,_ in pairs(state) do if type(state[k])=="boolean" then state[k]=false end end
    stopFly() stopNoclip() removeTrail()
    clearESP() clearChams() clearLines()
    clearFruitESP() clearChestESP()
    removeCrosshair() resetBall() removeBallVisual()
    applyPowerBoost(false,1) setFullbright(false)
    fovCircle.Visible = false
    getCam().FieldOfView = 70
    getCam().CameraType = Enum.CameraType.Custom
    workspace.Gravity = originalGravity
    for k,c in pairs(connections) do if c and c.Disconnect then c:Disconnect() end connections[k]=nil end
    local hum = getHum()
    if hum then hum.WalkSpeed=16 hum.JumpPower=50 hum.MaxHealth=100 hum.Health=100 end
    Lighting.Brightness=1 Lighting.GlobalShadows=true Lighting.FogEnd=1e4 Lighting.Ambient=Color3.fromRGB(127,127,127)
    Rayfield:Notify({Title="All Clear ✅",Content="Every mod disabled",Duration=3})
end

-- =====================
-- MAIN LOOP
-- =====================
local timers = {ball=0,esp=0,lines=0,chams=0,fruit=0,chest=0,fireworks=0,confetti=0,autoJump=0,snow=0}
local rainbowColors = {Color3.fromRGB(255,0,0),Color3.fromRGB(255,100,0),Color3.fromRGB(255,255,0),Color3.fromRGB(0,255,0),Color3.fromRGB(0,255,255),Color3.fromRGB(0,100,255),Color3.fromRGB(180,0,255)}
local skyColors = {Color3.fromRGB(255,0,0),Color3.fromRGB(0,200,255),Color3.fromRGB(0,255,0),Color3.fromRGB(255,165,0),Color3.fromRGB(180,0,255)}
local rainbowIdx = 1 local rainbowTimer = 0
local skyIdx = 1 local skyTimer = 0

RunService.Heartbeat:Connect(function(dt)
    for k,_ in pairs(timers) do timers[k] = timers[k] + dt end
    rainbowTimer += dt skyTimer += dt

    -- Ball hitbox check every 0.5s
    if timers.ball >= 0.5 then
        timers.ball = 0
        local ball = getBall()
        if ball ~= lastBall then
            lastBall = ball origBallSize = nil
            if state.hitboxEnabled and ball then expandBall(state.hitboxSize) end
            if state.showVisual and state.hitboxEnabled then createBallVisual() end
        end
    end

    if timers.esp >= 5 then timers.esp=0 if state.esp then buildESP() end end
    if timers.lines >= 3 then timers.lines=0 if state.playerLines then rebuildLines() end end
    if timers.chams >= 5 then timers.chams=0 if state.chams then buildChams() end end
    if timers.fruit >= 5 then timers.fruit=0 if state.fruitESP then buildFruitESP() end end
    if timers.chest >= 5 then timers.chest=0 if state.chestESP then buildChestESP() end end

    -- Fly
    if state.fly and flyBV then
        local root = getRoot()
        if root then
            if flyBV.Parent ~= root then flyBV.Parent = root end
            local cam = getCam() local move = Vector3.zero
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then move += cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then move -= cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then move -= cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then move += cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move += Vector3.new(0,1,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then move -= Vector3.new(0,1,0) end
            flyBV.Velocity = move.Magnitude>0 and move.Unit*state.flySpeed or Vector3.zero
            if flyBG then flyBG.CFrame = cam.CFrame end
        end
    end

    -- Rainbow
    if state.rainbow and rainbowTimer >= 0.07 then
        rainbowTimer = 0 rainbowIdx = (rainbowIdx%#rainbowColors)+1
        local char = getChar()
        if char then for _,p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.Color=rainbowColors[rainbowIdx] end end end
    end

    -- Rainbow sky
    if state.rainbowSkyEnabled and skyTimer >= 1 then
        skyTimer = 0 skyIdx = (skyIdx%#skyColors)+1
        Lighting.Ambient = skyColors[skyIdx]
    end

    -- Spin
    if state.spin then local root=getRoot() if root then root.CFrame*=CFrame.Angles(0,math.rad(state.spinSpeed),0) end end
    if state.superSpin then local root=getRoot() if root then root.CFrame*=CFrame.Angles(0,math.rad(25),0) end end

    -- Dance
    if state.dance then
        local root = getRoot()
        if root then danceAngle+=dt*120 root.CFrame=root.CFrame*CFrame.Angles(0,math.rad(math.sin(danceAngle)*30),0) end
    end

    -- God mode
    if state.godMode then local hum=getHum() if hum and hum.Health<hum.MaxHealth then hum.Health=hum.MaxHealth end end
    if state.autoHeal then local hum=getHum() if hum and hum.Health<hum.MaxHealth then hum.Health=math.min(hum.MaxHealth,hum.Health+state.autoHealAmount*dt) end end
    if state.fastHeal then local hum=getHum() if hum and hum.Health<hum.MaxHealth then hum.Health=math.min(hum.MaxHealth,hum.Health+50*dt) end end
    if state.noFallDamage then local hum=getHum() if hum then hum.MaxHealth=1e6 hum.Health=1e6 end end

    -- Hover
    if state.hover then
        local root=getRoot()
        if root and root.Velocity.Y < 0 then root.Velocity=Vector3.new(root.Velocity.X,-state.hoverSpeed,root.Velocity.Z) end
    end

    -- Bouncy
    if state.bouncy then local root=getRoot() if root and root.Velocity.Y<-10 then root.Velocity=Vector3.new(root.Velocity.X,state.bouncyPower,root.Velocity.Z) end end
    if state.superBounce then local root=getRoot() if root and root.Velocity.Y<-5 then root.Velocity=Vector3.new(root.Velocity.X,150,root.Velocity.Z) end end

    -- Big head
    if state.bigHead then local char=getChar() if char and char:FindFirstChild("Head") then char.Head.Size=Vector3.new(state.bigHeadSize,state.bigHeadSize,state.bigHeadSize) end end
    if state.giantHead then local char=getChar() if char and char:FindFirstChild("Head") then char.Head.Size=Vector3.new(8,8,8) end end

    -- Fireworks
    if state.fireworks and timers.fireworks>=0.1 then
        timers.fireworks=0 local root=getRoot()
        if root then local f=Instance.new("Part") f.Size=Vector3.new(0.5,0.5,0.5) f.Shape=Enum.PartType.Ball f.Position=root.Position+Vector3.new(math.random(-8,8),math.random(3,12),math.random(-8,8)) f.Anchored=true f.BrickColor=BrickColor.random() f.Material=Enum.Material.Neon f.Parent=workspace Debris:AddItem(f,0.8) end
    end

    -- Confetti
    if state.confetti and timers.confetti>=0.05 then
        timers.confetti=0 local root=getRoot()
        if root then for i=1,3 do local c=Instance.new("Part") c.Size=Vector3.new(0.15,0.15,0.15) c.Position=root.Position+Vector3.new(math.random(-3,3),math.random(0,4),math.random(-3,3)) c.Anchored=true c.BrickColor=BrickColor.random() c.Parent=workspace Debris:AddItem(c,1.5) end end
    end

    -- Snow
    if state.snowEnabled and timers.snow>=0.05 then
        timers.snow=0 local root=getRoot()
        if root then local s=Instance.new("Part") s.Size=Vector3.new(0.2,0.2,0.2) s.Shape=Enum.PartType.Ball s.Position=root.Position+Vector3.new(math.random(-20,20),20,math.random(-20,20)) s.BrickColor=BrickColor.new("White") s.Transparency=0.3 s.Parent=workspace Debris:AddItem(s,5) end
    end

    -- Wall climb
    if state.wallClimb then
        local root=getRoot() local char=getChar()
        if root and char then
            local params=RaycastParams.new() params.FilterDescendantsInstances={char}
            local ray=workspace:Raycast(root.Position,root.CFrame.LookVector*3,params)
            if ray and ray.Normal.Y<0.5 then root.Velocity=Vector3.new(0,20,0) end
        end
    end

    -- Magnet
    if state.magnetMode then
        local myRoot=getRoot()
        for _,p in pairs(Players:GetPlayers()) do
            if p~=localPlayer and p.Character then
                local hrp=p.Character:FindFirstChild("HumanoidRootPart")
                if hrp and myRoot then hrp.Velocity=(myRoot.Position-hrp.Position).Unit*80 end
            end
        end
    end

    -- Freeze players
    if state.freeze then
        for _,p in pairs(Players:GetPlayers()) do
            if p~=localPlayer and p.Character then
                local hum=p.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum.WalkSpeed=0 hum.JumpPower=0 end
            end
        end
    end

    -- No gravity
    if state.noGravity then workspace.Gravity=0
    elseif state.moonGravity then workspace.Gravity=16 end

    -- Auto jump
    if state.autoJump and timers.autoJump>=2 then
        timers.autoJump=0 local hum=getHum() if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end

    -- Auto dash
    if state.autoDash and timers.autoDash >= nil then
        if not timers.autoDash then timers.autoDash = 0 end
        timers.autoDash = (timers.autoDash or 0) + dt
        if timers.autoDash >= 1 then
            timers.autoDash = 0
            local root = getRoot()
            if root then root.Velocity = getCam().CFrame.LookVector * state.dashSpeed end
        end
    end
end)

-- =====================
-- RENDER LOOP (Aims + Camera)
-- =====================
RunService.RenderStepped:Connect(function()
    local cam = getCam()
    fovCircle.Position = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
    fovCircle.Radius = SILENT_AIM_FOV * 0.78

    local anyAim = state.silentAim or state.aimbot
    fovCircle.Visible = anyAim and state.showFOVCircle

    if anyAim then
        local target = getSilentAimTarget()
        if target then
            fovCircle.Color = Color3.fromRGB(255,40,40)
            local smooth = state.aimbot and 0.45 or SILENT_AIM_SMOOTH
            cam.CFrame = cam.CFrame:Lerp(CFrame.lookAt(cam.CFrame.Position, target.Position+Vector3.new(0,2.5,0)), smooth)
            if state.aimbot then shootGun() end
        else
            fovCircle.Color = Color3.fromRGB(255,200,0)
        end
    end

    if state.triggerbot then
        local t = getTargetUnderCrosshair()
        if t then shootGun() end
    end

    -- Third person
    if state.thirdPerson and not state.aimbot and not state.silentAim then
        local root = getRoot()
        if root then
            if cam.CameraType ~= Enum.CameraType.Scriptable then cam.CameraType = Enum.CameraType.Scriptable end
            local yaw = math.atan2(-root.CFrame.LookVector.X,-root.CFrame.LookVector.Z)
            cam.CFrame = CFrame.new(root.Position+Vector3.new(0,3,0))*CFrame.Angles(0,yaw,0)*CFrame.new(0,1.8,-state.thirdPersonDist)
        end
    elseif cam.CameraType==Enum.CameraType.Scriptable and not state.thirdPerson and not state.aimbot and not state.silentAim then
        cam.CameraType = Enum.CameraType.Custom
    end
end)

-- Infinite jump
UserInputService.JumpRequest:Connect(function()
    if state.infiniteJump then local hum=getHum() if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end end
    if state.platform then
        local root=getRoot() if not root then return end
        local plat=Instance.new("Part") plat.Size=Vector3.new(state.platformSize,0.5,state.platformSize)
        plat.Position=Vector3.new(root.Position.X,root.Position.Y-3,root.Position.Z)
        plat.Anchored=true plat.BrickColor=BrickColor.new("Bright red") plat.Material=Enum.Material.Neon plat.Transparency=0.3 plat.Parent=workspace
        Debris:AddItem(plat,5)
    end
end)

-- Teleport on click
local mouse = localPlayer:GetMouse()
mouse.Button1Down:Connect(function()
    if state.teleportMode then local root=getRoot() if root and mouse.Target then root.CFrame=CFrame.new(mouse.Hit.p+Vector3.new(0,3,0)) end end
end)

-- Respawn handler
localPlayer.CharacterAdded:Connect(function()
    task.wait(0.8)
    origBallSize=nil lastBall=nil
    if state.superSpeed then local h=getHum() if h then h.WalkSpeed=state.speedAmount end end
    if state.megaJump then local h=getHum() if h then h.JumpPower=state.jumpPower end end
    if state.fly then task.wait(0.2) startFly() end
    if state.noclip then startNoclip() end
    if state.trail or state.longTrail then task.wait(0.2) createTrail(state.longTrail and 2 or 0.6) end
    if state.esp then task.wait(1) buildESP() end
    if state.chams then task.wait(1) buildChams() end
    if state.crosshair then createCrosshair() end
end)

Players.PlayerAdded:Connect(function() task.wait(1) if state.esp then buildESP() end if state.playerLines then rebuildLines() end end)
Players.PlayerRemoving:Connect(function(p)
    if espHighlights[p] then espHighlights[p]:Destroy() espHighlights[p]=nil end
    task.wait(0.2) if state.esp then buildESP() end
end)

-- =====================
-- MOBILE FLY PAD
-- =====================
local mobileGui = Instance.new("ScreenGui")
mobileGui.Name = "MobileFly"
mobileGui.ResetOnSpawn = false
mobileGui.IgnoreGuiInset = true
mobileGui.Parent = game:GetService("CoreGui")

local mobileInput = {forward=false,back=false,left=false,right=false,up=false,down=false}
local mobileContainer = Instance.new("Frame")
mobileContainer.Size = UDim2.new(0,220,0,220)
mobileContainer.Position = UDim2.new(1,-230,1,-230)
mobileContainer.BackgroundTransparency = 1
mobileContainer.Visible = false
mobileContainer.Parent = mobileGui

local function makeMBtn(text,color,x,y,sz)
    sz=sz or 65
    local btn=Instance.new("TextButton") btn.Size=UDim2.new(0,sz,0,sz) btn.Position=UDim2.new(0,x,0,y) btn.BackgroundColor3=color btn.BackgroundTransparency=0.2 btn.Text=text btn.TextColor3=Color3.fromRGB(255,255,255) btn.TextSize=20 btn.Font=Enum.Font.GothamBold btn.AutoButtonColor=false btn.Parent=mobileContainer
    Instance.new("UICorner",btn).CornerRadius=UDim.new(0,14)
    return btn
end
local red=Color3.fromRGB(200,40,40)
local mFwd=makeMBtn("↑",red,75,0) local mBck=makeMBtn("↓",red,75,150) local mLft=makeMBtn("←",red,0,75) local mRgt=makeMBtn("→",red,150,75)
local mUp=makeMBtn("▲",Color3.fromRGB(0,150,60),148,78,30) mUp.Size=UDim2.new(0,30,0,30)
local mDn=makeMBtn("▼",Color3.fromRGB(60,60,60),148,112,30) mDn.Size=UDim2.new(0,30,0,30)

local mToggle=Instance.new("TextButton") mToggle.Size=UDim2.new(0,55,0,55) mToggle.Position=UDim2.new(0,10,1,-70) mToggle.BackgroundColor3=Color3.fromRGB(200,40,40) mToggle.BackgroundTransparency=0.2 mToggle.Text="✈️" mToggle.TextSize=24 mToggle.Font=Enum.Font.GothamBold mToggle.TextColor3=Color3.fromRGB(255,255,255) mToggle.Parent=mobileGui
Instance.new("UICorner",mToggle).CornerRadius=UDim.new(0,14)

local function bindMHold(btn,key)
    btn.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then mobileInput[key]=true btn.BackgroundTransparency=0.05 end end)
    btn.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then mobileInput[key]=false btn.BackgroundTransparency=0.2 end end)
end
bindMHold(mFwd,"forward") bindMHold(mBck,"back") bindMHold(mLft,"left") bindMHold(mRgt,"right") bindMHold(mUp,"up") bindMHold(mDn,"down")

local mVisible=false
mToggle.MouseButton1Click:Connect(function()
    mVisible=not mVisible mobileContainer.Visible=mVisible state.fly=mVisible
    if mVisible then startFly() mToggle.BackgroundColor3=Color3.fromRGB(255,80,80)
    else stopFly() for k in pairs(mobileInput) do mobileInput[k]=false end mToggle.BackgroundColor3=Color3.fromRGB(200,40,40) end
end)

RunService.Heartbeat:Connect(function()
    if not state.fly or not flyBV then return end
    local root=getRoot() if not root then return end
    if flyBV.Parent~=root then flyBV.Parent=root end
    local cam=getCam() local move=Vector3.zero
    if UserInputService:IsKeyDown(Enum.KeyCode.W) or mobileInput.forward then move+=cam.CFrame.LookVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) or mobileInput.back then move-=cam.CFrame.LookVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) or mobileInput.left then move-=cam.CFrame.RightVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) or mobileInput.right then move+=cam.CFrame.RightVector end
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) or mobileInput.up then move+=Vector3.new(0,1,0) end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or mobileInput.down then move-=Vector3.new(0,1,0) end
    flyBV.Velocity=move.Magnitude>0 and move.Unit*state.flySpeed or Vector3.zero
    if flyBG then flyBG.CFrame=getCam().CFrame end
end)

-- =====================
-- RAYFIELD UI
-- =====================
local Window = Rayfield:CreateWindow({
    Name = "HDGB Premium Ultra",
    LoadingTitle = "HDGB Premium Ultra",
    LoadingSubtitle = "by HDGB | All Games | 100+ Mods",
    ConfigurationSaving = {Enabled=true, FolderName="HDGBPremium", FileName="Config"},
    Discord = {Enabled=false},
    KeySystem = true,
    KeySettings = {
        Title = "HDGB Premium Ultra",
        Subtitle = "Key System",
        Note = "Key starts with D and ends with F. Example: DHDGBF",
        FileName = "HDGBKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"DHDGBF","DTESTF","D123F","DABCDF","DANYTHINGF"}
    }
})

local function T(tab,name,desc,flag,onEn,onDis)
    tab:CreateToggle({Name=name,Description=desc,CurrentValue=false,Flag=flag,Callback=function(v) if v then onEn() else onDis() end end})
end
local function S(tab,name,desc,flag,mn,mx,inc,suf,def,cb)
    tab:CreateSlider({Name=name,Description=desc,Flag=flag,Range={mn,mx},Increment=inc,Suffix=suf,CurrentValue=def,Callback=cb})
end
local function B(tab,name,desc,cb)
    tab:CreateButton({Name=name,Description=desc,Callback=cb})
end
local function D(tab,name,desc,flag,opts,def,cb)
    tab:CreateDropdown({Name=name,Description=desc,Flag=flag,Options=opts,CurrentOption={def},MultipleOptions=false,Callback=cb})
end
local function noop() end

-- ====== 📋 ALL MODS TAB ======
local AllTab = Window:CreateTab("📋 All Mods", 4483362458)

AllTab:CreateSection("🏐 Volleyball Legends")
T(AllTab,"Hitbox Extender","Expand ball — hit from far away","A_Hitbox",function() state.hitboxEnabled=true expandBall(state.hitboxSize) if state.showVisual then createBallVisual() end end,function() state.hitboxEnabled=false resetBall() removeBallVisual() end)
T(AllTab,"Show Ball Visual","Cyan sphere on ball","A_BallVis",function() state.showVisual=true if state.hitboxEnabled then createBallVisual() end end,function() state.showVisual=false removeBallVisual() end)
S(AllTab,"Hitbox Size","Ball hitbox studs","A_HBSize",1,60,1," studs",10,function(v) state.hitboxSize=v if state.hitboxEnabled then expandBall(v) end end)
T(AllTab,"Power Boost","Boost all volleyball powers","A_PBoost",function() state.powerBoostEnabled=true applyPowerBoost(true,state.powerBoostAmount) end,function() state.powerBoostEnabled=false applyPowerBoost(false,1) end)
S(AllTab,"Boost Multiplier","Power amount","A_BAmt",1,500,5,"x",50,function(v) state.powerBoostAmount=v if state.powerBoostEnabled then applyPowerBoost(true,v) end end)
T(AllTab,"Auto Rotate","Keep auto rotate on in air","A_AutoRot",function()
    state.autoRotate=true
    if connections.autoRotate then connections.autoRotate:Disconnect() end
    connections.autoRotate=RunService.Heartbeat:Connect(function()
        if state.autoRotate then local hum=getHum() if hum and not hum.AutoRotate then hum.AutoRotate=true end end
    end)
end,function() state.autoRotate=false if connections.autoRotate then connections.autoRotate:Disconnect() connections.autoRotate=nil end end)
B(AllTab,"🏐 Teleport to Ball","Warp to the ball",function()
    local ball=getBall() local root=getRoot()
    if ball and root then root.CFrame=CFrame.new(ball.Position+Vector3.new(0,5,0)) Rayfield:Notify({Title="Teleported",Content="Warped to ball!",Duration=2})
    else Rayfield:Notify({Title="No Ball",Content="Ball not found",Duration=2}) end
end)
B(AllTab,"💥 Powerful Serve","Max power serve",function()
    local ok,svc=pcall(function() return game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.7.0"].knit.Services.GameService.RF.Serve end)
    if ok and svc then svc:InvokeServer(Vector3.new(0,0,0),math.huge) Rayfield:Notify({Title="Served!",Content="Max power!",Duration=2})
    else Rayfield:Notify({Title="Error",Content="Only in Volleyball Legends",Duration=3}) end
end)

AllTab:CreateSection("🎯 Rivals")
T(AllTab,"Silent Aim","Smooth camera snap to nearest enemy","A_SAim",function() state.silentAim=true end,function() state.silentAim=false fovCircle.Visible=false getCam().CameraType=Enum.CameraType.Custom end)
T(AllTab,"Aimbot","Strong snap + auto shoot","A_Aimbot",function() state.aimbot=true end,function() state.aimbot=false getCam().CameraType=Enum.CameraType.Custom end)
T(AllTab,"Triggerbot","Auto shoot when crosshair on enemy","A_Tbot",function() state.triggerbot=true end,function() state.triggerbot=false end)
T(AllTab,"Show FOV Circle","Draw aim range circle","A_FOVV",function() state.showFOVCircle=true end,function() state.showFOVCircle=false fovCircle.Visible=false end)
S(AllTab,"Aim FOV","Snap range degrees","A_AFOV",10,180,5,"°",135,function(v) SILENT_AIM_FOV=v fovCircle.Radius=v*0.78 end)
S(AllTab,"Aim Smoothness","Camera lerp speed","A_ASmooth",1,40,1,"",25,function(v) SILENT_AIM_SMOOTH=v/100 end)
T(AllTab,"Box ESP","Highlight enemies through walls","A_BESP",function() state.esp=true buildESP() end,function() state.esp=false clearESP() end)
T(AllTab,"Chams","Glowing sphere on enemies","A_Chams",function() state.chams=true buildChams() end,function() state.chams=false clearChams() end)
T(AllTab,"Player Look Lines","Direction lines per enemy","A_PLines",function() state.playerLines=true rebuildLines() end,function() state.playerLines=false clearLines() end)
T(AllTab,"Third Person","View from behind","A_TP",function() state.thirdPerson=true end,function() state.thirdPerson=false getCam().CameraType=Enum.CameraType.Custom end)
S(AllTab,"Third Person Dist","Camera distance","A_TPDist",5,30,1," studs",15,function(v) state.thirdPersonDist=v end)
T(AllTab,"Custom Crosshair","Green precision crosshair","A_Cross",function() state.crosshair=true createCrosshair() end,function() state.crosshair=false removeCrosshair() end)

AllTab:CreateSection("🍎 Blox Fruits")
T(AllTab,"Fruit ESP","See devil fruits on the map","A_FruitESP",function() state.fruitESP=true buildFruitESP() end,function() state.fruitESP=false clearFruitESP() end)
T(AllTab,"Chest ESP","See treasure chests","A_ChestESP",function() state.chestESP=true buildChestESP() end,function() state.chestESP=false clearChestESP() end)
B(AllTab,"🔄 Refresh Fruit & Chest ESP","Rebuild all Blox Fruits ESP",function()
    if state.fruitESP then buildFruitESP() end
    if state.chestESP then buildChestESP() end
    Rayfield:Notify({Title="Refreshed",Content="Blox Fruits ESP rebuilt",Duration=2})
end)
B(AllTab,"🍎 Teleport to Nearest Fruit","Warp to closest devil fruit",function()
    local root=getRoot() if not root then return end
    local closest,closestDist=nil,math.huge
    for _,obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj.Name:lower():find("fruit") then
            local hrp=obj:FindFirstChildWhichIsA("BasePart")
            if hrp then
                local dist=(hrp.Position-root.Position).Magnitude
                if dist<closestDist then closestDist=dist closest=hrp end
            end
        end
    end
    if closest then root.CFrame=CFrame.new(closest.Position+Vector3.new(0,5,0)) Rayfield:Notify({Title="Teleported",Content="Warped to fruit!",Duration=2})
    else Rayfield:Notify({Title="No Fruit",Content="No fruits found nearby",Duration=2}) end
end)
B(AllTab,"📦 Teleport to Nearest Chest","Warp to closest chest",function()
    local root=getRoot() if not root then return end
    local closest,closestDist=nil,math.huge
    for _,obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and (obj.Name:lower():find("chest") or obj.Name:lower():find("box")) then
            local hrp=obj:FindFirstChildWhichIsA("BasePart")
            if hrp then
                local dist=(hrp.Position-root.Position).Magnitude
                if dist<closestDist then closestDist=dist closest=hrp end
            end
        end
    end
    if closest then root.CFrame=CFrame.new(closest.Position+Vector3.new(0,5,0)) Rayfield:Notify({Title="Teleported",Content="Warped to chest!",Duration=2})
    else Rayfield:Notify({Title="No Chest",Content="No chests found",Duration=2}) end
end)

AllTab:CreateSection("✈️ Movement")
T(AllTab,"Fly Mode","WASD+Space/Ctrl. Tap ✈️ mobile","A_Fly",function() state.fly=true startFly() end,function() state.fly=false stopFly() end)
S(AllTab,"Fly Speed","Flight speed","A_FlySpd",5,400,5," spd",80,function(v) state.flySpeed=v end)
T(AllTab,"Super Speed","Fast movement","A_Speed",function() state.superSpeed=true local h=getHum() if h then h.WalkSpeed=state.speedAmount end end,function() state.superSpeed=false local h=getHum() if h then h.WalkSpeed=16 end end)
S(AllTab,"Walk Speed","Speed amount","A_WalkSpd",16,500,5," s/s",80,function(v) state.speedAmount=v if state.superSpeed then local h=getHum() if h then h.WalkSpeed=v end end end)
T(AllTab,"Infinite Jump","Jump unlimited times","A_InfJump",function() state.infiniteJump=true end,function() state.infiniteJump=false end)
T(AllTab,"High Jump","Much higher jumps","A_HiJump",function() state.megaJump=true local h=getHum() if h then h.JumpPower=state.jumpPower end end,function() state.megaJump=false local h=getHum() if h then h.JumpPower=originalJumpPower end end)
S(AllTab,"Jump Power","Jump height","A_JumpPwr",50,500,10," pwr",150,function(v) state.jumpPower=v if state.megaJump then local h=getHum() if h then h.JumpPower=v end end end)
T(AllTab,"Noclip","Walk through walls","A_Noclip",function() state.noclip=true startNoclip() end,function() state.noclip=false stopNoclip() end)
T(AllTab,"Zero Gravity","No gravity at all","A_NoGrav",function() state.noGravity=true workspace.Gravity=0 end,function() state.noGravity=false workspace.Gravity=originalGravity end)
T(AllTab,"Moon Gravity","Moon-like gravity","A_MoonGrav",function() state.moonGravity=true workspace.Gravity=16 end,function() state.moonGravity=false workspace.Gravity=originalGravity end)
T(AllTab,"Low Gravity","Reduced gravity","A_LowGrav",function() state.gravityEnabled=true workspace.Gravity=state.gravityAmount end,function() state.gravityEnabled=false workspace.Gravity=originalGravity end)
S(AllTab,"Gravity Amount","Gravity level","A_GravAmt",0,300,5," g",20,function(v) state.gravityAmount=v if state.gravityEnabled then workspace.Gravity=v end end)
T(AllTab,"Hover","Slow fall","A_Hover",function() state.hover=true end,function() state.hover=false end)
S(AllTab,"Hover Speed","Fall slow speed","A_HoverSpd",1,20,1," spd",5,function(v) state.hoverSpeed=v end)
T(AllTab,"Teleport Mode","Click anywhere to teleport","A_TpMode",function() state.teleportMode=true end,function() state.teleportMode=false end)
T(AllTab,"Wall Climb","Climb any wall","A_WallClimb",function() state.wallClimb=true end,function() state.wallClimb=false end)
T(AllTab,"Auto Platform","Platform spawns on jump","A_Platform",function() state.platform=true end,function() state.platform=false end)
T(AllTab,"Auto Jump","Jump automatically every 2s","A_AutoJump",function() state.autoJump=true end,function() state.autoJump=false end)
T(AllTab,"Auto Dash","Dash forward every second","A_AutoDash",function() state.autoDash=true end,function() state.autoDash=false end)
B(AllTab,"🚀 Rocket Launch","Launch up",function() local r=getRoot() if r then r.Velocity=Vector3.new(0,350,0) end end)
B(AllTab,"🌀 Random Fling","Fling randomly",function() local r=getRoot() if r then r.Velocity=Vector3.new(math.random(-250,250),250,math.random(-250,250)) end end)
B(AllTab,"📍 Teleport to Player","Warp to random player",function()
    local root=getRoot() if not root then return end
    local others={} for _,p in pairs(Players:GetPlayers()) do if p~=localPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then table.insert(others,p) end end
    if #others>0 then local t=others[math.random(1,#others)] root.CFrame=t.Character.HumanoidRootPart.CFrame+Vector3.new(3,0,0) Rayfield:Notify({Title="Teleported",Content="Warped to "..t.Name,Duration=2}) end
end)

AllTab:CreateSection("⚔️ Combat")
T(AllTab,"God Mode","Always full health","A_God",function() state.godMode=true end,function() state.godMode=false local h=getHum() if h then h.MaxHealth=100 h.Health=100 end end)
T(AllTab,"Auto Heal","Regen health slowly","A_Heal",function() state.autoHeal=true end,function() state.autoHeal=false end)
T(AllTab,"Fast Heal","Regen health very fast","A_FastHeal",function() state.fastHeal=true end,function() state.fastHeal=false end)
S(AllTab,"Heal Rate","HP per second","A_HealRate",1,100,1," hp/s",10,function(v) state.autoHealAmount=v end)
T(AllTab,"No Fall Damage","Never die from falling","A_FallDmg",function() state.noFallDamage=true end,function() state.noFallDamage=false local h=getHum() if h then h.MaxHealth=100 h.Health=100 end end)
T(AllTab,"Freeze Players","Stop all other players","A_Freeze",function() state.freeze=true end,function()
    state.freeze=false
    for _,p in pairs(Players:GetPlayers()) do if p~=localPlayer and p.Character then local h=p.Character:FindFirstChildOfClass("Humanoid") if h then h.WalkSpeed=16 h.JumpPower=50 end end end
end)
T(AllTab,"Magnet Mode","Pull all players to you","A_Magnet",function() state.magnetMode=true end,function() state.magnetMode=false end)
B(AllTab,"❤️ Heal to Full","Instantly restore health",function() local h=getHum() if h then h.Health=h.MaxHealth Rayfield:Notify({Title="Healed",Content="Full health!",Duration=2}) end end)
B(AllTab,"💀 Reset Character","Kill and respawn",function() local h=getHum() if h then h.Health=0 end end)
B(AllTab,"📍 Teleport Behind Enemy","Appear behind random enemy",function()
    local root=getRoot() if not root then return end
    local others={} for _,p in pairs(Players:GetPlayers()) do if p~=localPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then table.insert(others,p) end end
    if #others>0 then local t=others[math.random(1,#others)] local hrp=t.Character.HumanoidRootPart root.CFrame=hrp.CFrame*CFrame.new(0,0,3) Rayfield:Notify({Title="Teleported",Content="Behind "..t.Name,Duration=2}) end
end)

AllTab:CreateSection("👁️ Visuals & Effects")
T(AllTab,"Rainbow Mode","Cycle rainbow colors","A_Rainbow",function() state.rainbow=true end,function() state.rainbow=false end)
T(AllTab,"Invisible","Go invisible","A_Invis",function() local c=getChar() if c then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.Transparency=1 end end end end,function() local c=getChar() if c then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.Transparency=0 end end end end)
T(AllTab,"Rainbow Trail","Colorful trail","A_Trail",function() state.trail=true createTrail(0.6) end,function() state.trail=false removeTrail() end)
T(AllTab,"Long Trail","Extra long trail","A_LTrail",function() state.longTrail=true createTrail(2) end,function() state.longTrail=false removeTrail() end)
T(AllTab,"Spin","Rotate character","A_Spin",function() state.spin=true end,function() state.spin=false end)
S(AllTab,"Spin Speed","Rotation speed","A_SpinSpd",1,50,1," deg/f",5,function(v) state.spinSpeed=v end)
T(AllTab,"Super Spin","Very fast spin","A_SSpin",function() state.superSpin=true end,function() state.superSpin=false end)
T(AllTab,"Big Head","Huge head","A_BigHead",function() state.bigHead=true end,function() state.bigHead=false local c=getChar() if c and c:FindFirstChild("Head") then c.Head.Size=Vector3.new(2,1,1) end end)
S(AllTab,"Head Size","How big","A_HeadSz",2,10,0.5," x",3,function(v) state.bigHeadSize=v end)
T(AllTab,"Giant Head","Maximum head","A_GHead",function() state.giantHead=true end,function() state.giantHead=false local c=getChar() if c and c:FindFirstChild("Head") then c.Head.Size=Vector3.new(2,1,1) end end)
T(AllTab,"Giant Mode","Become huge","A_Giant",function() state.giant=true local r=getRoot() if r then r.Size=Vector3.new(4,4,4) end end,function() state.giant=false local r=getRoot() if r then r.Size=Vector3.new(2,2,1) end end)
T(AllTab,"Tiny Mode","Become tiny","A_Tiny",function() state.tiny=true local r=getRoot() if r then r.Size=Vector3.new(0.5,0.5,0.5) end end,function() state.tiny=false local r=getRoot() if r then r.Size=Vector3.new(2,2,1) end end)
T(AllTab,"Dance Mode","Character dances","A_Dance",function() state.dance=true end,function() state.dance=false end)
T(AllTab,"Bouncy","Bounce on ground","A_Bouncy",function() state.bouncy=true end,function() state.bouncy=false end)
T(AllTab,"Super Bounce","Extreme bounce","A_SBounce",function() state.superBounce=true end,function() state.superBounce=false end)
S(AllTab,"Bounce Power","Bounce height","A_BouncePwr",5,100,5," pwr",25,function(v) state.bouncyPower=v end)
T(AllTab,"Fireworks","Neon fireworks around you","A_Fireworks",function() state.fireworks=true end,function() state.fireworks=false end)
T(AllTab,"Confetti","Confetti follows you","A_Confetti",function() state.confetti=true end,function() state.confetti=false end)

AllTab:CreateSection("🌍 World")
T(AllTab,"Fullbright","Remove all shadows","A_Fbright",function() setFullbright(true) end,function() setFullbright(false) end)
T(AllTab,"Night Mode","Dark world","A_Night",function() Lighting.Brightness=0.05 Lighting.Ambient=Color3.fromRGB(10,10,30) end,function() Lighting.Brightness=1 Lighting.Ambient=Color3.fromRGB(127,127,127) end)
T(AllTab,"Fog","Thick fog","A_Fog",function() Lighting.FogEnd=80 Lighting.FogColor=Color3.fromRGB(180,180,180) end,function() Lighting.FogEnd=1e4 end)
T(AllTab,"Rainbow Sky","Sky cycles colors","A_RSky",function() state.rainbowSkyEnabled=true end,function() state.rainbowSkyEnabled=false Lighting.Ambient=Color3.fromRGB(127,127,127) end)
T(AllTab,"Snow Effect","Snow falls around you","A_Snow",function() state.snowEnabled=true end,function() state.snowEnabled=false end)
T(AllTab,"Red Sky","Blood red sky","A_RedSky",function() Lighting.Ambient=Color3.fromRGB(180,0,0) end,function() Lighting.Ambient=Color3.fromRGB(127,127,127) end)
T(AllTab,"Blue Sky","Deep blue sky","A_BlueSky",function() Lighting.Ambient=Color3.fromRGB(0,80,200) end,function() Lighting.Ambient=Color3.fromRGB(127,127,127) end)
T(AllTab,"Purple Sky","Purple sky","A_PurpleSky",function() Lighting.Ambient=Color3.fromRGB(100,0,180) end,function() Lighting.Ambient=Color3.fromRGB(127,127,127) end)
S(AllTab,"FOV","Field of view","A_FOV",70,120,1," fov",70,function(v) getCam().FieldOfView=v end)

AllTab:CreateSection("🎨 Body Color")
T(AllTab,"Gold Body","Gold character","A_Gold",function() setBodyColor(true,Color3.fromRGB(255,215,0)) end,function() setBodyColor(false,nil) end)
T(AllTab,"Red Body","Red character","A_Red",function() setBodyColor(true,Color3.fromRGB(255,50,50)) end,function() setBodyColor(false,nil) end)
T(AllTab,"Blue Body","Blue character","A_Blue",function() setBodyColor(true,Color3.fromRGB(50,100,255)) end,function() setBodyColor(false,nil) end)
T(AllTab,"Green Body","Green character","A_Green",function() setBodyColor(true,Color3.fromRGB(0,200,80)) end,function() setBodyColor(false,nil) end)
T(AllTab,"Black Body","Black character","A_Black",function() setBodyColor(true,Color3.fromRGB(20,20,20)) end,function() setBodyColor(false,nil) end)
T(AllTab,"White Body","White character","A_White",function() setBodyColor(true,Color3.fromRGB(255,255,255)) end,function() setBodyColor(false,nil) end)
T(AllTab,"Neon Pink Body","Neon pink glow","A_Neon",function() local c=getChar() if c then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.Color=Color3.fromRGB(255,0,200) p.Material=Enum.Material.Neon end end end end,function() local c=getChar() if c then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.Material=Enum.Material.SmoothPlastic end end end end)
T(AllTab,"Shadow Body","Dark purple shadow","A_Shadow",function() setBodyColor(true,Color3.fromRGB(40,0,60)) end,function() setBodyColor(false,nil) end)

AllTab:CreateSection("🔧 Utility")
T(AllTab,"Anti AFK","Never get kicked","A_AFK",function()
    local VIM=game:GetService("VirtualInputManager")
    if connections.antiAFK then connections.antiAFK:Disconnect() end
    local t=0
    connections.antiAFK=RunService.Heartbeat:Connect(function(dt)
        t+=dt if t>=60 then t=0 VIM:SendKeyEvent(true,Enum.KeyCode.F13,false,game) VIM:SendKeyEvent(false,Enum.KeyCode.F13,false,game) end
    end)
end,function() if connections.antiAFK then connections.antiAFK:Disconnect() connections.antiAFK=nil end end)
T(AllTab,"Auto Clicker","Automatically clicks","A_AutoClick",function()
    if connections.autoClick then connections.autoClick:Disconnect() end
    local VIM=game:GetService("VirtualInputManager")
    connections.autoClick=RunService.Heartbeat:Connect(function()
        VIM:SendMouseButtonEvent(0,0,0,true,game,1) VIM:SendMouseButtonEvent(0,0,0,false,game,1)
    end)
end,function() if connections.autoClick then connections.autoClick:Disconnect() connections.autoClick=nil end end)
B(AllTab,"💺 Sit Toggle","Force sit or stand",function() local h=getHum() if h then h.Sit=not h.Sit end end)
B(AllTab,"📍 Teleport to Spawn","Go to map origin",function() local r=getRoot() if r then r.CFrame=CFrame.new(0,10,0) end end)
B(AllTab,"🧹 Disable ALL Mods","Turn off everything instantly",disableAll)

-- INDIVIDUAL GAME TABS
local VolleyTab = Window:CreateTab("🏐 Volleyball", 4483362458)
VolleyTab:CreateSection("Ball Hitbox")
T(VolleyTab,"Hitbox Extender","Hit ball from far away","V_Hitbox",function() state.hitboxEnabled=true expandBall(state.hitboxSize) if state.showVisual then createBallVisual() end end,function() state.hitboxEnabled=false resetBall() removeBallVisual() end)
T(VolleyTab,"Show Ball Visual","Cyan sphere on ball","V_BallVis",function() state.showVisual=true if state.hitboxEnabled then createBallVisual() end end,function() state.showVisual=false removeBallVisual() end)
S(VolleyTab,"Hitbox Size","Size in studs","V_HBSize",1,60,1," studs",10,function(v) state.hitboxSize=v if state.hitboxEnabled then expandBall(v) end end)
VolleyTab:CreateSection("Power")
T(VolleyTab,"Power Boost","Boost all powers","V_PBoost",function() state.powerBoostEnabled=true applyPowerBoost(true,state.powerBoostAmount) end,function() state.powerBoostEnabled=false applyPowerBoost(false,1) end)
S(VolleyTab,"Boost Multiplier","Power amount","V_BAmt",1,500,5,"x",50,function(v) state.powerBoostAmount=v if state.powerBoostEnabled then applyPowerBoost(true,v) end end)
T(VolleyTab,"Auto Rotate","Keep auto rotate on","V_AutoRot",function()
    state.autoRotate=true if connections.autoRotate then connections.autoRotate:Disconnect() end
    connections.autoRotate=RunService.Heartbeat:Connect(function() if state.autoRotate then local hum=getHum() if hum and not hum.AutoRotate then hum.AutoRotate=true end end end)
end,function() state.autoRotate=false if connections.autoRotate then connections.autoRotate:Disconnect() connections.autoRotate=nil end end)
B(VolleyTab,"🏐 Teleport to Ball","Warp to ball",function() local ball=getBall() local root=getRoot() if ball and root then root.CFrame=CFrame.new(ball.Position+Vector3.new(0,5,0)) end end)
B(VolleyTab,"💥 Powerful Serve","Max power serve",function()
    local ok,svc=pcall(function() return game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.7.0"].knit.Services.GameService.RF.Serve end)
    if ok and svc then svc:InvokeServer(Vector3.new(0,0,0),math.huge) else Rayfield:Notify({Title="Error",Content="Only in Volleyball Legends",Duration=3}) end
end)

local RivalsTab = Window:CreateTab("🎯 Rivals", 4483362458)
RivalsTab:CreateSection("Aim Features")
T(RivalsTab,"Silent Aim","Smooth camera snap to nearest enemy","R_SAim",function() state.silentAim=true end,function() state.silentAim=false fovCircle.Visible=false getCam().CameraType=Enum.CameraType.Custom end)
T(RivalsTab,"Aimbot","Strong snap + auto shoot","R_Aimbot",function() state.aimbot=true end,function() state.aimbot=false getCam().CameraType=Enum.CameraType.Custom end)
T(RivalsTab,"Triggerbot","Auto shoot when on enemy","R_Tbot",function() state.triggerbot=true end,function() state.triggerbot=false end)
T(RivalsTab,"Show FOV Circle","Aim range circle","R_FOVV",function() state.showFOVCircle=true end,function() state.showFOVCircle=false fovCircle.Visible=false end)
S(RivalsTab,"Aim FOV","Snap range","R_AFOV",10,180,5,"°",135,function(v) SILENT_AIM_FOV=v fovCircle.Radius=v*0.78 end)
S(RivalsTab,"Aim Smoothness","Lerp speed","R_ASmooth",1,40,1,"",25,function(v) SILENT_AIM_SMOOTH=v/100 end)
RivalsTab:CreateSection("ESP & Visuals")
T(RivalsTab,"Box ESP","Highlight enemies through walls","R_BESP",function() state.esp=true buildESP() end,function() state.esp=false clearESP() end)
T(RivalsTab,"Chams","Glowing enemy spheres","R_Chams",function() state.chams=true buildChams() end,function() state.chams=false clearChams() end)
T(RivalsTab,"Player Look Lines","Direction lines","R_PLines",function() state.playerLines=true rebuildLines() end,function() state.playerLines=false clearLines() end)
T(RivalsTab,"Third Person","Behind camera","R_TP",function() state.thirdPerson=true end,function() state.thirdPerson=false getCam().CameraType=Enum.CameraType.Custom end)
S(RivalsTab,"Third Person Distance","Camera distance","R_TPD",5,30,1," studs",15,function(v) state.thirdPersonDist=v end)
T(RivalsTab,"Custom Crosshair","Green precision crosshair","R_Cross",function() createCrosshair() end,function() removeCrosshair() end)
T(RivalsTab,"Fullbright","No shadows — see in dark areas","R_FB",function() setFullbright(true) end,function() setFullbright(false) end)
S(RivalsTab,"FOV","Field of view","R_FOV",70,120,1," fov",70,function(v) getCam().FieldOfView=v end)
B(RivalsTab,"📍 Teleport Behind Enemy","Warp behind enemy",function()
    local root=getRoot() if not root then return end
    local others={} for _,p in pairs(Players:GetPlayers()) do if p~=localPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then table.insert(others,p) end end
    if #others>0 then local t=others[math.random(1,#others)] local hrp=t.Character.HumanoidRootPart root.CFrame=hrp.CFrame*CFrame.new(0,0,3) Rayfield:Notify({Title="Teleported",Content="Behind "..t.Name,Duration=2}) end
end)
B(RivalsTab,"🔄 Refresh ESP","Rebuild all ESP",function() if state.esp then buildESP() end if state.chams then buildChams() end Rayfield:Notify({Title="Refreshed",Content="ESP rebuilt",Duration=2}) end)

local BloxTab = Window:CreateTab("🍎 Blox Fruits", 4483362458)
BloxTab:CreateSection("ESP")
T(BloxTab,"Fruit ESP","See devil fruits","BF_FESP",function() state.fruitESP=true buildFruitESP() end,function() state.fruitESP=false clearFruitESP() end)
T(BloxTab,"Chest ESP","See treasure chests","BF_CESP",function() state.chestESP=true buildChestESP() end,function() state.chestESP=false clearChestESP() end)
T(BloxTab,"Player ESP","See players through walls","BF_PESP",function() state.esp=true buildESP() end,function() state.esp=false clearESP() end)
B(BloxTab,"🔄 Refresh All ESP","Rebuild ESP",function() if state.fruitESP then buildFruitESP() end if state.chestESP then buildChestESP() end if state.esp then buildESP() end Rayfield:Notify({Title="Refreshed",Content="All ESP rebuilt",Duration=2}) end)
BloxTab:CreateSection("Teleport")
B(BloxTab,"🍎 Nearest Fruit","Warp to closest fruit",function()
    local root=getRoot() if not root then return end
    local closest,closestDist=nil,math.huge
    for _,obj in pairs(workspace:GetDescendants()) do if obj:IsA("Model") and obj.Name:lower():find("fruit") then local hrp=obj:FindFirstChildWhichIsA("BasePart") if hrp then local dist=(hrp.Position-root.Position).Magnitude if dist<closestDist then closestDist=dist closest=hrp end end end end
    if closest then root.CFrame=CFrame.new(closest.Position+Vector3.new(0,5,0)) Rayfield:Notify({Title="Teleported",Content="Warped to fruit!",Duration=2})
    else Rayfield:Notify({Title="No Fruit",Content="No fruits found",Duration=2}) end
end)
B(BloxTab,"📦 Nearest Chest","Warp to closest chest",function()
    local root=getRoot() if not root then return end
    local closest,closestDist=nil,math.huge
    for _,obj in pairs(workspace:GetDescendants()) do if obj:IsA("Model") and (obj.Name:lower():find("chest") or obj.Name:lower():find("box")) then local hrp=obj:FindFirstChildWhichIsA("BasePart") if hrp then local dist=(hrp.Position-root.Position).Magnitude if dist<closestDist then closestDist=dist closest=hrp end end end end
    if closest then root.CFrame=CFrame.new(closest.Position+Vector3.new(0,5,0)) Rayfield:Notify({Title="Teleported",Content="Warped to chest!",Duration=2})
    else Rayfield:Notify({Title="No Chest",Content="No chests found",Duration=2}) end
end)

local MoveTab = Window:CreateTab("✈️ Movement", 4483362458)
MoveTab:CreateSection("Flight")
T(MoveTab,"Fly Mode","WASD+Space/Ctrl. Tap ✈️ mobile","M_Fly",function() state.fly=true startFly() end,function() state.fly=false stopFly() end)
S(MoveTab,"Fly Speed","Flight speed","M_FlySpd",5,400,5," spd",80,function(v) state.flySpeed=v end)
MoveTab:CreateSection("Speed & Jump")
T(MoveTab,"Super Speed","Fast movement","M_Speed",function() state.superSpeed=true local h=getHum() if h then h.WalkSpeed=state.speedAmount end end,function() state.superSpeed=false local h=getHum() if h then h.WalkSpeed=16 end end)
S(MoveTab,"Walk Speed","Speed","M_WalkSpd",16,500,5," s/s",80,function(v) state.speedAmount=v if state.superSpeed then local h=getHum() if h then h.WalkSpeed=v end end end)
T(MoveTab,"Infinite Jump","Jump mid-air","M_InfJump",function() state.infiniteJump=true end,function() state.infiniteJump=false end)
T(MoveTab,"High Jump","Higher jumps","M_HiJump",function() state.megaJump=true local h=getHum() if h then h.JumpPower=state.jumpPower end end,function() state.megaJump=false local h=getHum() if h then h.JumpPower=originalJumpPower end end)
S(MoveTab,"Jump Power","Jump height","M_JumpPwr",50,500,10," pwr",150,function(v) state.jumpPower=v if state.megaJump then local h=getHum() if h then h.JumpPower=v end end end)
MoveTab:CreateSection("World")
T(MoveTab,"Noclip","Through walls","M_Noclip",function() state.noclip=true startNoclip() end,function() state.noclip=false stopNoclip() end)
T(MoveTab,"Zero Gravity","No gravity","M_NoGrav",function() workspace.Gravity=0 end,function() workspace.Gravity=originalGravity end)
T(MoveTab,"Moon Gravity","Moon physics","M_MoonGrav",function() workspace.Gravity=16 end,function() workspace.Gravity=originalGravity end)
T(MoveTab,"Hover","Slow fall","M_Hover",function() state.hover=true end,function() state.hover=false end)
T(MoveTab,"Wall Climb","Climb walls","M_WallClimb",function() state.wallClimb=true end,function() state.wallClimb=false end)
T(MoveTab,"Teleport Mode","Click to teleport","M_TpMode",function() state.teleportMode=true end,function() state.teleportMode=false end)
B(MoveTab,"🚀 Rocket Launch","Launch up",function() local r=getRoot() if r then r.Velocity=Vector3.new(0,350,0) end end)
B(MoveTab,"🌀 Fling","Random fling",function() local r=getRoot() if r then r.Velocity=Vector3.new(math.random(-250,250),250,math.random(-250,250)) end end)

local CombatTab = Window:CreateTab("⚔️ Combat", 4483362458)
CombatTab:CreateSection("Defense")
T(CombatTab,"God Mode","Always full health","C_God",function() state.godMode=true end,function() state.godMode=false local h=getHum() if h then h.MaxHealth=100 h.Health=100 end end)
T(CombatTab,"Auto Heal","Regen health","C_Heal",function() state.autoHeal=true end,function() state.autoHeal=false end)
T(CombatTab,"Fast Heal","Fast regen","C_FastHeal",function() state.fastHeal=true end,function() state.fastHeal=false end)
T(CombatTab,"No Fall Damage","No fall death","C_Fall",function() state.noFallDamage=true end,function() state.noFallDamage=false local h=getHum() if h then h.MaxHealth=100 h.Health=100 end end)
T(CombatTab,"Freeze Players","Freeze everyone","C_Freeze",function() state.freeze=true end,function() state.freeze=false for _,p in pairs(Players:GetPlayers()) do if p~=localPlayer and p.Character then local h=p.Character:FindFirstChildOfClass("Humanoid") if h then h.WalkSpeed=16 h.JumpPower=50 end end end end)
T(CombatTab,"Magnet","Pull players to you","C_Magnet",function() state.magnetMode=true end,function() state.magnetMode=false end)
B(CombatTab,"❤️ Heal","Full health now",function() local h=getHum() if h then h.Health=h.MaxHealth end end)
B(CombatTab,"💀 Reset","Respawn",function() local h=getHum() if h then h.Health=0 end end)

local VisualTab = Window:CreateTab("👁️ Visuals", 4483362458)
VisualTab:CreateSection("Character")
T(VisualTab,"Rainbow","Rainbow colors","Vi_Rainbow",function() state.rainbow=true end,function() state.rainbow=false end)
T(VisualTab,"Invisible","Go invisible","Vi_Invis",function() local c=getChar() if c then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.Transparency=1 end end end end,function() local c=getChar() if c then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.Transparency=0 end end end end)
T(VisualTab,"Trail","Colorful trail","Vi_Trail",function() state.trail=true createTrail(0.6) end,function() state.trail=false removeTrail() end)
T(VisualTab,"Spin","Spin character","Vi_Spin",function() state.spin=true end,function() state.spin=false end)
S(VisualTab,"Spin Speed","Speed","Vi_SpinSpd",1,50,1," deg/f",5,function(v) state.spinSpeed=v end)
T(VisualTab,"Dance","Dance mode","Vi_Dance",function() state.dance=true end,function() state.dance=false end)
T(VisualTab,"Big Head","Huge head","Vi_BigHead",function() state.bigHead=true end,function() state.bigHead=false local c=getChar() if c and c:FindFirstChild("Head") then c.Head.Size=Vector3.new(2,1,1) end end)
T(VisualTab,"Bouncy","Bounce","Vi_Bouncy",function() state.bouncy=true end,function() state.bouncy=false end)
T(VisualTab,"Fireworks","Fireworks","Vi_Fireworks",function() state.fireworks=true end,function() state.fireworks=false end)
T(VisualTab,"Confetti","Confetti","Vi_Confetti",function() state.confetti=true end,function() state.confetti=false end)
VisualTab:CreateSection("World")
T(VisualTab,"Fullbright","No shadows","Vi_Fbright",function() setFullbright(true) end,function() setFullbright(false) end)
T(VisualTab,"Night Mode","Dark world","Vi_Night",function() Lighting.Brightness=0.05 end,function() Lighting.Brightness=1 end)
T(VisualTab,"Rainbow Sky","Cycling sky","Vi_RSky",function() state.rainbowSkyEnabled=true end,function() state.rainbowSkyEnabled=false Lighting.Ambient=Color3.fromRGB(127,127,127) end)
S(VisualTab,"FOV","Field of view","Vi_FOV",70,120,1," fov",70,function(v) getCam().FieldOfView=v end)
VisualTab:CreateSection("ESP")
T(VisualTab,"Player ESP","See through walls","Vi_ESP",function() state.esp=true buildESP() end,function() state.esp=false clearESP() end)
T(VisualTab,"Player Lines","Direction lines","Vi_Lines",function() state.playerLines=true rebuildLines() end,function() state.playerLines=false clearLines() end)

local UtilTab = Window:CreateTab("🔧 Utility", 4483362458)
UtilTab:CreateSection("Anti Detection")
T(UtilTab,"Anti AFK","Never kicked","U_AFK",function()
    local VIM=game:GetService("VirtualInputManager") if connections.antiAFK then connections.antiAFK:Disconnect() end
    local t=0 connections.antiAFK=RunService.Heartbeat:Connect(function(dt) t+=dt if t>=60 then t=0 VIM:SendKeyEvent(true,Enum.KeyCode.F13,false,game) VIM:SendKeyEvent(false,Enum.KeyCode.F13,false,game) end end)
end,function() if connections.antiAFK then connections.antiAFK:Disconnect() connections.antiAFK=nil end end)
T(UtilTab,"Auto Clicker","Auto click","U_AutoClick",function()
    local VIM=game:GetService("VirtualInputManager") if connections.autoClick then connections.autoClick:Disconnect() end
    connections.autoClick=RunService.Heartbeat:Connect(function() VIM:SendMouseButtonEvent(0,0,0,true,game,1) VIM:SendMouseButtonEvent(0,0,0,false,game,1) end)
end,function() if connections.autoClick then connections.autoClick:Disconnect() connections.autoClick=nil end end)
UtilTab:CreateSection("Teleport")
B(UtilTab,"📍 Spawn","Go to spawn",function() local r=getRoot() if r then r.CFrame=CFrame.new(0,10,0) end end)
B(UtilTab,"💺 Sit","Toggle sit",function() local h=getHum() if h then h.Sit=not h.Sit end end)
UtilTab:CreateSection("Master Reset")
B(UtilTab,"🧹 Disable ALL","Reset everything",disableAll)

Rayfield:LoadConfiguration()

Rayfield:Notify({
    Title = "HDGB Premium Ultra 👑",
    Content = "Key: D...F | All Games | Volleyball • Rivals • Blox Fruits | Tap ✈️ for mobile fly",
    Duration = 8,
})
