local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local RS = game:GetService("ReplicatedStorage")
local localPlayer = Players.LocalPlayer

local function getChar() return localPlayer.Character end
local function getHum() return getChar() and getChar():FindFirstChildOfClass("Humanoid") end
local function getRoot() return getChar() and getChar():FindFirstChild("HumanoidRootPart") end
local function getCam() return workspace.CurrentCamera end

local state = {
    hitboxEnabled=false, showVisual=true, hitboxSize=10,
    powerBoostEnabled=false, powerBoostAmount=50,
    fly=false, flySpeed=80,
    superSpeed=false, speedAmount=80,
    noclip=false, infiniteJump=false,
    megaJump=false, jumpPower=150,
    gravityEnabled=false, gravityAmount=20,
    godMode=false, autoHeal=false, autoHealAmount=10,
    noFallDamage=false,
    rainbow=false, invisible=false,
    spin=false, spinSpeed=5,
    esp=false, playerLines=false,
    trail=false, fullbright=false,
    antiAFK=false, fov=70,
}

local connections = {}
local originalGravity = workspace.Gravity
local originalJumpPower = 50

-- BALL HITBOX
local ballSphere, lastBall, origBallSize = nil, nil, nil
local function getBall()
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Model") and obj.Name:match("CLIENT_BALL_") then
            return obj:FindFirstChild("Sphere.001") or obj:FindFirstChild("Cube.001") or obj:FindFirstChildWhichIsA("BasePart")
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

-- POWER BOOST
local function applyPowerBoost(on, amt)
    local val = on and amt or 1
    for _, a in ipairs({"GameSpikePowerMultiplier","GameBumpPowerMultiplier","GameSetPowerMultiplier","GameServePowerMultiplier","GameBlockPowerMultiplier","GameTiltPowerMultiplier","GameJumpPowerMultiplier"}) do
        localPlayer:SetAttribute(a, val)
    end
end

-- FLY
local flyBV, flyBG = nil, nil
local function startFly()
    local root = getRoot() local hum = getHum()
    if not root or not hum then return end
    if flyBV then flyBV:Destroy() end
    if flyBG then flyBG:Destroy() end
    hum.PlatformStand = true
    flyBV = Instance.new("BodyVelocity")
    flyBV.MaxForce = Vector3.new(1,1,1)*9e9
    flyBV.Velocity = Vector3.zero
    flyBV.Parent = root
    flyBG = Instance.new("BodyGyro")
    flyBG.MaxTorque = Vector3.new(9e9,9e9,9e9)
    flyBG.P = 9e4
    flyBG.CFrame = root.CFrame
    flyBG.Parent = root
end
local function stopFly()
    if flyBV then flyBV:Destroy() flyBV = nil end
    if flyBG then flyBG:Destroy() flyBG = nil end
    local hum = getHum()
    if hum then hum.PlatformStand = false end
end

-- NOCLIP
local function startNoclip()
    if connections.noclip then connections.noclip:Disconnect() end
    connections.noclip = RunService.Stepped:Connect(function()
        if not state.noclip then return end
        local char = getChar()
        if char then for _, p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end end
    end)
end
local function stopNoclip()
    if connections.noclip then connections.noclip:Disconnect() connections.noclip = nil end
    local char = getChar()
    if char then for _, p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = true end end end
end

-- ESP
local espFolder = nil
local function clearESP()
    if espFolder then espFolder:Destroy() espFolder = nil end
    for k, c in pairs(connections) do
        if k:match("^esp_") then c:Disconnect() connections[k] = nil end
    end
