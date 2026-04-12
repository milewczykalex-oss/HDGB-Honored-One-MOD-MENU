-- KEY = HDGB
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Debris = game:GetService("Debris")
local localPlayer = Players.LocalPlayer

local function getChar() return localPlayer.Character end
local function getHum() return getChar() and getChar():FindFirstChildOfClass("Humanoid") end
local function getRoot() return getChar() and getChar():FindFirstChild("HumanoidRootPart") end
local function getCam() return workspace.CurrentCamera end

local state = {
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
    hover=false, hoverSpeed=5,
    bouncy=false, bouncyPower=25,
    bigHead=false, bigHeadSize=3,
    giant=false, giantSize=3,
    tiny=false, tinySize=0.5,
    platform=false, platformSize=5,
    night=false, fog=false,
    dance=false, fireworks=false,
    confetti=false,
    chams=false,
    teleportMode=false,
    wallClimb=false,
    autoClick=false,
    freeze=false,
    superJump=false,
    lowFriction=false,
    highFriction=false,
    speedBoost=false,
    superSpin=false,
    fastHeal=false,
    noGravity=false,
    moonGravity=false,
    ragdoll=false,
    giantHead=false,
    redBody=false,
    blueBody=false,
    greenBody=false,
    goldBody=false,
    blackBody=false,
    whiteBody=false,
    shadowMode=false,
    neonMode=false,
    flashlight=false,
    darkWorld=false,
    rainbowSky=false,
    snow=false,
    rain=false,
    thunder=false,
    hotWorld=false,
    coldWorld=false,
    autoJump=false,
    autoDash=false,
    dashSpeed=150,
    stutter=false,
    magnetMode=false,
    shrink=false,
    grow=false,
    freeze2=false,
    superBounce=false,
    longTrail=false,
    shortTrail=false,
    fatMode=false,
    tallMode=false,
    wideMode=false,
}

local connections = {}
local originalGravity = workspace.Gravity
local originalJumpPower = 50
local danceAngle = 0

-- FLY
local flyBV, flyBG = nil, nil
local function startFly()
    local root=getRoot() local hum=getHum()
    if not root or not hum then return end
    if flyBV then flyBV:Destroy() end if flyBG then flyBG:Destroy() end
    hum.PlatformStand=true
    flyBV=Instance.new("BodyVelocity") flyBV.MaxForce=Vector3.new(1,1,1)*9e9 flyBV.Velocity=Vector3.zero flyBV.Parent=root
    flyBG=Instance.new("BodyGyro") flyBG.MaxTorque=Vector3.new(9e9,9e9,9e9) flyBG.P=9e4 flyBG.CFrame=root.CFrame flyBG.Parent=root
end
local function stopFly()
    if flyBV then flyBV:Destroy() flyBV=nil end if flyBG then flyBG:Destroy() flyBG=nil end
    local hum=getHum() if hum then hum.PlatformStand=false end
end

-- NOCLIP
local function startNoclip()
    if connections.noclip then connections.noclip:Disconnect() end
    connections.noclip=RunService.Stepped:Connect(function()
        if not state.noclip then return end
        local char=getChar() if char then for _,p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=false end end end
    end)
end
local function stopNoclip()
    if connections.noclip then connections.noclip:Disconnect() connections.noclip=nil end
    local char=getChar() if char then for _,p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=true end end end
end

-- ESP
local espFolder=nil
local function clearESP()
    if espFolder then espFolder:Destroy() espFolder=nil end
    for k,c in pairs(connections) do if k:match("^esp_") then c:Disconnect() connections[k]=nil end end
end
local function buildESP()
    clearESP() if not state.esp then return end
    espFolder=Instance.new("Folder") espFolder.Name="HDGBESP" espFolder.Parent=game:GetService("CoreGui")
    for _,p in pairs(Players:GetPlayers()) do
        if p~=localPlayer then
            local function attachESP(char)
                if not char then return end
                local hrp=char:FindFirstChild("HumanoidRootPart") local hum=char:FindFirstChildOfClass("Humanoid") if not hrp then return end
                local hl=Instance.new("SelectionBox") hl.Adornee=char hl.Color3=Color3.fromRGB(255,215,0) hl.LineThickness=0.05 hl.SurfaceTransparency=0.8 hl.SurfaceColor3=Color3.fromRGB(255,215,0) hl.Parent=espFolder
                local bill=Instance.new("BillboardGui") bill.Size=UDim2.new(0,140,0,50) bill.StudsOffset=Vector3.new(0,4,0) bill.Adornee=hrp bill.AlwaysOnTop=true bill.Parent=espFolder
                local nameL=Instance.new("TextLabel") nameL.Size=UDim2.new(1,0,0.55,0) nameL.BackgroundTransparency=1 nameL.Text="👑 "..p.Name nameL.TextColor3=Color3.fromRGB(255,215,0) nameL.TextSize=15 nameL.Font=Enum.Font.GothamBold nameL.TextStrokeTransparency=0 nameL.Parent=bill
                local hpL=Instance.new("TextLabel") hpL.Size=UDim2.new(1,0,0.45,0) hpL.Position=UDim2.new(0,0,0.55,0) hpL.BackgroundTransparency=1 hpL.TextSize=12 hpL.Font=Enum.Font.Gotham hpL.TextStrokeTransparency=0 hpL.Parent=bill
                local key="esp_"..p.Name if connections[key] then connections[key]:Disconnect() end
                connections[key]=RunService.Heartbeat:Connect(function()
                    if hum and hpL and hpL.Parent then
                        local pct=math.floor((hum.Health/hum.MaxHealth)*100)
                        hpL.Text="❤️ "..math.floor(hum.Health).." ("..pct.."%)"
                        hpL.TextColor3=pct>60 and Color3.fromRGB(100,255,100) or pct>30 and Color3.fromRGB(255,200,0) or Color3.fromRGB(255,50,50)
                    end
                end)
            end
            attachESP(p.Character)
            p.CharacterAdded:Connect(function(c) task.wait(1) if state.esp then attachESP(c) end end)
        end
    end
end