end
local function buildESP()
    clearESP()
    if not state.esp then return end
    espFolder = Instance.new("Folder")
    espFolder.Name = "HubESP"
    espFolder.Parent = game:GetService("CoreGui")
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= localPlayer then
            local function attachESP(char)
                if not char then return end
                local hrp = char:FindFirstChild("HumanoidRootPart")
                local hum = char:FindFirstChildOfClass("Humanoid")
                if not hrp then return end
                local hl = Instance.new("SelectionBox")
                hl.Adornee = char
                hl.Color3 = Color3.fromRGB(255,50,50)
                hl.LineThickness = 0.04
                hl.SurfaceTransparency = 0.85
                hl.SurfaceColor3 = Color3.fromRGB(255,50,50)
                hl.Parent = espFolder
                local bill = Instance.new("BillboardGui")
                bill.Size = UDim2.new(0,140,0,50)
                bill.StudsOffset = Vector3.new(0,4,0)
                bill.Adornee = hrp
                bill.AlwaysOnTop = true
                bill.Parent = espFolder
                local nameL = Instance.new("TextLabel")
                nameL.Size = UDim2.new(1,0,0.55,0)
                nameL.BackgroundTransparency = 1
                nameL.Text = "👤 "..p.Name
                nameL.TextColor3 = Color3.fromRGB(255,100,100)
                nameL.TextSize = 15
                nameL.Font = Enum.Font.GothamBold
                nameL.TextStrokeTransparency = 0
                nameL.Parent = bill
                local hpL = Instance.new("TextLabel")
                hpL.Size = UDim2.new(1,0,0.45,0)
                hpL.Position = UDim2.new(0,0,0.55,0)
                hpL.BackgroundTransparency = 1
                hpL.TextSize = 12
                hpL.Font = Enum.Font.Gotham
                hpL.TextStrokeTransparency = 0
                hpL.Parent = bill
                local key = "esp_"..p.Name
                if connections[key] then connections[key]:Disconnect() end
                connections[key] = RunService.Heartbeat:Connect(function()
                    if hum and hpL and hpL.Parent then
                        local pct = math.floor((hum.Health/hum.MaxHealth)*100)
                        hpL.Text = "❤️ "..math.floor(hum.Health).." ("..pct.."%)"
                        hpL.TextColor3 = pct>60 and Color3.fromRGB(100,255,100) or pct>30 and Color3.fromRGB(255,200,0) or Color3.fromRGB(255,50,50)
                    end
                end)
            end
            attachESP(p.Character)
            p.CharacterAdded:Connect(function(c) task.wait(1) if state.esp then attachESP(c) end end)
        end
    end
end

-- PLAYER LINES
local lineAdornments = {}
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
                line.Size = Vector3.new(0.1,0.1,14)
                line.CFrame = CFrame.new(0,0,-7)
                line.Color3 = Color3.fromRGB(255,80,80)
                line.AlwaysOnTop = true
                line.Transparency = 0.1
                line.Parent = game:GetService("CoreGui")
                table.insert(lineAdornments, line)
            end
        end
    end
end

-- TRAIL
local trailObj, trailA0, trailA1 = nil, nil, nil
local function removeTrail()
    if trailObj then trailObj:Destroy() trailObj = nil end
    if trailA0 then trailA0:Destroy() trailA0 = nil end
    if trailA1 then trailA1:Destroy() trailA1 = nil end
end
local function createTrail()
    removeTrail()
    local root = getRoot()
    if not root then return end
    trailA0 = Instance.new("Attachment") trailA0.Position = Vector3.new(0,1,0) trailA0.Parent = root
    trailA1 = Instance.new("Attachment") trailA1.Position = Vector3.new(0,-1,0) trailA1.Parent = root
    trailObj = Instance.new("Trail")
    trailObj.Attachment0 = trailA0
    trailObj.Attachment1 = trailA1
    trailObj.Lifetime = 0.6
    trailObj.MinLength = 0
    trailObj.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,128)),
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0,200,255)),
        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(128,0,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255,200,0)),
    })
    trailObj.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0,1), NumberSequenceKeypoint.new(1,0)})
    trailObj.Parent = root
end

-- FULLBRIGHT
local function setFullbright(on)
    local L = game:GetService("Lighting")
    if on then L.Brightness=10 L.ClockTime=14 L.FogEnd=1e6 L.GlobalShadows=false L.Ambient=Color3.fromRGB(255,255,255)
    else L.Brightness=1 L.ClockTime=14 L.FogEnd=1e4 L.GlobalShadows=true L.Ambient=Color3.fromRGB(127,127,127) end
end

-- DISABLE ALL
local function disableAll()
    state.fly=false state.superSpeed=false state.noclip=false
    state.rainbow=false state.spin=false state.esp=false
    state.playerLines=false state.godMode=false state.autoHeal=false
    state.noFallDamage=false state.hitboxEnabled=false
    state.powerBoostEnabled=false state.trail=false
    state.fullbright=false state.infiniteJump=false
    state.megaJump=false state.gravityEnabled=false state.antiAFK=false
    stopFly() stopNoclip() removeTrail()
    clearESP() clearLines() resetBall() removeBallVisual()
    applyPowerBoost(false,1) setFullbright(false)
    workspace.Gravity = originalGravity
    getCam().FieldOfView = 70
    if connections.antiAFK then connections.antiAFK:Disconnect() connections.antiAFK = nil end
    local hum = getHum()
    if hum then hum.WalkSpeed=16 hum.JumpPower=50 hum.MaxHealth=100 hum.Health=100 end
    Rayfield:Notify({Title="All Clear ✅", Content="Every mod disabled", Duration=3})
end

-- MAIN LOOP
local timers = {ball=0, esp=0, lines=0}
local rainbowColors = {Color3.fromRGB(255,0,0),Color3.fromRGB(255,100,0),Color3.fromRGB(255,255,0),Color3.fromRGB(0,255,0),Color3.fromRGB(0,255,255),Color3.fromRGB(0,100,255),Color3.fromRGB(180,0,255)}
local rainbowIdx = 1
local rainbowTimer = 0