-- TRAIL
local trailObj,trailA0,trailA1=nil,nil,nil
local function removeTrail() if trailObj then trailObj:Destroy() trailObj=nil end if trailA0 then trailA0:Destroy() trailA0=nil end if trailA1 then trailA1:Destroy() trailA1=nil end end
local function createTrail(lifetime)
    removeTrail() local root=getRoot() if not root then return end
    trailA0=Instance.new("Attachment") trailA0.Position=Vector3.new(0,1,0) trailA0.Parent=root
    trailA1=Instance.new("Attachment") trailA1.Position=Vector3.new(0,-1,0) trailA1.Parent=root
    trailObj=Instance.new("Trail") trailObj.Attachment0=trailA0 trailObj.Attachment1=trailA1
    trailObj.Lifetime=lifetime or 0.6 trailObj.MinLength=0
    trailObj.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,215,0)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(139,0,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,215,0))})
    trailObj.WidthScale=NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0)})
    trailObj.Parent=root
end

-- PLAYER LINES
local lineAdornments={}
local function clearLines() for _,a in pairs(lineAdornments) do pcall(function() a:Destroy() end) end lineAdornments={} end
local function rebuildLines()
    clearLines() if not state.playerLines then return end
    for _,p in pairs(Players:GetPlayers()) do
        if p~=localPlayer and p.Character then
            local hrp=p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local line=Instance.new("BoxHandleAdornment") line.Adornee=hrp line.Size=Vector3.new(0.1,0.1,14) line.CFrame=CFrame.new(0,0,-7) line.Color3=Color3.fromRGB(255,215,0) line.AlwaysOnTop=true line.Transparency=0.1 line.Parent=game:GetService("CoreGui")
                table.insert(lineAdornments,line)
            end
        end
    end
end

-- FULLBRIGHT
local function setFullbright(on)
    if on then Lighting.Brightness=10 Lighting.ClockTime=14 Lighting.FogEnd=1e6 Lighting.GlobalShadows=false Lighting.Ambient=Color3.fromRGB(255,255,255)
    else Lighting.Brightness=1 Lighting.ClockTime=14 Lighting.FogEnd=1e4 Lighting.GlobalShadows=true Lighting.Ambient=Color3.fromRGB(127,127,127) end
end

-- BODY COLOR
local function setBodyColor(on, color)
    local char=getChar() if not char then return end
    for _,p in pairs(char:GetDescendants()) do
        if p:IsA("BasePart") then
            if on then p.Color=color p.Material=Enum.Material.SmoothPlastic
            else p.Material=Enum.Material.SmoothPlastic end
        end
    end
end

-- CHAMS
local function applyChams(on)
    local char=getChar() if not char then return end
    for _,p in pairs(char:GetDescendants()) do
        if p:IsA("BasePart") then
            p.Material=on and Enum.Material.Neon or Enum.Material.SmoothPlastic
            if on then p.Color=Color3.fromRGB(255,215,0) end
        end
    end
end

-- SCALE helpers
local function setCharScale(w,h,d)
    local root=getRoot() if not root then return end
    root.Size=Vector3.new(w,h,d)
end

-- DISABLE ALL
local function disableAll()
    for k,_ in pairs(state) do if type(state[k])=="boolean" then state[k]=false end end
    stopFly() stopNoclip() removeTrail() clearESP() clearLines()
    applyChams(false) setFullbright(false)
    workspace.Gravity=originalGravity getCam().FieldOfView=70
    for k,c in pairs(connections) do if c and c.Disconnect then c:Disconnect() end connections[k]=nil end
    local hum=getHum() if hum then hum.WalkSpeed=16 hum.JumpPower=50 hum.MaxHealth=100 hum.Health=100 end
    Lighting.FogEnd=1e4 Lighting.Brightness=1 Lighting.GlobalShadows=true Lighting.Ambient=Color3.fromRGB(127,127,127)
    Rayfield:Notify({Title="All Clear 👑",Content="Every HDGB mod disabled",Duration=3})
end

-- MAIN LOOP
local timers={esp=0,lines=0,fireworks=0,confetti=0,autoJump=0,dash=0}
local rainbowColors={Color3.fromRGB(255,0,0),Color3.fromRGB(255,100,0),Color3.fromRGB(255,255,0),Color3.fromRGB(0,255,0),Color3.fromRGB(0,255,255),Color3.fromRGB(0,100,255),Color3.fromRGB(180,0,255)}
local rainbowIdx=1 local rainbowTimer=0
local skyCols={Color3.fromRGB(255,0,0),Color3.fromRGB(0,200,255),Color3.fromRGB(0,255,0),Color3.fromRGB(255,165,0),Color3.fromRGB(180,0,255)}
local skyIdx=1 local skyTimer=0

RunService.Heartbeat:Connect(function(dt)
    timers.esp+=dt timers.lines+=dt timers.fireworks+=dt timers.confetti+=dt timers.autoJump+=dt timers.dash+=dt
    rainbowTimer+=dt skyTimer+=dt

    if timers.esp>=5 then timers.esp=0 if state.esp then buildESP() end end
    if timers.lines>=3 then timers.lines=0 if state.playerLines then rebuildLines() end end

    -- Fly
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
            flyBV.Velocity=move.Magnitude>0 and move.Unit*state.flySpeed or Vector3.zero
            if flyBG then flyBG.CFrame=cam.CFrame end
        end
    end

    if state.rainbow and rainbowTimer>=0.07 then
        rainbowTimer=0 rainbowIdx=(rainbowIdx%#rainbowColors)+1
        local char=getChar() if char then for _,p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.Color=rainbowColors[rainbowIdx] end end end
    end

    if state.rainbowSky and skyTimer>=1 then
        skyTimer=0 skyIdx=(skyIdx%#skyCols)+1
        Lighting.Ambient=skyCols[skyIdx]
    end

    if state.spin then local root=getRoot() if root then root.CFrame*=CFrame.Angles(0,math.rad(state.spinSpeed),0) end end
    if state.superSpin then local root=getRoot() if root then root.CFrame*=CFrame.Angles(0,math.rad(30),0) end end

    if state.dance then
        local root=getRoot() if root then
            danceAngle+=dt*120
            root.CFrame=root.CFrame*CFrame.Angles(0,math.rad(math.sin(danceAngle)*30),0)
        end
    end

    if state.godMode then local hum=getHum() if hum and hum.Health<hum.MaxHealth then hum.Health=hum.MaxHealth end end
    if state.autoHeal then local hum=getHum() if hum and hum.Health<hum.MaxHealth then hum.Health=math.min(hum.MaxHealth,hum.Health+state.autoHealAmount*dt) end end
    if state.fastHeal then local hum=getHum() if hum and hum.Health<hum.MaxHealth then hum.Health=math.min(hum.MaxHealth,hum.Health+50*dt) end end
    if state.noFallDamage then local hum=getHum() if hum then hum.MaxHealth=1e6 hum.Health=1e6 end end
    if state.hover then local root=getRoot() if root and root.Velocity.Y<0 then root.Velocity=Vector3.new(root.Velocity.X,-state.hoverSpeed,root.Velocity.Z) end end
    if state.bouncy then local root=getRoot() if root and root.Velocity.Y<-10 then root.Velocity=Vector3.new(root.Velocity.X,state.bouncyPower,root.Velocity.Z) end end
    if state.superBounce then local root=getRoot() if root and root.Velocity.Y<-5 then root.Velocity=Vector3.new(root.Velocity.X,150,root.Velocity.Z) end end
    if state.bigHead then local char=getChar() if char and char:FindFirstChild("Head") then char.Head.Size=Vector3.new(state.bigHeadSize,state.bigHeadSize,state.bigHeadSize) end end
    if state.giantHead then local char=getChar() if char and char:FindFirstChild("Head") then char.Head.Size=Vector3.new(8,8,8) end end

    if state.fireworks and timers.fireworks>=0.1 then
        timers.fireworks=0 local root=getRoot()
        if root then local f=Instance.new("Part") f.Size=Vector3.new(0.5,0.5,0.5) f.Shape=Enum.PartType.Ball f.Position=root.Position+Vector3.new(math.random(-8,8),math.random(3,12),math.random(-8,8)) f.Anchored=true f.BrickColor=BrickColor.random() f.Material=Enum.Material.Neon f.Parent=workspace Debris:AddItem(f,0.8) end
    end

    if state.confetti and timers.confetti>=0.05 then
        timers.confetti=0 local root=getRoot()
        if root then for i=1,3 do local c=Instance.new("Part") c.Size=Vector3.new(0.15,0.15,0.15) c.Position=root.Position+Vector3.new(math.random(-3,3),math.random(0,4),math.random(-3,3)) c.Anchored=true c.BrickColor=BrickColor.random() c.Parent=workspace Debris:AddItem(c,1.5) end end
    end

    if state.snow then
        local root=getRoot()
        if root and math.random()<0.3 then
            local s=Instance.new("Part") s.Size=Vector3.new(0.2,0.2,0.2) s.Shape=Enum.PartType.Ball s.Position=root.Position+Vector3.new(math.random(-20,20),20,math.random(-20,20)) s.BrickColor=BrickColor.new("White") s.Transparency=0.3 s.Parent=workspace Debris:AddItem(s,5)
        end
    end

    if state.autoJump and timers.autoJump>=2 then
        timers.autoJump=0 local hum=getHum() if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end

    if state.autoDash and timers.dash>=1 then
        timers.dash=0 local root=getRoot()
        if root then root.Velocity=getCam().CFrame.LookVector*state.dashSpeed end
    end

    if state.wallClimb then
        local root=getRoot() local char=getChar()
        if root and char then
            local params=RaycastParams.new() params.FilterDescendantsInstances={char}
            local ray=workspace:Raycast(root.Position,root.CFrame.LookVector*3,params)
            if ray and ray.Normal.Y<0.5 then root.Velocity=Vector3.new(0,20,0) end
        end
    end

    if state.magnetMode then
        for _,p in pairs(Players:GetPlayers()) do
            if p~=localPlayer and p.Character then
                local hrp=p.Character:FindFirstChild("HumanoidRootPart") local root=getRoot()
                if hrp and root then
                    local dir=(root.Position-hrp.Position).Unit
                    hrp.Velocity=dir*80
                end
            end
        end
    end

    if state.freeze then
        for _,p in pairs(Players:GetPlayers()) do
            if p~=localPlayer and p.Character then
                local hum=p.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum.WalkSpeed=0 hum.JumpPower=0 end
            end
        end
    end

    if state.noGravity then workspace.Gravity=0
    elseif state.moonGravity then workspace.Gravity=16 end
end)

UserInputService.JumpRequest:Connect(function()
    if state.infiniteJump then local hum=getHum() if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end end
end)

local mouse=localPlayer:GetMouse()
mouse.Button1Down:Connect(function()
    if state.teleportMode then local root=getRoot() if root and mouse.Target then root.CFrame=CFrame.new(mouse.Hit.p+Vector3.new(0,3,0)) end end
end)

UserInputService.JumpRequest:Connect(function()
    if state.platform then
        local root=getRoot() if not root then return end
        local plat=Instance.new("Part") plat.Size=Vector3.new(state.platformSize,0.5,state.platformSize) plat.Position=Vector3.new(root.Position.X,root.Position.Y-3,root.Position.Z) plat.Anchored=true plat.BrickColor=BrickColor.new("Bright yellow") plat.Material=Enum.Material.Neon plat.Transparency=0.3 plat.Parent=workspace Debris:AddItem(plat,5)
    end
end)

localPlayer.CharacterAdded:Connect(function()
    task.wait(0.8)
    if state.superSpeed then local h=getHum() if h then h.WalkSpeed=state.speedAmount end end
    if state.megaJump then local h=getHum() if h then h.JumpPower=state.jumpPower end end
    if state.fly then task.wait(0.2) startFly() end
    if state.noclip then startNoclip() end
    if state.trail then task.wait(0.2) createTrail() end
    if state.esp then task.wait(1) buildESP() end
    if state.chams then task.wait(0.5) applyChams(true) end
end)

Players.PlayerAdded:Connect(function() task.wait(1) if state.esp then buildESP() end if state.playerLines then rebuildLines() end end)
Players.PlayerRemoving:Connect(function() task.wait(0.2) if state.esp then buildESP() end if state.playerLines then rebuildLines() end end)

-- =====================
-- MOBILE PAD
-- =====================
local mobileGui=Instance.new("ScreenGui") mobileGui.Name="HDGBMobile" mobileGui.ResetOnSpawn=false mobileGui.IgnoreGuiInset=true mobileGui.Parent=game:GetService("CoreGui")
local mobileInput={forward=false,back=false,left=false,right=false,up=false,down=false}
local mobileContainer=Instance.new("Frame") mobileContainer.Size=UDim2.new(0,220,0,220) mobileContainer.Position=UDim2.new(1,-230,1,-230) mobileContainer.BackgroundTransparency=1 mobileContainer.Visible=false mobileContainer.Parent=mobileGui

local function makeMBtn(text,color,x,y,sz)
    sz=sz or 65
    local btn=Instance.new("TextButton") btn.Size=UDim2.new(0,sz,0,sz) btn.Position=UDim2.new(0,x,0,y) btn.BackgroundColor3=color btn.BackgroundTransparency=0.2 btn.Text=text btn.TextColor3=Color3.fromRGB(255,255,255) btn.TextSize=20 btn.Font=Enum.Font.GothamBold btn.AutoButtonColor=false btn.Parent=mobileContainer
    Instance.new("UICorner",btn).CornerRadius=UDim.new(0,14)
    return btn
end

local gold=Color3.fromRGB(200,150,0)
local mFwd=makeMBtn("↑",gold,75,0) local mBck=makeMBtn("↓",gold,75,150) local mLft=makeMBtn("←",gold,0,75) local mRgt=makeMBtn("→",gold,150,75)
local mUp=makeMBtn("▲",Color3.fromRGB(0,150,60),148,78,30) mUp.Size=UDim2.new(0,30,0,30)
local mDn=makeMBtn("▼",Color3.fromRGB(180,40,40),148,112,30) mDn.Size=UDim2.new(0,30,0,30)

local mToggle=Instance.new("TextButton") mToggle.Size=UDim2.new(0,55,0,55) mToggle.Position=UDim2.new(0,10,1,-70) mToggle.BackgroundColor3=Color3.fromRGB(139,0,0) mToggle.BackgroundTransparency=0.2 mToggle.Text="👑" mToggle.TextSize=24 mToggle.Font=Enum.Font.GothamBold mToggle.TextColor3=Color3.fromRGB(255,215,0) mToggle.Parent=mobileGui
Instance.new("UICorner",mToggle).CornerRadius=UDim.new(0,14)

local function bindMHold(btn,key)
    btn.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then mobileInput[key]=true btn.BackgroundTransparency=0.05 end end)
    btn.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then mobileInput[key]=false btn.BackgroundTransparency=0.2 end end)