RunService.Heartbeat:Connect(function(dt)
    timers.ball+=dt timers.esp+=dt timers.lines+=dt rainbowTimer+=dt
    if timers.ball>=0.5 then
        timers.ball=0
        local ball=getBall()
        if ball~=lastBall then
            lastBall=ball origBallSize=nil
            if state.hitboxEnabled and ball then expandBall(state.hitboxSize) end
            if state.showVisual and state.hitboxEnabled then createBallVisual() end
        end
    end
    if timers.esp>=5 then timers.esp=0 if state.esp then buildESP() end end
    if timers.lines>=3 then timers.lines=0 if state.playerLines then rebuildLines() end end
    if state.fly and flyBV then
        local root=getRoot()
        if root then
            if flyBV.Parent~=root then flyBV.Parent=root end
            local cam=getCam() local move=Vector3.zero
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then move+=cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then move-=cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then move-=cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then move+=cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move+=Vector3.new(0,1,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then move-=Vector3.new(0,1,0) end
            flyBV.Velocity = move.Magnitude>0 and move.Unit*state.flySpeed or Vector3.zero
            if flyBG then flyBG.CFrame=cam.CFrame end
        end
    end
    if state.rainbow and rainbowTimer>=0.07 then
        rainbowTimer=0 rainbowIdx=(rainbowIdx%#rainbowColors)+1
        local char=getChar()
        if char then for _,p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.Color=rainbowColors[rainbowIdx] end end end
    end
    if state.spin then local root=getRoot() if root then root.CFrame*=CFrame.Angles(0,math.rad(state.spinSpeed),0) end end
    if state.godMode then local hum=getHum() if hum and hum.Health<hum.MaxHealth then hum.Health=hum.MaxHealth end end
    if state.autoHeal then local hum=getHum() if hum and hum.Health<hum.MaxHealth then hum.Health=math.min(hum.MaxHealth,hum.Health+state.autoHealAmount*dt) end end
    if state.noFallDamage then local hum=getHum() if hum then hum.MaxHealth=1e6 hum.Health=1e6 end end
end)

UserInputService.JumpRequest:Connect(function()
    if state.infiniteJump then local hum=getHum() if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end end
end)

localPlayer.CharacterAdded:Connect(function()
    task.wait(0.8)
    origBallSize=nil lastBall=nil
    if state.superSpeed then local h=getHum() if h then h.WalkSpeed=state.speedAmount end end
    if state.megaJump then local h=getHum() if h then h.JumpPower=state.jumpPower end end
    if state.fly then task.wait(0.2) startFly() end
    if state.noclip then startNoclip() end
    if state.trail then task.wait(0.2) createTrail() end
    if state.esp then task.wait(1) buildESP() end
end)

Players.PlayerAdded:Connect(function() task.wait(1) if state.esp then buildESP() end if state.playerLines then rebuildLines() end end)
Players.PlayerRemoving:Connect(function() task.wait(0.2) if state.esp then buildESP() end if state.playerLines then rebuildLines() end end)

-- =====================
-- UI
-- =====================
local Window = Rayfield:CreateWindow({
    Name = "Universal Hub v2",
    LoadingTitle = "Universal Hub",
    LoadingSubtitle = "Works in every Roblox game",
    ConfigurationSaving = { Enabled=true, FolderName="UniversalHubV2", FileName="Config" },
    Discord = { Enabled=false },
    KeySystem = false,
})

-- helper to avoid repeating callbacks
local function makeToggle(tab, name, desc, flag, onEnable, onDisable)
    tab:CreateToggle({
        Name=name, Description=desc, CurrentValue=false, Flag=flag,
        Callback=function(v) if v then onEnable() else onDisable() end end,
    })
end

local function makeSlider(tab, name, desc, flag, min, max, inc, suf, def, cb)
    tab:CreateSlider({Name=name,Description=desc,Flag=flag,Range={min,max},Increment=inc,Suffix=suf,CurrentValue=def,Callback=cb})
end

local function makeButton(tab, name, desc, cb)
    tab:CreateButton({Name=name, Description=desc, Callback=cb})
end

-- ====== 📋 ALL MODS TAB ======
local AllTab = Window:CreateTab("📋 All Mods", 4483362458)

AllTab:CreateSection("🏐 Volleyball Legends")
makeToggle(AllTab,"Hitbox Extender","Expand ball size — hit from far away","A_Hitbox",
    function() state.hitboxEnabled=true expandBall(state.hitboxSize) if state.showVisual then createBallVisual() end end,
    function() state.hitboxEnabled=false resetBall() removeBallVisual() end)
makeToggle(AllTab,"Show Ball Visual","Cyan sphere showing hitbox range","A_ShowVis",
    function() state.showVisual=true if state.hitboxEnabled then createBallVisual() end end,
    function() state.showVisual=false removeBallVisual() end)
makeSlider(AllTab,"Hitbox Size","Size of the ball hitbox in studs","A_HitboxSize",1,60,1," studs",10,function(v) state.hitboxSize=v if state.hitboxEnabled then expandBall(v) end end)
makeToggle(AllTab,"Power Boost","Boost all volleyball power multipliers","A_PowerBoost",
    function() state.powerBoostEnabled=true applyPowerBoost(true,state.powerBoostAmount) end,
    function() state.powerBoostEnabled=false applyPowerBoost(false,1) end)
makeSlider(AllTab,"Boost Multiplier","How strong the power boost is","A_BoostAmt",1,500,5,"x",50,function(v) state.powerBoostAmount=v if state.powerBoostEnabled then applyPowerBoost(true,v) end end)
makeButton(AllTab,"🏐 Teleport to Ball","Warp right next to the volleyball",function()
    local ball=getBall() local root=getRoot()
    if ball and root then root.CFrame=CFrame.new(ball.Position+Vector3.new(0,5,0)) Rayfield:Notify({Title="Teleported",Content="Warped to ball!",Duration=2})
    else Rayfield:Notify({Title="No Ball",Content="Ball not found",Duration=2}) end
end)
makeButton(AllTab,"💥 Powerful Serve","Max power serve — Volleyball Legends only",function()
    local ok,svc=pcall(function() return RS.Packages._Index["sleitnick_knit@1.7.0"].knit.Services.GameService.RF.Serve end)
    if ok and svc then svc:InvokeServer(Vector3.new(0,0,0),math.huge) Rayfield:Notify({Title="Served!",Content="Max power serve!",Duration=2})
    else Rayfield:Notify({Title="Error",Content="Only works in Volleyball Legends",Duration=3}) end
end)

AllTab:CreateSection("✈️ Movement")
makeToggle(AllTab,"Fly Mode","WASD + Space/Ctrl to fly anywhere","A_Fly",function() state.fly=true startFly() end,function() state.fly=false stopFly() end)
makeSlider(AllTab,"Fly Speed","How fast you fly","A_FlySpd",5,400,5," speed",80,function(v) state.flySpeed=v end)
makeToggle(AllTab,"Super Speed","Massively increase walk speed","A_Speed",
    function() state.superSpeed=true local h=getHum() if h then h.WalkSpeed=state.speedAmount end end,
    function() state.superSpeed=false local h=getHum() if h then h.WalkSpeed=16 end end)
makeSlider(AllTab,"Walk Speed","Your movement speed","A_WalkSpd",16,500,5," studs/s",80,function(v) state.speedAmount=v if state.superSpeed then local h=getHum() if h then h.WalkSpeed=v end end end)
makeToggle(AllTab,"Infinite Jump","Jump unlimited times in mid-air","A_InfJump",function() state.infiniteJump=true end,function() state.infiniteJump=false end)
makeToggle(AllTab,"High Jump","Jump much higher than normal","A_HiJump",
    function() state.megaJump=true local h=getHum() if h then h.JumpPower=state.jumpPower end end,
    function() state.megaJump=false local h=getHum() if h then h.JumpPower=originalJumpPower end end)
makeSlider(AllTab,"Jump Power","How high you jump","A_JumpPwr",50,500,10," power",150,function(v) state.jumpPower=v if state.megaJump then local h=getHum() if h then h.JumpPower=v end end end)
makeToggle(AllTab,"Noclip","Walk through any wall or part","A_Noclip",function() state.noclip=true startNoclip() end,function() state.noclip=false stopNoclip() end)
makeToggle(AllTab,"Low Gravity","Reduce workspace gravity","A_Grav",
    function() state.gravityEnabled=true workspace.Gravity=state.gravityAmount end,
    function() state.gravityEnabled=false workspace.Gravity=originalGravity end)
makeSlider(AllTab,"Gravity Amount","How strong gravity is","A_GravAmt",0,300,5," g",20,function(v) state.gravityAmount=v if state.gravityEnabled then workspace.Gravity=v end end)
makeButton(AllTab,"🚀 Rocket Launch","Launch yourself straight up",function() local r=getRoot() if r then r.Velocity=Vector3.new(0,350,0) end end)
makeButton(AllTab,"🌀 Random Fling","Fling in a random direction",function() local r=getRoot() if r then r.Velocity=Vector3.new(math.random(-250,250),250,math.random(-250,250)) end end)
makeButton(AllTab,"📍 Teleport to Random Player","Warp to a random player",function()
    local root=getRoot() if not root then return end
    local others={} for _,p in pairs(Players:GetPlayers()) do if p~=localPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then table.insert(others,p) end end
    if #others>0 then local t=others[math.random(1,#others)] root.CFrame=t.Character.HumanoidRootPart.CFrame+Vector3.new(3,0,0) Rayfield:Notify({Title="Teleported",Content="Warped to "..t.Name,Duration=2}) end
end)

AllTab:CreateSection("⚔️ Combat")
makeToggle(AllTab,"God Mode","Always stay at max health","A_God",function() state.godMode=true end,function() state.godMode=false local h=getHum() if h then h.MaxHealth=100 h.Health=100 end end)
makeToggle(AllTab,"Auto Heal","Slowly regenerate health","A_Heal",function() state.autoHeal=true end,function() state.autoHeal=false end)
makeSlider(AllTab,"Heal Rate","Health per second","A_HealRate",1,100,1," hp/s",10,function(v) state.autoHealAmount=v end)
makeToggle(AllTab,"No Fall Damage","Never die from falling","A_FallDmg",function() state.noFallDamage=true end,function() state.noFallDamage=false local h=getHum() if h then h.MaxHealth=100 h.Health=100 end end)
makeButton(AllTab,"❤️ Heal to Full","Instantly restore all health",function() local h=getHum() if h then h.Health=h.MaxHealth Rayfield:Notify({Title="Healed",Content="Full health restored!",Duration=2}) end end)
makeButton(AllTab,"💀 Reset Character","Kill and respawn yourself",function() local h=getHum() if h then h.Health=0 end end)

AllTab:CreateSection("👁️ Visuals")
makeToggle(AllTab,"Rainbow Mode","Cycle through rainbow colors","A_Rainbow",function() state.rainbow=true end,function() state.rainbow=false end)
makeToggle(AllTab,"Invisible","Make your character invisible","A_Invis",
    function() state.invisible=true local c=getChar() if c then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.Transparency=1 end end end end,
    function() state.invisible=false local c=getChar() if c then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.Transparency=0 end end end end)
makeToggle(AllTab,"Rainbow Trail","Colorful trail as you move","A_Trail",function() state.trail=true createTrail() end,function() state.trail=false removeTrail() end)
makeToggle(AllTab,"Spin","Continuously rotate your character","A_Spin",function() state.spin=true end,function() state.spin=false end)
makeSlider(AllTab,"Spin Speed","How fast you spin","A_SpinSpd",1,50,1," deg/f",5,function(v) state.spinSpeed=v end)
makeToggle(AllTab,"Fullbright","Remove all shadows and darkness","A_Fbright",function() state.fullbright=true setFullbright(true) end,function() state.fullbright=false setFullbright(false) end)
makeSlider(AllTab,"Field of View","Camera FOV","A_FOV",70,120,1," fov",70,function(v) state.fov=v getCam().FieldOfView=v end)
makeToggle(AllTab,"Player ESP","See players through walls with health","A_ESP",function() state.esp=true buildESP() end,function() state.esp=false clearESP() end)
makeToggle(AllTab,"Player Look Lines","Red lines showing player direction","A_Lines",function() state.playerLines=true rebuildLines() end,function() state.playerLines=false clearLines() end)

AllTab:CreateSection("🔧 Utility")
makeToggle(AllTab,"Anti AFK","Never get kicked for inactivity","A_AFK",
    function()
        state.antiAFK=true
        local VIM=game:GetService("VirtualInputManager")
        if connections.antiAFK then connections.antiAFK:Disconnect() end
        local t=0
        connections.antiAFK=RunService.Heartbeat:Connect(function(dt)
            if not state.antiAFK then return end
            t+=dt if t>=60 then t=0 VIM:SendKeyEvent(true,Enum.KeyCode.F13,false,game) VIM:SendKeyEvent(false,Enum.KeyCode.F13,false,game) end
        end)
    end,
    function()
        state.antiAFK=false
        if connections.antiAFK then connections.antiAFK:Disconnect() connections.antiAFK=nil end
    end)
makeButton(AllTab,"📍 Teleport to Spawn","Go back to map origin",function() local r=getRoot() if r then r.CFrame=CFrame.new(0,10,0) end end)
makeButton(AllTab,"💺 Sit Toggle","Force sit or stand",function() local h=getHum() if h then h.Sit=not h.Sit end end)
makeButton(AllTab,"🧹 Disable ALL Mods","Turn off every mod instantly",disableAll)

-- ====== 🏐 VOLLEYBALL TAB ======
local VolleyTab = Window:CreateTab("🏐 Volleyball", 4483362458)
VolleyTab:CreateSection("Ball Hitbox")
makeToggle(VolleyTab,"Hitbox Extender","Hit the ball from far away","V_Hitbox",
    function() state.hitboxEnabled=true expandBall(state.hitboxSize) if state.showVisual then createBallVisual() end end,
    function() state.hitboxEnabled=false resetBall() removeBallVisual() end)
makeToggle(VolleyTab,"Show Ball Visual","Cyan sphere on the ball","V_ShowVis",
    function() state.showVisual=true if state.hitboxEnabled then createBallVisual() end end,
    function() state.showVisual=false removeBallVisual() end)
makeSlider(VolleyTab,"Hitbox Size","Ball hitbox in studs","V_HitboxSize",1,60,1," studs",10,function(v) state.hitboxSize=v if state.hitboxEnabled then expandBall(v) end end)
VolleyTab:CreateSection("Power")
makeToggle(VolleyTab,"Power Boost","Boost all volleyball powers","V_Power",
    function() state.powerBoostEnabled=true applyPowerBoost(true,state.powerBoostAmount) end,
    function() state.powerBoostEnabled=false applyPowerBoost(false,1) end)
makeSlider(VolleyTab,"Boost Multiplier","Power multiplier amount","V_BoostAmt",1,500,5,"x",50,function(v) state.powerBoostAmount=v if state.powerBoostEnabled then applyPowerBoost(true,v) end end)
makeButton(VolleyTab,"🏐 Teleport to Ball","Warp to the ball",function()
    local ball=getBall() local root=getRoot()
    if ball and root then root.CFrame=CFrame.new(ball.Position+Vector3.new(0,5,0)) Rayfield:Notify({Title="Teleported",Content="Warped to ball!",Duration=2})
    else Rayfield:Notify({Title="No Ball",Content="Ball not found",Duration=2}) end
end)
makeButton(VolleyTab,"💥 Powerful Serve","Max power serve",function()
    local ok,svc=pcall(function() return RS.Packages._Index["sleitnick_knit@1.7.0"].knit.Services.GameService.RF.Serve end)
    if ok and svc then svc:InvokeServer(Vector3.new(0,0,0),math.huge) else Rayfield:Notify({Title="Error",Content="Only in Volleyball Legends",Duration=3}) end
end)

-- ====== ✈️ MOVEMENT TAB ======
local MoveTab = Window:CreateTab("✈️ Movement", 4483362458)
MoveTab:CreateSection("Flight")
makeToggle(MoveTab,"Fly Mode","WASD + Space/Ctrl","M_Fly",function() state.fly=true startFly() end,function() state.fly=false stopFly() end)
makeSlider(MoveTab,"Fly Speed","How fast you fly","M_FlySpd",5,400,5," speed",80,function(v) state.flySpeed=v end)
MoveTab:CreateSection("Speed & Jump")
makeToggle(MoveTab,"Super Speed","Increase walk speed","M_Speed",function() state.superSpeed=true local h=getHum() if h then h.WalkSpeed=state.speedAmount end end,function() state.superSpeed=false local h=getHum() if h then h.WalkSpeed=16 end end)
makeSlider(MoveTab,"Walk Speed","Movement speed","M_WalkSpd",16,500,5," studs/s",80,function(v) state.speedAmount=v if state.superSpeed then local h=getHum() if h then h.WalkSpeed=v end end end)
makeToggle(MoveTab,"Infinite Jump","Jump mid-air unlimitedly","M_InfJump",function() state.infiniteJump=true end,function() state.infiniteJump=false end)
makeToggle(MoveTab,"High Jump","Jump much higher","M_HiJump",function() state.megaJump=true local h=getHum() if h then h.JumpPower=state.jumpPower end end,function() state.megaJump=false local h=getHum() if h then h.JumpPower=originalJumpPower end end)
makeSlider(MoveTab,"Jump Power","How high you jump","M_JumpPwr",50,500,10," power",150,function(v) state.jumpPower=v if state.megaJump then local h=getHum() if h then h.JumpPower=v end end end)
MoveTab:CreateSection("World")
makeToggle(MoveTab,"Noclip","Walk through walls","M_Noclip",function() state.noclip=true startNoclip() end,function() state.noclip=false stopNoclip() end)
makeToggle(MoveTab,"Low Gravity","Reduce gravity","M_Grav",function() state.gravityEnabled=true workspace.Gravity=state.gravityAmount end,function() state.gravityEnabled=false workspace.Gravity=originalGravity end)
makeSlider(MoveTab,"Gravity Amount","Gravity strength","M_GravAmt",0,300,5," g",20,function(v) state.gravityAmount=v if state.gravityEnabled then workspace.Gravity=v end end)
makeButton(MoveTab,"🚀 Rocket Launch","Launch up",function() local r=getRoot() if r then r.Velocity=Vector3.new(0,350,0) end end)
makeButton(MoveTab,"🌀 Random Fling","Fling randomly",function() local r=getRoot() if r then r.Velocity=Vector3.new(math.random(-250,250),250,math.random(-250,250)) end end)
makeButton(MoveTab,"📍 Teleport to Player","Warp to random player",function()
    local root=getRoot() if not root then return end
    local others={} for _,p in pairs(Players:GetPlayers()) do if p~=localPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then table.insert(others,p) end end
    if #others>0 then local t=others[math.random(1,#others)] root.CFrame=t.Character.HumanoidRootPart.CFrame+Vector3.new(3,0,0) Rayfield:Notify({Title="Teleported",Content="Warped to "..t.Name,Duration=2}) end
end)

-- ====== ⚔️ COMBAT TAB ======
local CombatTab = Window:CreateTab("⚔️ Combat", 4483362458)
CombatTab:CreateSection("Defense")
makeToggle(CombatTab,"God Mode","Always full health","C_God",function() state.godMode=true end,function() state.godMode=false local h=getHum() if h then h.MaxHealth=100 h.Health=100 end end)
makeToggle(CombatTab,"Auto Heal","Regenerate health over time","C_Heal",function() state.autoHeal=true end,function() state.autoHeal=false end)
makeSlider(CombatTab,"Heal Rate","HP per second","C_HealRate",1,100,1," hp/s",10,function(v) state.autoHealAmount=v end)
makeToggle(CombatTab,"No Fall Damage","Never die from falling","C_Fall",function() state.noFallDamage=true end,function() state.noFallDamage=false local h=getHum() if h then h.MaxHealth=100 h.Health=100 end end)
makeButton(CombatTab,"❤️ Heal to Full","Restore all health",function() local h=getHum() if h then h.Health=h.MaxHealth Rayfield:Notify({Title="Healed",Content="Full health!",Duration=2}) end end)
makeButton(CombatTab,"💀 Reset Character","Kill and respawn",function() local h=getHum() if h then h.Health=0 end end)

-- ====== 👁️ VISUALS TAB ======
local VisualTab = Window:CreateTab("👁️ Visuals", 4483362458)
VisualTab:CreateSection("Character")
makeToggle(VisualTab,"Rainbow Mode","Cycle rainbow colors","Vi_Rainbow",function() state.rainbow=true end,function() state.rainbow=false end)
makeToggle(VisualTab,"Invisible","Make character invisible","Vi_Invis",
    function() state.invisible=true local c=getChar() if c then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.Transparency=1 end end end end,
    function() state.invisible=false local c=getChar() if c then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.Transparency=0 end end end end)
makeToggle(VisualTab,"Rainbow Trail","Colorful movement trail","Vi_Trail",function() state.trail=true createTrail() end,function() state.trail=false removeTrail() end)
makeToggle(VisualTab,"Spin","Rotate your character","Vi_Spin",function() state.spin=true end,function() state.spin=false end)
makeSlider(VisualTab,"Spin Speed","Rotation speed","Vi_SpinSpd",1,50,1," deg/f",5,function(v) state.spinSpeed=v end)
VisualTab:CreateSection("World")
makeToggle(VisualTab,"Fullbright","Remove all shadows","Vi_Fbright",function() state.fullbright=true setFullbright(true) end,function() state.fullbright=false setFullbright(false) end)
makeSlider(VisualTab,"Field of View","Camera FOV","Vi_FOV",70,120,1," fov",70,function(v) state.fov=v getCam().FieldOfView=v end)
VisualTab:CreateSection("ESP")
makeToggle(VisualTab,"Player ESP","See players through walls","Vi_ESP",function() state.esp=true buildESP() end,function() state.esp=false clearESP() end)
makeToggle(VisualTab,"Player Look Lines","Direction lines per player","Vi_Lines",function() state.playerLines=true rebuildLines() end,function() state.playerLines=false clearLines() end)

-- ====== 🔧 UTILITY TAB ======
local UtilTab = Window:CreateTab("🔧 Utility", 4483362458)
UtilTab:CreateSection("Anti Detection")
makeToggle(UtilTab,"Anti AFK","Never get kicked","U_AFK",
    function()
        state.antiAFK=true
        local VIM=game:GetService("VirtualInputManager")
        if connections.antiAFK then connections.antiAFK:Disconnect() end
        local t=0
        connections.antiAFK=RunService.Heartbeat:Connect(function(dt)
            if not state.antiAFK then return end
            t+=dt if t>=60 then t=0 VIM:SendKeyEvent(true,Enum.KeyCode.F13,false,game) VIM:SendKeyEvent(false,Enum.KeyCode.F13,false,game) end
        end)
    end,
    function() state.antiAFK=false if connections.antiAFK then connections.antiAFK:Disconnect() connections.antiAFK=nil end end)
UtilTab:CreateSection("Teleport")
makeButton(UtilTab,"📍 Teleport to Spawn","Go to map origin",function() local r=getRoot() if r then r.CFrame=CFrame.new(0,10,0) end end)
makeButton(UtilTab,"💺 Sit Toggle","Force sit or stand",function() local h=getHum() if h then h.Sit=not h.Sit end end)
UtilTab:CreateSection("Master Reset")
makeButton(UtilTab,"🧹 Disable ALL Mods","Turn off everything instantly",disableAll)

Rayfield:LoadConfiguration()

Rayfield:Notify({
    Title = "Universal Hub v2 ✅",
    Content = "All Mods tab has every feature in one place!",
    Duration = 5,
})