end
bindMHold(mFwd,"forward") bindMHold(mBck,"back") bindMHold(mLft,"left") bindMHold(mRgt,"right") bindMHold(mUp,"up") bindMHold(mDn,"down")

local mVisible=false
mToggle.MouseButton1Click:Connect(function()
    mVisible=not mVisible mobileContainer.Visible=mVisible state.fly=mVisible
    if mVisible then startFly() mToggle.BackgroundColor3=Color3.fromRGB(255,180,0)
    else stopFly() for k in pairs(mobileInput) do mobileInput[k]=false end mToggle.BackgroundColor3=Color3.fromRGB(139,0,0) end
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
    if flyBG then flyBG.CFrame=cam.CFrame end
end)

-- =====================
-- RAYFIELD WITH KEY
-- =====================
local Window = Rayfield:CreateWindow({
    Name = "HDGB Premium Ultra",
    LoadingTitle = "HDGB Premium Ultra",
    LoadingSubtitle = "by HDGB | The Honored One",
    ConfigurationSaving = {Enabled=true,FolderName="HDGBHub",FileName="Config"},
    Discord = {Enabled=false},
    KeySystem = true,
    KeySettings = {
        Title = "HDGB Premium Ultra",
        Subtitle = "Key System",
        Note = "The key is: HDGB",
        FileName = "HDGBKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"HDGB"}
    }
})

local function makeToggle(tab,name,desc,flag,onEn,onDis)
    tab:CreateToggle({Name=name,Description=desc,CurrentValue=false,Flag=flag,Callback=function(v) if v then onEn() else onDis() end end})
end
local function makeSlider(tab,name,desc,flag,mn,mx,inc,suf,def,cb)
    tab:CreateSlider({Name=name,Description=desc,Flag=flag,Range={mn,mx},Increment=inc,Suffix=suf,CurrentValue=def,Callback=cb})
end
local function makeButton(tab,name,desc,cb)
    tab:CreateButton({Name=name,Description=desc,Callback=cb})
end
local function noop() end

-- ALL MODS TAB
local AllTab=Window:CreateTab("👑 All Mods",4483362458)

AllTab:CreateSection("✈️ Movement")
makeToggle(AllTab,"Fly Mode","WASD+Space/Ctrl. Tap 👑 on mobile","H_Fly",function() state.fly=true startFly() end,function() state.fly=false stopFly() end)
makeSlider(AllTab,"Fly Speed","Flight speed","H_FlySpd",5,400,5," spd",80,function(v) state.flySpeed=v end)
makeToggle(AllTab,"Super Speed","Fast movement","H_Speed",function() state.superSpeed=true local h=getHum() if h then h.WalkSpeed=state.speedAmount end end,function() state.superSpeed=false local h=getHum() if h then h.WalkSpeed=16 end end)
makeSlider(AllTab,"Walk Speed","Speed amount","H_WalkSpd",16,500,5," s/s",80,function(v) state.speedAmount=v if state.superSpeed then local h=getHum() if h then h.WalkSpeed=v end end end)
makeToggle(AllTab,"Infinite Jump","Jump mid-air unlimited","H_InfJump",function() state.infiniteJump=true end,function() state.infiniteJump=false end)
makeToggle(AllTab,"High Jump","Jump much higher","H_HiJump",function() state.megaJump=true local h=getHum() if h then h.JumpPower=state.jumpPower end end,function() state.megaJump=false local h=getHum() if h then h.JumpPower=originalJumpPower end end)
makeSlider(AllTab,"Jump Power","How high you jump","H_JumpPwr",50,500,10," pwr",150,function(v) state.jumpPower=v if state.megaJump then local h=getHum() if h then h.JumpPower=v end end end)
makeToggle(AllTab,"Noclip","Walk through walls","H_Noclip",function() state.noclip=true startNoclip() end,function() state.noclip=false stopNoclip() end)
makeToggle(AllTab,"Low Gravity","Reduce gravity","H_Grav",function() state.gravityEnabled=true workspace.Gravity=state.gravityAmount end,function() state.gravityEnabled=false workspace.Gravity=originalGravity end)
makeSlider(AllTab,"Gravity Amount","Gravity level","H_GravAmt",0,300,5," g",20,function(v) state.gravityAmount=v if state.gravityEnabled then workspace.Gravity=v end end)
makeToggle(AllTab,"Zero Gravity","No gravity at all","H_NoGrav",function() state.noGravity=true workspace.Gravity=0 end,function() state.noGravity=false workspace.Gravity=originalGravity end)
makeToggle(AllTab,"Moon Gravity","Moon-like gravity","H_MoonGrav",function() state.moonGravity=true workspace.Gravity=16 end,function() state.moonGravity=false workspace.Gravity=originalGravity end)
makeToggle(AllTab,"Hover","Slow fall like a feather","H_Hover",function() state.hover=true end,function() state.hover=false end)
makeSlider(AllTab,"Hover Speed","Fall speed when hovering","H_HoverSpd",1,20,1," spd",5,function(v) state.hoverSpeed=v end)
makeToggle(AllTab,"Teleport Mode","Click anywhere to teleport","H_TpMode",function() state.teleportMode=true end,function() state.teleportMode=false end)
makeToggle(AllTab,"Wall Climb","Climb walls","H_WallClimb",function() state.wallClimb=true end,function() state.wallClimb=false end)
makeToggle(AllTab,"Auto Platform","Platform spawns on jump","H_Platform",function() state.platform=true end,function() state.platform=false end)
makeSlider(AllTab,"Platform Size","Platform size","H_PlatSz",3,20,1," studs",5,function(v) state.platformSize=v end)
makeToggle(AllTab,"Auto Jump","Jump automatically every 2s","H_AutoJump",function() state.autoJump=true end,function() state.autoJump=false end)
makeToggle(AllTab,"Auto Dash","Dash forward every second","H_AutoDash",function() state.autoDash=true end,function() state.autoDash=false end)
makeSlider(AllTab,"Dash Speed","Auto dash power","H_DashSpd",50,300,10," spd",150,function(v) state.dashSpeed=v end)
makeButton(AllTab,"🚀 Rocket Launch","Launch yourself up",function() local r=getRoot() if r then r.Velocity=Vector3.new(0,350,0) end end)
makeButton(AllTab,"🌀 Random Fling","Fling randomly",function() local r=getRoot() if r then r.Velocity=Vector3.new(math.random(-250,250),250,math.random(-250,250)) end end)
makeButton(AllTab,"📍 Teleport to Player","Warp to random player",function()
    local root=getRoot() if not root then return end
    local others={} for _,p in pairs(Players:GetPlayers()) do if p~=localPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then table.insert(others,p) end end
    if #others>0 then local t=others[math.random(1,#others)] root.CFrame=t.Character.HumanoidRootPart.CFrame+Vector3.new(3,0,0) Rayfield:Notify({Title="Teleported",Content="Warped to "..t.Name,Duration=2}) end
end)
makeButton(AllTab,"📍 Teleport to Spawn","Go to spawn",function() local r=getRoot() if r then r.CFrame=CFrame.new(0,10,0) end end)

AllTab:CreateSection("⚔️ Combat")
makeToggle(AllTab,"God Mode","Always full health","H_God",function() state.godMode=true end,function() state.godMode=false local h=getHum() if h then h.MaxHealth=100 h.Health=100 end end)
makeToggle(AllTab,"Auto Heal","Regen health slowly","H_Heal",function() state.autoHeal=true end,function() state.autoHeal=false end)
makeToggle(AllTab,"Fast Heal","Regen health very fast","H_FastHeal",function() state.fastHeal=true end,function() state.fastHeal=false end)
makeSlider(AllTab,"Heal Rate","HP per second","H_HealRate",1,100,1," hp/s",10,function(v) state.autoHealAmount=v end)
makeToggle(AllTab,"No Fall Damage","Never die from falling","H_FallDmg",function() state.noFallDamage=true end,function() state.noFallDamage=false local h=getHum() if h then h.MaxHealth=100 h.Health=100 end end)
makeToggle(AllTab,"Freeze Players","Freeze all other players","H_Freeze",function() state.freeze=true end,function()
    state.freeze=false
    for _,p in pairs(Players:GetPlayers()) do
        if p~=localPlayer and p.Character then local hum=p.Character:FindFirstChildOfClass("Humanoid") if hum then hum.WalkSpeed=16 hum.JumpPower=50 end end
    end
end)
makeToggle(AllTab,"Magnet Mode","Pull all players toward you","H_Magnet",function() state.magnetMode=true end,function() state.magnetMode=false end)
makeButton(AllTab,"❤️ Heal to Full","Instantly restore health",function() local h=getHum() if h then h.Health=h.MaxHealth Rayfield:Notify({Title="Healed 👑",Content="Full health!",Duration=2}) end end)
makeButton(AllTab,"💀 Reset Character","Kill and respawn",function() local h=getHum() if h then h.Health=0 end end)

AllTab:CreateSection("👁️ Visuals & Body")
makeToggle(AllTab,"Rainbow Mode","Cycle rainbow colors","H_Rainbow",function() state.rainbow=true end,function() state.rainbow=false end)
makeToggle(AllTab,"Invisible","Go fully invisible","H_Invis",function() state.invisible=true local c=getChar() if c then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.Transparency=1 end end end end,function() state.invisible=false local c=getChar() if c then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.Transparency=0 end end end end)
makeToggle(AllTab,"HDGB Gold Trail","Gold trail as you move","H_Trail",function() state.trail=true createTrail(0.6) end,function() state.trail=false removeTrail() end)
makeToggle(AllTab,"Long Trail","Extra long trail","H_LongTrail",function() state.longTrail=true createTrail(2) end,function() state.longTrail=false removeTrail() end)
makeToggle(AllTab,"Spin","Rotate character","H_Spin",function() state.spin=true end,function() state.spin=false end)
makeSlider(AllTab,"Spin Speed","Rotation speed","H_SpinSpd",1,50,1," deg/f",5,function(v) state.spinSpeed=v end)
makeToggle(AllTab,"Super Spin","Very fast spin","H_SSpin",function() state.superSpin=true end,function() state.superSpin=false end)
makeToggle(AllTab,"Big Head","Huge head","H_BigHead",function() state.bigHead=true end,function() state.bigHead=false local c=getChar() if c and c:FindFirstChild("Head") then c.Head.Size=Vector3.new(2,1,1) end end)
makeSlider(AllTab,"Head Size","How big the head is","H_HeadSz",2,10,0.5," x",3,function(v) state.bigHeadSize=v end)
makeToggle(AllTab,"Giant Head","Maximum head size","H_GiantHead",function() state.giantHead=true end,function() state.giantHead=false local c=getChar() if c and c:FindFirstChild("Head") then c.Head.Size=Vector3.new(2,1,1) end end)
makeToggle(AllTab,"Giant Mode","Become huge","H_Giant",function() state.giant=true local r=getRoot() if r then r.Size=Vector3.new(state.giantSize,state.giantSize,state.giantSize) end end,function() state.giant=false local r=getRoot() if r then r.Size=Vector3.new(2,2,1) end end)
makeSlider(AllTab,"Giant Size","How big you become","H_GiantSz",2,10,0.5," x",3,function(v) state.giantSize=v if state.giant then local r=getRoot() if r then r.Size=Vector3.new(v,v,v) end end end)
makeToggle(AllTab,"Tiny Mode","Become tiny","H_Tiny",function() state.tiny=true local r=getRoot() if r then r.Size=Vector3.new(0.5,0.5,0.5) end end,function() state.tiny=false local r=getRoot() if r then r.Size=Vector3.new(2,2,1) end end)
makeToggle(AllTab,"Chams — Gold","Neon gold body","H_Chams",function() state.chams=true applyChams(true) end,function() state.chams=false applyChams(false) end)
makeToggle(AllTab,"Red Body","Red character","H_RedBody",function() setBodyColor(true,Color3.fromRGB(255,50,50)) end,function() setBodyColor(false,nil) end)
makeToggle(AllTab,"Blue Body","Blue character","H_BlueBody",function() setBodyColor(true,Color3.fromRGB(50,100,255)) end,function() setBodyColor(false,nil) end)
makeToggle(AllTab,"Green Body","Green character","H_GreenBody",function() setBodyColor(true,Color3.fromRGB(50,200,50)) end,function() setBodyColor(false,nil) end)
makeToggle(AllTab,"Gold Body","Gold character","H_GoldBody",function() setBodyColor(true,Color3.fromRGB(255,215,0)) end,function() setBodyColor(false,nil) end)
makeToggle(AllTab,"Black Body","Black character","H_BlackBody",function() setBodyColor(true,Color3.fromRGB(20,20,20)) end,function() setBodyColor(false,nil) end)
makeToggle(AllTab,"White Body","White character","H_WhiteBody",function() setBodyColor(true,Color3.fromRGB(255,255,255)) end,function() setBodyColor(false,nil) end)
makeToggle(AllTab,"Shadow Body","Dark purple character","H_ShadowBody",function() setBodyColor(true,Color3.fromRGB(40,0,60)) end,function() setBodyColor(false,nil) end)
makeToggle(AllTab,"Neon Body","Bright neon pink","H_NeonBody",function() setBodyColor(true,Color3.fromRGB(255,0,200)) end,function() setBodyColor(false,nil) end)
makeToggle(AllTab,"Dance Mode","Character dances","H_Dance",function() state.dance=true end,function() state.dance=false end)
makeToggle(AllTab,"Bouncy","Bounce on ground","H_Bouncy",function() state.bouncy=true end,function() state.bouncy=false end)
makeToggle(AllTab,"Super Bounce","Extreme bounce","H_SBounce",function() state.superBounce=true end,function() state.superBounce=false end)
makeSlider(AllTab,"Bounce Power","Bounce height","H_BouncePwr",5,100,5," pwr",25,function(v) state.bouncyPower=v end)
makeToggle(AllTab,"Fireworks","Neon fireworks around you","H_Fireworks",function() state.fireworks=true end,function() state.fireworks=false end)
makeToggle(AllTab,"Confetti","Confetti follows you","H_Confetti",function() state.confetti=true end,function() state.confetti=false end)

AllTab:CreateSection("🌍 World")
makeToggle(AllTab,"Fullbright","Remove all shadows","H_Fbright",function() setFullbright(true) end,function() setFullbright(false) end)
makeToggle(AllTab,"Night Mode","Dark world","H_Night",function() Lighting.Brightness=0.05 Lighting.Ambient=Color3.fromRGB(10,10,30) end,function() Lighting.Brightness=1 Lighting.Ambient=Color3.fromRGB(127,127,127) end)
makeToggle(AllTab,"Fog","Thick fog","H_Fog",function() Lighting.FogEnd=80 Lighting.FogColor=Color3.fromRGB(180,180,180) end,function() Lighting.FogEnd=1e4 end)
makeToggle(AllTab,"Rainbow Sky","Sky cycles colors","H_RainbowSky",function() state.rainbowSky=true end,function() state.rainbowSky=false Lighting.Ambient=Color3.fromRGB(127,127,127) end)
makeToggle(AllTab,"Snow","Snow falls around you","H_Snow",function() state.snow=true end,function() state.snow=false end)
makeToggle(AllTab,"Red Sky","Blood red sky","H_RedSky",function() Lighting.Ambient=Color3.fromRGB(180,0,0) Lighting.OutdoorAmbient=Color3.fromRGB(180,0,0) end,function() Lighting.Ambient=Color3.fromRGB(127,127,127) Lighting.OutdoorAmbient=Color3.fromRGB(127,127,127) end)
makeToggle(AllTab,"Blue Sky","Deep blue sky","H_BlueSky",function() Lighting.Ambient=Color3.fromRGB(0,80,200) end,function() Lighting.Ambient=Color3.fromRGB(127,127,127) end)
makeToggle(AllTab,"Purple Sky","Purple sky","H_PurpleSky",function() Lighting.Ambient=Color3.fromRGB(100,0,180) end,function() Lighting.Ambient=Color3.fromRGB(127,127,127) end)
makeSlider(AllTab,"FOV","Field of view","H_FOV",70,120,1," fov",70,function(v) getCam().FieldOfView=v end)

AllTab:CreateSection("🔍 ESP & Tracking")
makeToggle(AllTab,"Player ESP","See players through walls w/ health","H_ESP",function() state.esp=true buildESP() end,function() state.esp=false clearESP() end)
makeToggle(AllTab,"Player Look Lines","Gold lines showing player direction","H_Lines",function() state.playerLines=true rebuildLines() end,function() state.playerLines=false clearLines() end)

AllTab:CreateSection("🔧 Utility")
makeToggle(AllTab,"Anti AFK","Never get kicked","H_AFK",function()
    state.antiAFK=true local VIM=game:GetService("VirtualInputManager")
    if connections.antiAFK then connections.antiAFK:Disconnect() end
    local t=0
    connections.antiAFK=RunService.Heartbeat:Connect(function(dt)
        if not state.antiAFK then return end
        t+=dt if t>=60 then t=0 VIM:SendKeyEvent(true,Enum.KeyCode.F13,false,game) VIM:SendKeyEvent(false,Enum.KeyCode.F13,false,game) end
    end)
end,function() state.antiAFK=false if connections.antiAFK then connections.antiAFK:Disconnect() connections.antiAFK=nil end end)
makeToggle(AllTab,"Auto Clicker","Automatically clicks","H_AutoClick",function()
    state.autoClick=true if connections.autoClick then connections.autoClick:Disconnect() end
    connections.autoClick=RunService.Heartbeat:Connect(function()
        if state.autoClick then local VIM=game:GetService("VirtualInputManager") VIM:SendMouseButtonEvent(0,0,0,true,game,1) VIM:SendMouseButtonEvent(0,0,0,false,game,1) end
    end)
end,function() state.autoClick=false if connections.autoClick then connections.autoClick:Disconnect() connections.autoClick=nil end end)
makeButton(AllTab,"💺 Sit Toggle","Sit or stand",function() local h=getHum() if h then h.Sit=not h.Sit end end)
makeButton(AllTab,"🧹 Disable ALL Mods","Turn off everything",disableAll)

-- INDIVIDUAL TABS
local MoveTab=Window:CreateTab("✈️ Movement",4483362458)
MoveTab:CreateSection("Flight")
makeToggle(MoveTab,"Fly Mode","WASD+Space/Ctrl. Tap 👑 mobile","M_Fly",function() state.fly=true startFly() end,function() state.fly=false stopFly() end)
makeSlider(MoveTab,"Fly Speed","Speed","M_FlySpd",5,400,5," spd",80,function(v) state.flySpeed=v end)
MoveTab:CreateSection("Speed & Jump")
makeToggle(MoveTab,"Super Speed","Fast walk","M_Speed",function() state.superSpeed=true local h=getHum() if h then h.WalkSpeed=state.speedAmount end end,function() state.superSpeed=false local h=getHum() if h then h.WalkSpeed=16 end end)
makeSlider(MoveTab,"Walk Speed","Speed level","M_WalkSpd",16,500,5," s/s",80,function(v) state.speedAmount=v if state.superSpeed then local h=getHum() if h then h.WalkSpeed=v end end end)
makeToggle(MoveTab,"Infinite Jump","Jump mid-air","M_InfJump",function() state.infiniteJump=true end,function() state.infiniteJump=false end)
makeToggle(MoveTab,"High Jump","Higher jumps","M_HiJump",function() state.megaJump=true local h=getHum() if h then h.JumpPower=state.jumpPower end end,function() state.megaJump=false local h=getHum() if h then h.JumpPower=originalJumpPower end end)
makeSlider(MoveTab,"Jump Power","Jump height","M_JumpPwr",50,500,10," pwr",150,function(v) state.jumpPower=v if state.megaJump then local h=getHum() if h then h.JumpPower=v end end end)
MoveTab:CreateSection("World")
makeToggle(MoveTab,"Noclip","Through walls","M_Noclip",function() state.noclip=true startNoclip() end,function() state.noclip=false stopNoclip() end)
makeToggle(MoveTab,"Zero Gravity","No gravity","M_NoGrav",function() state.noGravity=true workspace.Gravity=0 end,function() state.noGravity=false workspace.Gravity=originalGravity end)
makeToggle(MoveTab,"Moon Gravity","Moon physics","M_MoonGrav",function() state.moonGravity=true workspace.Gravity=16 end,function() state.moonGravity=false workspace.Gravity=originalGravity end)
makeToggle(MoveTab,"Hover","Slow fall","M_Hover",function() state.hover=true end,function() state.hover=false end)
makeToggle(MoveTab,"Wall Climb","Climb walls","M_WallClimb",function() state.wallClimb=true end,function() state.wallClimb=false end)
makeToggle(MoveTab,"Teleport Mode","Click to teleport","M_TpMode",function() state.teleportMode=true end,function() state.teleportMode=false end)
makeButton(MoveTab,"🚀 Rocket","Launch up",function() local r=getRoot() if r then r.Velocity=Vector3.new(0,350,0) end end)
makeButton(MoveTab,"🌀 Fling","Random fling",function() local r=getRoot() if r then r.Velocity=Vector3.new(math.random(-250,250),250,math.random(-250,250)) end end)

local CombatTab=Window:CreateTab("⚔️ Combat",4483362458)
CombatTab:CreateSection("Defense")
makeToggle(CombatTab,"God Mode","Always full health","C_God",function() state.godMode=true end,function() state.godMode=false local h=getHum() if h then h.MaxHealth=100 h.Health=100 end end)
makeToggle(CombatTab,"Auto Heal","Slow regen","C_Heal",function() state.autoHeal=true end,function() state.autoHeal=false end)
makeToggle(CombatTab,"Fast Heal","Fast regen","C_FastHeal",function() state.fastHeal=true end,function() state.fastHeal=false end)
makeToggle(CombatTab,"No Fall Damage","No fall death","C_Fall",function() state.noFallDamage=true end,function() state.noFallDamage=false local h=getHum() if h then h.MaxHealth=100 h.Health=100 end end)
makeToggle(CombatTab,"Freeze Players","Freeze everyone","C_Freeze",function() state.freeze=true end,function() state.freeze=false for _,p in pairs(Players:GetPlayers()) do if p~=localPlayer and p.Character then local hum=p.Character:FindFirstChildOfClass("Humanoid") if hum then hum.WalkSpeed=16 hum.JumpPower=50 end end end end)
makeToggle(CombatTab,"Magnet","Pull players to you","C_Magnet",function() state.magnetMode=true end,function() state.magnetMode=false end)
makeButton(CombatTab,"❤️ Heal","Full health",function() local h=getHum() if h then h.Health=h.MaxHealth end end)
makeButton(CombatTab,"💀 Reset","Respawn",function() local h=getHum() if h then h.Health=0 end end)

local VisualTab=Window:CreateTab("👁️ Visuals",4483362458)
VisualTab:CreateSection("Character Effects")
makeToggle(VisualTab,"Rainbow Mode","Rainbow colors","V_Rainbow",function() state.rainbow=true end,function() state.rainbow=false end)
makeToggle(VisualTab,"Invisible","Go invisible","V_Invis",function() state.invisible=true local c=getChar() if c then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.Transparency=1 end end end end,function() state.invisible=false local c=getChar() if c then for _,p in pairs(c:GetDescendants()) do if p:IsA("BasePart") then p.Transparency=0 end end end end)
makeToggle(VisualTab,"Gold Trail","Gold trail","V_Trail",function() createTrail(0.6) end,function() removeTrail() end)
makeToggle(VisualTab,"Chams Gold","Neon gold","V_Chams",function() applyChams(true) end,function() applyChams(false) end)
makeToggle(VisualTab,"Spin","Spin","V_Spin",function() state.spin=true end,function() state.spin=false end)
makeToggle(VisualTab,"Dance","Dance","V_Dance",function() state.dance=true end,function() state.dance=false end)
makeToggle(VisualTab,"Bouncy","Bounce","V_Bouncy",function() state.bouncy=true end,function() state.bouncy=false end)
makeToggle(VisualTab,"Fireworks","Fireworks","V_Fireworks",function() state.fireworks=true end,function() state.fireworks=false end)
makeToggle(VisualTab,"Confetti","Confetti","V_Confetti",function() state.confetti=true end,function() state.confetti=false end)
makeToggle(VisualTab,"Big Head","Huge head","V_BigHead",function() state.bigHead=true end,function() state.bigHead=false local c=getChar() if c and c:FindFirstChild("Head") then c.Head.Size=Vector3.new(2,1,1) end end)
makeToggle(VisualTab,"Giant Mode","Become giant","V_Giant",function() state.giant=true local r=getRoot() if r then r.Size=Vector3.new(4,4,4) end end,function() state.giant=false local r=getRoot() if r then r.Size=Vector3.new(2,2,1) end end)
makeToggle(VisualTab,"Tiny Mode","Become tiny","V_Tiny",function() state.tiny=true local r=getRoot() if r then r.Size=Vector3.new(0.5,0.5,0.5) end end,function() state.tiny=false local r=getRoot() if r then r.Size=Vector3.new(2,2,1) end end)
VisualTab:CreateSection("Body Color")
makeToggle(VisualTab,"Gold Body","Gold","V_Gold",function() setBodyColor(true,Color3.fromRGB(255,215,0)) end,function() setBodyColor(false,nil) end)
makeToggle(VisualTab,"Red Body","Red","V_Red",function() setBodyColor(true,Color3.fromRGB(255,50,50)) end,function() setBodyColor(false,nil) end)
makeToggle(VisualTab,"Blue Body","Blue","V_Blue",function() setBodyColor(true,Color3.fromRGB(50,100,255)) end,function() setBodyColor(false,nil) end)
makeToggle(VisualTab,"Black Body","Black","V_Black",function() setBodyColor(true,Color3.fromRGB(20,20,20)) end,function() setBodyColor(false,nil) end)
makeToggle(VisualTab,"White Body","White","V_White",function() setBodyColor(true,Color3.fromRGB(255,255,255)) end,function() setBodyColor(false,nil) end)
VisualTab:CreateSection("World")
makeToggle(VisualTab,"Fullbright","No shadows","V_Fbright",function() setFullbright(true) end,function() setFullbright(false) end)
makeToggle(VisualTab,"Night Mode","Dark world","V_Night",function() Lighting.Brightness=0.05 end,function() Lighting.Brightness=1 end)
makeToggle(VisualTab,"Fog","Thick fog","V_Fog",function() Lighting.FogEnd=80 end,function() Lighting.FogEnd=1e4 end)
makeToggle(VisualTab,"Rainbow Sky","Cycling sky colors","V_RainbowSky",function() state.rainbowSky=true end,function() state.rainbowSky=false Lighting.Ambient=Color3.fromRGB(127,127,127) end)
makeToggle(VisualTab,"Snow","Snow effect","V_Snow",function() state.snow=true end,function() state.snow=false end)
makeSlider(VisualTab,"FOV","Field of view","V_FOV",70,120,1," fov",70,function(v) getCam().FieldOfView=v end)
VisualTab:CreateSection("ESP")
makeToggle(VisualTab,"Player ESP","Gold ESP boxes","V_ESP",function() state.esp=true buildESP() end,function() state.esp=false clearESP() end)
makeToggle(VisualTab,"Look Lines","Gold direction lines","V_Lines",function() state.playerLines=true rebuildLines() end,function() state.playerLines=false clearLines() end)

local UtilTab=Window:CreateTab("🔧 Utility",4483362458)
UtilTab:CreateSection("Anti Detection")
makeToggle(UtilTab,"Anti AFK","Never kicked","U_AFK",function()
    state.antiAFK=true local VIM=game:GetService("VirtualInputManager") if connections.antiAFK then connections.antiAFK:Disconnect() end
    local t=0 connections.antiAFK=RunService.Heartbeat:Connect(function(dt) if not state.antiAFK then return end t+=dt if t>=60 then t=0 VIM:SendKeyEvent(true,Enum.KeyCode.F13,false,game) VIM:SendKeyEvent(false,Enum.KeyCode.F13,false,game) end end)
end,function() state.antiAFK=false if connections.antiAFK then connections.antiAFK:Disconnect() connections.antiAFK=nil end end)
makeToggle(UtilTab,"Auto Clicker","Auto click","U_AutoClick",function()
    state.autoClick=true if connections.autoClick then connections.autoClick:Disconnect() end
    connections.autoClick=RunService.Heartbeat:Connect(function() if state.autoClick then local VIM=game:GetService("VirtualInputManager") VIM:SendMouseButtonEvent(0,0,0,true,game,1) VIM:SendMouseButtonEvent(0,0,0,false,game,1) end end)
end,function() state.autoClick=false if connections.autoClick then connections.autoClick:Disconnect() connections.autoClick=nil end end)
makeButton(UtilTab,"💺 Sit","Toggle sit",function() local h=getHum() if h then h.Sit=not h.Sit end end)
UtilTab:CreateSection("Master Reset")
makeButton(UtilTab,"🧹 Disable ALL","Reset everything",disableAll)

Rayfield:LoadConfiguration()
Rayfield:Notify({Title="HDGB Premium Ultra 👑",Content="Key: HDGB | Tap 👑 for mobile fly | All mods in 👑 tab",Duration=6})
