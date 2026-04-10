--[[
    HDGB HONORED ONE PREMIUM MENU v12.2
    Made by HDGB | 89 WORKING MODS | FULL SCROLLING
    JOIN DISCORD: HDGB Honored One MOD MENU
    KEY: HDGB - Scroll ALL the way down!
--]]

local player = game.Players.LocalPlayer

-- ============ DISCORD KEY SYSTEM ============
local discordName = "HDGB Honored One MOD MENU"
local ownerName = "HDGB"
local correctKey = "HDGB"

-- ============ CREATE KEY ENTRY GUI ============
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "KeyEntryGui"
keyGui.Parent = player.PlayerGui
keyGui.ResetOnSpawn = false

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(1, 0, 1, 0)
keyFrame.BackgroundTransparency = 1
keyFrame.Parent = keyGui

local centerFrame = Instance.new("Frame")
centerFrame.Size = UDim2.new(0, 400, 0, 360)
centerFrame.Position = UDim2.new(0.5, -200, 0.5, -180)
centerFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
centerFrame.BackgroundTransparency = 0.1
centerFrame.BorderSizePixel = 2
centerFrame.BorderColor3 = Color3.fromRGB(139, 0, 0)
centerFrame.Parent = keyFrame

local centerCorner = Instance.new("UICorner")
centerCorner.CornerRadius = UDim.new(0, 20)
centerCorner.Parent = centerFrame

local glowBorder = Instance.new("Frame")
glowBorder.Size = UDim2.new(1, 8, 1, 8)
glowBorder.Position = UDim2.new(0, -4, 0, -4)
glowBorder.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
glowBorder.BackgroundTransparency = 0.6
glowBorder.BorderSizePixel = 0
glowBorder.Parent = centerFrame

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(0, 24)
glowCorner.Parent = glowBorder

local pulseTween = game:GetService("TweenService"):Create(glowBorder, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {BackgroundTransparency = 0.2})
pulseTween:Play()

local crownIcon = Instance.new("TextLabel")
crownIcon.Size = UDim2.new(1, 0, 0, 60)
crownIcon.Position = UDim2.new(0, 0, 0, 15)
crownIcon.BackgroundTransparency = 1
crownIcon.Text = "👑"
crownIcon.TextColor3 = Color3.fromRGB(255, 215, 0)
crownIcon.TextSize = 50
crownIcon.Font = Enum.Font.GothamBold
crownIcon.Parent = centerFrame

local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(1, 0, 0, 40)
keyTitle.Position = UDim2.new(0, 0, 0, 75)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "HDGB HONORED ONE"
keyTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
keyTitle.TextSize = 18
keyTitle.Font = Enum.Font.GothamBold
keyTitle.Parent = centerFrame

local keySubtitle = Instance.new("TextLabel")
keySubtitle.Size = UDim2.new(1, 0, 0, 25)
keySubtitle.Position = UDim2.new(0, 0, 0, 115)
keySubtitle.BackgroundTransparency = 1
keySubtitle.Text = "PREMIUM MOD MENU v12.2"
keySubtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
keySubtitle.TextSize = 11
keySubtitle.Font = Enum.Font.Gotham
keySubtitle.Parent = centerFrame

local ownerFrame = Instance.new("Frame")
ownerFrame.Size = UDim2.new(0.8, 0, 0, 35)
ownerFrame.Position = UDim2.new(0.1, 0, 0, 148)
ownerFrame.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
ownerFrame.BackgroundTransparency = 0.3
ownerFrame.Parent = centerFrame

local ownerCorner = Instance.new("UICorner")
ownerCorner.CornerRadius = UDim.new(0, 10)
ownerCorner.Parent = ownerFrame

local ownerIcon = Instance.new("TextLabel")
ownerIcon.Size = UDim2.new(0, 30, 1, 0)
ownerIcon.BackgroundTransparency = 1
ownerIcon.Text = "👑"
ownerIcon.TextColor3 = Color3.fromRGB(255, 215, 0)
ownerIcon.TextSize = 16
ownerIcon.Font = Enum.Font.Gotham
ownerIcon.Parent = ownerFrame

local ownerText = Instance.new("TextLabel")
ownerText.Size = UDim2.new(1, -35, 1, 0)
ownerText.Position = UDim2.new(0, 35, 0, 0)
ownerText.BackgroundTransparency = 1
ownerText.Text = "CREATED BY: " .. ownerName
ownerText.TextColor3 = Color3.fromRGB(255, 215, 0)
ownerText.TextSize = 11
ownerText.Font = Enum.Font.GothamBold
ownerText.TextXAlignment = Enum.TextXAlignment.Left
ownerText.Parent = ownerFrame

local discordFrame = Instance.new("Frame")
discordFrame.Size = UDim2.new(0.8, 0, 0, 35)
discordFrame.Position = UDim2.new(0.1, 0, 0, 190)
discordFrame.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
discordFrame.BackgroundTransparency = 0.2
discordFrame.Parent = centerFrame

local discordCorner = Instance.new("UICorner")
discordCorner.CornerRadius = UDim.new(0, 10)
discordCorner.Parent = discordFrame

local discordIcon = Instance.new("TextLabel")
discordIcon.Size = UDim2.new(0, 30, 1, 0)
discordIcon.BackgroundTransparency = 1
discordIcon.Text = "💬"
discordIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
discordIcon.TextSize = 16
discordIcon.Font = Enum.Font.Gotham
discordIcon.Parent = discordFrame

local discordText = Instance.new("TextLabel")
discordText.Size = UDim2.new(1, -35, 1, 0)
discordText.Position = UDim2.new(0, 35, 0, 0)
discordText.BackgroundTransparency = 1
discordText.Text = "JOIN DISCORD: " .. discordName
discordText.TextColor3 = Color3.fromRGB(255, 255, 255)
discordText.TextSize = 10
discordText.Font = Enum.Font.GothamBold
discordText.TextXAlignment = Enum.TextXAlignment.Left
discordText.Parent = discordFrame

local keyLabel = Instance.new("TextLabel")
keyLabel.Size = UDim2.new(1, 0, 0, 20)
keyLabel.Position = UDim2.new(0, 0, 0, 235)
keyLabel.BackgroundTransparency = 1
keyLabel.Text = "ENTER KEY FROM DISCORD:"
keyLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
keyLabel.TextSize = 10
keyLabel.Font = Enum.Font.Gotham
keyLabel.Parent = centerFrame

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(0.7, 0, 0, 45)
keyInput.Position = UDim2.new(0.15, 0, 0, 260)
keyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
keyInput.Text = ""
keyInput.PlaceholderText = "Enter Key Here..."
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.TextSize = 14
keyInput.Font = Enum.Font.Gotham
keyInput.Parent = centerFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 10)
inputCorner.Parent = keyInput

local unlockBtn = Instance.new("TextButton")
unlockBtn.Size = UDim2.new(0.7, 0, 0, 45)
unlockBtn.Position = UDim2.new(0.15, 0, 0, 315)
unlockBtn.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
unlockBtn.Text = "UNLOCK MENU"
unlockBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
unlockBtn.TextSize = 14
unlockBtn.Font = Enum.Font.GothamBold
unlockBtn.Parent = centerFrame

local unlockCorner = Instance.new("UICorner")
unlockCorner.CornerRadius = UDim.new(0, 10)
unlockCorner.Parent = unlockBtn

local errorMsg = Instance.new("TextLabel")
errorMsg.Size = UDim2.new(1, 0, 0, 25)
errorMsg.Position = UDim2.new(0, 0, 0, 370)
errorMsg.BackgroundTransparency = 1
errorMsg.Text = ""
errorMsg.TextColor3 = Color3.fromRGB(255, 100, 100)
errorMsg.TextSize = 10
errorMsg.Font = Enum.Font.GothamBold
errorMsg.Parent = centerFrame

-- ============ UNLOCK FUNCTION ============
local function unlockMenu()
    if keyInput.Text == correctKey then
        keyGui:Destroy()
        createMainMenu()
        print("=== HDGB HONORED ONE MENU UNLOCKED ===")
        print("Welcome, Honored One!")
    else
        errorMsg.Text = "INVALID KEY! Join Discord: " .. discordName .. " | Key: HDGB"
        keyInput.Text = ""
        local originalPos = centerFrame.Position
        for i = 1, 5 do
            centerFrame.Position = UDim2.new(0.5, -200 + math.random(-5,5), 0.5, -180 + math.random(-3,3))
            task.wait(0.02)
        end
        centerFrame.Position = originalPos
    end
end

unlockBtn.MouseButton1Click:Connect(unlockMenu)
keyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then unlockMenu() end
end)

game:GetService("UserInputService").InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.Return and keyGui and keyGui.Parent then
        unlockMenu()
    end
end)

-- ============ GLOBAL VARIABLES ============
local mods = {}
local favorites = {}
local currentCategory = "ALL"
local categories = {"ALL", "MOVEMENT", "COMBAT", "VISUAL", "WORLD", "FUN", "UTILITY", "UPDATE", "FAVORITES"}
local main = nil
local hoverName = nil
local modsContainer = nil
local searchBox = nil
local activeLabel = nil
local isMenuExpanded = false
local isAnimating = false

-- ============ SLIDER VALUES ============
local sliderValues = {
    flySpeed = 80, runSpeed = 80, dashPower = 150, jumpPower = 70, gravity = 50,
    slowMotionSpeed = 0.5, hoverSpeed = 5, bigHeadSize = 3, giantSize = 5, tinySize = 0.5,
    transparency = 0, trailLength = 0.5, platformSize = 5, platformDuration = 5, brightness = 1,
    bouncyPower = 25, spinSpeed = 10, rocketPower = 200, flingPower = 200, hitboxSize = 2,
    fovValue = 70, pushPower = 80, pullPower = 80, launchPower = 150, autoHealAmount = 5,
    magnetStrength = 50, lightningRange = 30, freezeRange = 30, healRange = 30, timeWarpSpeed = 2,
}

-- Connection variables
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
local freezeConnection = nil
local healAuraConnection = nil
local timeWarpConnection = nil
local shieldConnection = nil
local poisonAuraConnection = nil
local fireAuraConnection = nil
local lightningAuraConnection = nil
local vampirismConnection = nil

local originalWalkSpeed = 16
local teleportActive = false

-- Helper functions
local function getCharacter()
    return player.Character
end

local function getHumanoid()
    local char = getCharacter()
    return char and char:FindFirstChild("Humanoid")
end

local function getRootPart()
    local char = getCharacter()
    return char and char:FindFirstChild("HumanoidRootPart")
end

-- ============ ALL MODS (89 TOTAL) ============
local allMods = {
    -- MOVEMENT MODS (15)
    {id="fly", name="✈️ FLY", cat="MOVEMENT", desc="Press F to fly anywhere", key="F", type="toggle", hasSlider=true, sliderId="flySpeed", sliderMin=20, sliderMax=200},
    {id="superSpeed", name="⚡ SUPER SPEED", cat="MOVEMENT", desc="Run incredibly fast", key="G", type="toggle", hasSlider=true, sliderId="runSpeed", sliderMin=16, sliderMax=200},
    {id="noclip", name="🔮 NOCLIP", cat="MOVEMENT", desc="Walk through walls", key="N", type="toggle"},
    {id="infiniteJump", name="🦘 INFINITE JUMP", cat="MOVEMENT", desc="Jump unlimited times", type="toggle"},
    {id="megaJump", name="🚀 MEGA JUMP", cat="MOVEMENT", desc="Super high jumps", type="toggle", hasSlider=true, sliderId="jumpPower", sliderMin=50, sliderMax=200},
    {id="dash", name="💨 DASH", cat="MOVEMENT", desc="Press Q to dash forward", key="Q", type="toggle", hasSlider=true, sliderId="dashPower", sliderMin=50, sliderMax=300},
    {id="hover", name="🕊️ HOVER", cat="MOVEMENT", desc="Slow falling", type="toggle", hasSlider=true, sliderId="hoverSpeed", sliderMin=2, sliderMax=15},
    {id="teleport", name="📍 TELEPORT", cat="MOVEMENT", desc="Click to teleport", key="T", type="toggle"},
    {id="teleportToPlayer", name="👥 TELEPORT TO PLAYER", cat="MOVEMENT", desc="Teleport to anyone", type="click"},
    {id="gravityControl", name="🌌 GRAVITY CONTROL", cat="MOVEMENT", desc="Control gravity", type="toggle", hasSlider=true, sliderId="gravity", sliderMin=0, sliderMax=200},
    {id="slowMotion", name="🐌 SLOW MOTION", cat="MOVEMENT", desc="Slow down time", type="toggle", hasSlider=true, sliderId="slowMotionSpeed", sliderMin=0.1, sliderMax=1},
    {id="timeStop", name="⏸️ TIME STOP", cat="MOVEMENT", desc="Freeze other players", type="toggle"},
    {id="wallClimb", name="🧗 WALL CLIMB", cat="MOVEMENT", desc="Climb walls", type="toggle"},
    {id="doubleJump", name="🦘 DOUBLE JUMP", cat="MOVEMENT", desc="Jump twice", type="toggle"},
    {id="airDash", name="🌬️ AIR DASH", cat="MOVEMENT", desc="Dash in mid-air", type="toggle"},
    
    -- COMBAT MODS (15)
    {id="godMode", name="👑 GOD MODE", cat="COMBAT", desc="Cannot die", type="toggle"},
    {id="onePunch", name="👊 ONE PUNCH", cat="COMBAT", desc="Instant kill enemies", type="toggle"},
    {id="stealHealth", name="💀 STEAL HEALTH", cat="COMBAT", desc="Take enemy health", type="click", hasSlider=true, sliderId="autoHealAmount", sliderMin=5, sliderMax=50},
    {id="killAll", name="💀 KILL ALL", cat="COMBAT", desc="Kill all players", type="click"},
    {id="explodePlayers", name="💥 EXPLODE PLAYERS", cat="COMBAT", desc="Make enemies explode", type="click"},
    {id="pushPlayers", name="🫸 PUSH PLAYERS", cat="COMBAT", desc="Push enemies away", type="click", hasSlider=true, sliderId="pushPower", sliderMin=20, sliderMax=200},
    {id="pullPlayers", name="🫷 PULL PLAYERS", cat="COMBAT", desc="Pull enemies toward you", type="click", hasSlider=true, sliderId="pullPower", sliderMin=20, sliderMax=200},
    {id="launchPlayers", name="🚀 LAUNCH PLAYERS", cat="COMBAT", desc="Launch enemies in air", type="click", hasSlider=true, sliderId="launchPower", sliderMin=50, sliderMax=300},
    {id="freezePlayers", name="❄️ FREEZE PLAYERS", cat="COMBAT", desc="Stop enemies", type="toggle"},
    {id="autoHeal", name="❤️ AUTO HEAL", cat="COMBAT", desc="Automatically heal", type="toggle", hasSlider=true, sliderId="autoHealAmount", sliderMin=1, sliderMax=20},
    {id="lifesteal", name="🧛 LIFESTEAL", cat="COMBAT", desc="Gain health from damage", type="toggle"},
    {id="poisonAura", name="☠️ POISON AURA", cat="COMBAT", desc="Poison nearby enemies", type="toggle"},
    {id="fireAura", name="🔥 FIRE AURA", cat="COMBAT", desc="Burn nearby enemies", type="toggle"},
    {id="lightningAura", name="⚡ LIGHTNING AURA", cat="COMBAT", desc="Shock nearby enemies", type="toggle"},
    {id="vampirism", name="🧛 VAMPIRISM", cat="COMBAT", desc="Steal health from all nearby", type="toggle"},
    
    -- VISUAL MODS (15)
    {id="rainbowMode", name="🌈 RAINBOW MODE", cat="VISUAL", desc="Color changing character", key="R", type="toggle"},
    {id="invisible", name="👻 INVISIBLE", cat="VISUAL", desc="Become invisible", type="toggle", hasSlider=true, sliderId="transparency", sliderMin=0, sliderMax=1},
    {id="speedTrail", name="✨ SPEED TRAIL", cat="VISUAL", desc="Leave a trail behind", type="toggle", hasSlider=true, sliderId="trailLength", sliderMin=0.2, sliderMax=2},
    {id="esp", name="👁️ ESP", cat="VISUAL", desc="See players through walls", type="toggle"},
    {id="bigHead", name="🎯 BIG HEAD", cat="VISUAL", desc="Make your head huge", type="toggle", hasSlider=true, sliderId="bigHeadSize", sliderMin=2, sliderMax=6},
    {id="giantMode", name="🦍 GIANT MODE", cat="VISUAL", desc="Become a giant", type="toggle", hasSlider=true, sliderId="giantSize", sliderMin=3, sliderMax=10},
    {id="tinyMode", name="🐭 TINY MODE", cat="VISUAL", desc="Become tiny and fast", type="toggle", hasSlider=true, sliderId="tinySize", sliderMin=0.3, sliderMax=1},
    {id="glowEffect", name="✨ GLOW EFFECT", cat="VISUAL", desc="Your character glows", type="toggle"},
    {id="neonBody", name="💡 NEON BODY", cat="VISUAL", desc="Neon colored body", type="toggle"},
    {id="particleTrail", name="✨ PARTICLE TRAIL", cat="VISUAL", desc="Particles follow you", type="toggle"},
    {id="fireEffect", name="🔥 FIRE EFFECT", cat="VISUAL", desc="Fire surrounds you", type="toggle"},
    {id="iceEffect", name="❄️ ICE EFFECT", cat="VISUAL", desc="Ice surrounds you", type="toggle"},
    {id="goldenBody", name="🌟 GOLDEN BODY", cat="VISUAL", desc="Turn into gold", type="toggle"},
    {id="shadowMode", name="🌑 SHADOW MODE", cat="VISUAL", desc="Become a shadow", type="toggle"},
    {id="xray", name="🔍 X-RAY", cat="VISUAL", desc="See through walls", type="toggle"},
    
    -- WORLD MODS (12)
    {id="autoPlatform", name="🪄 AUTO PLATFORM", cat="WORLD", desc="Jump = platform", key="H", type="toggle", hasSlider=true, sliderId="platformSize", sliderMin=3, sliderMax=10},
    {id="lightMode", name="☀️ LIGHT MODE", cat="WORLD", desc="Bright world", type="toggle", hasSlider=true, sliderId="brightness", sliderMin=0.5, sliderMax=3},
    {id="nightMode", name="🌙 NIGHT MODE", cat="WORLD", desc="Dark world", type="toggle"},
    {id="rainbowSky", name="🌈 RAINBOW SKY", cat="WORLD", desc="Sky changes colors", type="toggle"},
    {id="thunderStorm", name="⛈️ THUNDER STORM", cat="WORLD", desc="Lightning strikes", type="toggle"},
    {id="snowWeather", name="❄️ SNOW WEATHER", cat="WORLD", desc="Make it snow", type="toggle"},
    {id="rainWeather", name="🌧️ RAIN WEATHER", cat="WORLD", desc="Make it rain", type="toggle"},
    {id="fogWeather", name="🌫️ FOG WEATHER", cat="WORLD", desc="Fog everywhere", type="toggle"},
    {id="antiAFK", name="💤 ANTI AFK", cat="WORLD", desc="Never get kicked", type="toggle"},
    {id="noFallDamage", name="🪶 NO FALL DAMAGE", cat="WORLD", desc="No fall damage", type="toggle"},
    {id="instantRespawn", name="⚡ INSTANT RESPAWN", cat="WORLD", desc="Respawn instantly", type="toggle"},
    {id="antiStun", name="🛡️ ANTI STUN", cat="WORLD", desc="Cannot be stunned", type="toggle"},
    
    -- FUN MODS (12)
    {id="bouncy", name="🏀 BOUNCY", cat="FUN", desc="Bounce when you hit ground", type="toggle", hasSlider=true, sliderId="bouncyPower", sliderMin=10, sliderMax=60},
    {id="slippery", name="🧼 SLIPPERY", cat="FUN", desc="Slide like on ice", type="toggle"},
    {id="magnet", name="🧲 MAGNET", cat="FUN", desc="Pull all players to you", type="toggle", hasSlider=true, sliderId="magnetStrength", sliderMin=20, sliderMax=100},
    {id="fireworks", name="🎆 FIREWORKS", cat="FUN", desc="Launch fireworks", type="toggle"},
    {id="confetti", name="🎉 CONFETTI", cat="FUN", desc="Confetti follows you", type="toggle"},
    {id="danceMode", name="💃 DANCE MODE", cat="FUN", desc="Your character dances", type="toggle"},
    {id="clone", name="📋 CLONE", cat="FUN", desc="Create a clone of yourself", type="click"},
    {id="timeRewind", name="⏪ TIME REWIND", cat="FUN", desc="Go back in time", type="click"},
    {id="spin", name="🔄 SPIN", cat="FUN", desc="Spin around fast", type="toggle", hasSlider=true, sliderId="spinSpeed", sliderMin=1, sliderMax=30},
    {id="rocket", name="🚀 ROCKET", cat="FUN", desc="Launch yourself upward", type="click", hasSlider=true, sliderId="rocketPower", sliderMin=50, sliderMax=500},
    {id="fling", name="🌀 FLING", cat="FUN", desc="Fling yourself", type="click", hasSlider=true, sliderId="flingPower", sliderMin=50, sliderMax=500},
    {id="ragdoll", name="🦴 RAGDOLL", cat="FUN", desc="Go limp", type="toggle"},
    
    -- UTILITY MODS (10)
    {id="heal", name="❤️ HEAL", cat="UTILITY", desc="Restore full health", type="click"},
    {id="biggerHitbox", name="🎯 BIGGER HITBOX", cat="UTILITY", desc="Easier to hit enemies", type="toggle", hasSlider=true, sliderId="hitboxSize", sliderMin=1, sliderMax=5},
    {id="autoClick", name="🖱️ AUTO CLICKER", cat="UTILITY", desc="Auto clicks", type="toggle"},
    {id="fov", name="👁️ FOV CHANGER", cat="UTILITY", desc="Change field of view", type="toggle", hasSlider=true, sliderId="fovValue", sliderMin=70, sliderMax=120},
    {id="mobileMode", name="📱 MOBILE MODE", cat="UTILITY", desc="Optimized for mobile", type="toggle"},
    {id="infiniteStamina", name="♾️ INFINITE STAMINA", cat="UTILITY", desc="Never get tired", type="toggle"},
    {id="noCooldown", name="⏩ NO COOLDOWN", cat="UTILITY", desc="Use abilities instantly", type="toggle"},
    {id="infiniteAmmo", name="♾️ INFINITE AMMO", cat="UTILITY", desc="Never run out of ammo", type="toggle"},
    {id="fastReload", name="⚡ FAST RELOAD", cat="UTILITY", desc="Reload weapons faster", type="toggle"},
    {id="noRecoil", name="🔫 NO RECOIL", cat="UTILITY", desc="No weapon recoil", type="toggle"},
    
    -- 10 NEW USEFUL MODS
    {id="timeWarp", name="⏩ TIME WARP", cat="MOVEMENT", desc="Speed up time for yourself", type="toggle", hasSlider=true, sliderId="timeWarpSpeed", sliderMin=1.1, sliderMax=3},
    {id="blackHole", name="🕳️ BLACK HOLE", cat="COMBAT", desc="Pull all players to center", type="click"},
    {id="lightningStrike", name="⚡ LIGHTNING STRIKE", cat="COMBAT", desc="Strike lightning on nearest enemy", type="click", hasSlider=true, sliderId="lightningRange", sliderMin=10, sliderMax=100},
    {id="freezeAuraNew", name="❄️ FREEZE AURA", cat="COMBAT", desc="Freeze all nearby players", type="toggle", hasSlider=true, sliderId="freezeRange", sliderMin=10, sliderMax=50},
    {id="healAura", name="💚 HEAL AURA", cat="UTILITY", desc="Heal nearby players", type="toggle", hasSlider=true, sliderId="healRange", sliderMin=10, sliderMax=50},
    {id="shield", name="🛡️ SHIELD", cat="COMBAT", desc="Protective shield blocks damage", type="toggle"},
    {id="adrenaline", name="💪 ADRENALINE", cat="MOVEMENT", desc="Temporary speed & strength boost", type="click"},
    {id="phaseShift", name="🌀 PHASE SHIFT", cat="MOVEMENT", desc="Become intangible for 5 seconds", type="click"},
    {id="gravityWell", name="🌌 GRAVITY WELL", cat="COMBAT", desc="Reverse gravity for enemies", type="click"},
    {id="cloak", name="🧥 CLOAK", cat="VISUAL", desc="Temporary invisibility", type="click"},
}

-- Initialize mods
for _, mod in ipairs(allMods) do
    mods[mod.id] = false
end

-- UPDATE TAB INFO
local updateInfo = {
    version = "v12.2",
    date = "April 2026",
    creator = ownerName,
    discord = discordName,
    key = "HDGB",
    totalMods = #allMods,
    newMods = {
        "🔑 KEY: HDGB - Get from Discord",
        "📜 FULL SCROLLING - Scroll ALL the way down now!",
        "🔧 ALL AURAS FIXED - Poison, Fire, Lightning, Vampirism work!",
        "🖱️ CLICK NAME TO OPEN MENU",
        "✨ 10 NEW USEFUL MODS ADDED!",
        "🎬 SMOOTH SLIDE DOWN ANIMATION",
        "🖱️ DRAG ANYWHERE TO MOVE MENU",
    },
    shortcuts = {
        "K - Expand/Collapse Menu",
        "F - Toggle Fly",
        "G - Toggle Super Speed",
        "H - Toggle Auto Platform",
        "T - Toggle Teleport",
        "R - Toggle Rainbow Mode",
        "Q - Dash",
        "N - Toggle Noclip",
    }
}

-- ============ CREATE SLIDER FUNCTION ============
local function createSlider(parent, labelText, minVal, maxVal, initialVal, onChange)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.92, 0, 0, 55)
    container.Position = UDim2.new(0.04, 0, 0, 0)
    container.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    container.BackgroundTransparency = 0.5
    container.Parent = parent
    
    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = UDim.new(0, 8)
    containerCorner.Parent = container
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.65, 0, 0, 22)
    label.Position = UDim2.new(0, 10, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = labelText .. ": " .. initialVal
    label.TextColor3 = Color3.fromRGB(255, 200, 100)
    label.TextSize = 9
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = container
    
    local sliderBg = Instance.new("Frame")
    sliderBg.Size = UDim2.new(0.6, 0, 0, 5)
    sliderBg.Position = UDim2.new(0.05, 0, 0, 38)
    sliderBg.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    sliderBg.BorderSizePixel = 0
    sliderBg.Parent = container
    
    local sliderBgCorner = Instance.new("UICorner")
    sliderBgCorner.CornerRadius = UDim.new(1, 0)
    sliderBgCorner.Parent = sliderBg
    
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new((initialVal - minVal) / (maxVal - minVal), 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
    fill.BorderSizePixel = 0
    fill.Parent = sliderBg
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Size = UDim2.new(0.2, 0, 1, 0)
    valueLabel.Position = UDim2.new(0.68, 0, 0, 0)
    valueLabel.BackgroundTransparency = 1
    valueLabel.Text = tostring(math.floor(initialVal))
    valueLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
    valueLabel.TextSize = 8
    valueLabel.Font = Enum.Font.GothamBold
    valueLabel.Parent = container
    
    local dragging = false
    
    sliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            local clickX = math.clamp(input.Position.X - sliderBg.AbsolutePosition.X, 0, sliderBg.AbsoluteSize.X)
            local percent = clickX / sliderBg.AbsoluteSize.X
            local val = minVal + (percent * (maxVal - minVal))
            fill.Size = UDim2.new(percent, 0, 1, 0)
            label.Text = labelText .. ": " .. math.floor(val)
            valueLabel.Text = tostring(math.floor(val))
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
            valueLabel.Text = tostring(math.floor(val))
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

-- ============ MOD EXECUTION FUNCTIONS ============
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
        if isOn then
            if humanoid then
                originalWalkSpeed = humanoid.WalkSpeed
                humanoid.WalkSpeed = sliderValues.runSpeed
            end
        else
            if humanoid then humanoid.WalkSpeed = originalWalkSpeed end
        end
    elseif mod.id == "noclip" then
        if isOn then
            if noclipConnection then noclipConnection:Disconnect() end
            noclipConnection = game:GetService("RunService").Stepped:Connect(function()
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
    elseif mod.id == "megaJump" then
        if humanoid then humanoid.JumpPower = isOn and sliderValues.jumpPower or 50 end
    elseif mod.id == "gravityControl" then
        workspace.Gravity = isOn and sliderValues.gravity * 2 or 98.1
    elseif mod.id == "slowMotion" then
        game:GetService("RunService"):SetRuntime(isOn and sliderValues.slowMotionSpeed or 1)
    elseif mod.id == "bigHead" then
        if character and character:FindFirstChild("Head") then
            character.Head.Size = isOn and Vector3.new(sliderValues.bigHeadSize, sliderValues.bigHeadSize, sliderValues.bigHeadSize) or Vector3.new(2,1,1)
        end
    elseif mod.id == "giantMode" then
        if rootPart then
            if mods.tinyMode then mods.tinyMode = false end
            rootPart.Size = isOn and Vector3.new(sliderValues.giantSize, sliderValues.giantSize, 3) or Vector3.new(2,2,1)
            if humanoid then humanoid.WalkSpeed = isOn and 30 or 16 end
        end
    elseif mod.id == "tinyMode" then
        if rootPart then
            if mods.giantMode then mods.giantMode = false end
            rootPart.Size = isOn and Vector3.new(sliderValues.tinySize, sliderValues.tinySize, 0.5) or Vector3.new(2,2,1)
            if humanoid then humanoid.WalkSpeed = isOn and 50 or 16 end
        end
    elseif mod.id == "invisible" then
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Transparency = isOn and sliderValues.transparency or 0
                end
            end
        end
    elseif mod.id == "bouncy" then
        if isOn then
            if bouncyConnection then bouncyConnection:Disconnect() end
            bouncyConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if mods.bouncy then
                    local root = getRootPart()
                    if root and root.Velocity.Y < -10 then
                        root.Velocity = Vector3.new(root.Velocity.X, sliderValues.bouncyPower, root.Velocity.Z)
                    end
                end
            end)
        else
            if bouncyConnection then bouncyConnection:Disconnect() end
        end
    elseif mod.id == "spin" then
        if isOn then
            if spinConnection then spinConnection:Disconnect() end
            spinConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if mods.spin then
                    local root = getRootPart()
                    if root then
                        root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(sliderValues.spinSpeed), 0)
                    end
                end
            end)
        else
            if spinConnection then spinConnection:Disconnect() end
        end
    elseif mod.id == "biggerHitbox" then
        if rootPart then
            rootPart.Size = isOn and Vector3.new(sliderValues.hitboxSize, sliderValues.hitboxSize, 2) or Vector3.new(2,2,1)
        end
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
                        if not platformFolder then
                            platformFolder = Instance.new("Folder")
                            platformFolder.Name = "Platforms"
                            platformFolder.Parent = workspace
                        end
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
            if hum then
                platformConnection = hum.Jumping:Connect(spawnPlat)
            end
        else
            if platformConnection then platformConnection:Disconnect() end
        end
    elseif mod.id == "autoHeal" then
        if isOn then
            if autoHealConnection then autoHealConnection:Disconnect() end
            autoHealConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if mods.autoHeal and humanoid and humanoid.Health < humanoid.MaxHealth then
                    humanoid.Health = math.min(humanoid.MaxHealth, humanoid.Health + sliderValues.autoHealAmount)
                end
            end)
        else
            if autoHealConnection then autoHealConnection:Disconnect() end
        end
    elseif mod.id == "godMode" then
        if isOn then
            if humanoid then
                humanoid.MaxHealth = math.huge
                humanoid.Health = math.huge
            end
        else
            if humanoid then
                humanoid.MaxHealth = 100
                humanoid.Health = 100
            end
        end
    elseif mod.id == "rainbowMode" then
        if isOn then
            local colors = {Color3.fromRGB(255,0,0), Color3.fromRGB(255,165,0), Color3.fromRGB(255,255,0), Color3.fromRGB(0,255,0), Color3.fromRGB(0,255,255), Color3.fromRGB(0,0,255), Color3.fromRGB(128,0,255)}
            local idx = 1
            if rainbowConnection then rainbowConnection:Disconnect() end
            rainbowConnection = game:GetService("RunService").RenderStepped:Connect(function()
                if mods.rainbowMode then
                    local currentChar = getCharacter()
                    if currentChar then
                        for _, part in pairs(currentChar:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.Color = colors[idx % #colors + 1]
                            end
                        end
                        idx = idx + 1
                        task.wait(0.1)
                    end
                end
            end)
        else
            if rainbowConnection then rainbowConnection:Disconnect() end
        end
    elseif mod.id == "teleport" then
        teleportActive = isOn
    elseif mod.id == "speedTrail" then
        local root = getRootPart()
        if isOn then
            if trailObject then trailObject:Destroy() end
            trailObject = Instance.new("Trail")
            trailObject.Lifetime = sliderValues.trailLength
            trailObject.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
            if root then trailObject.Parent = root end
        else
            if trailObject then trailObject:Destroy() end
        end
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
        else
            if espFolder then espFolder:Destroy() end
        end
    elseif mod.id == "hover" then
        if isOn then
            if hoverConnection then hoverConnection:Disconnect() end
            hoverConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if mods.hover then
                    local root = getRootPart()
                    if root and root.Velocity.Y < 0 then
                        root.Velocity = Vector3.new(root.Velocity.X, -sliderValues.hoverSpeed, root.Velocity.Z)
                    end
                end
            end)
        else
            if hoverConnection then hoverConnection:Disconnect() end
        end
    elseif mod.id == "freezePlayers" then
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player then
                local otherChar = otherPlayer.Character
                if otherChar and otherChar:FindFirstChild("Humanoid") then
                    otherChar.Humanoid.WalkSpeed = isOn and 0 or 16
                end
            end
        end
    elseif mod.id == "danceMode" then
        if isOn then
            local danceMoves = {0, 90, 180, 270}
            local idx = 1
            if danceConnection then danceConnection:Disconnect() end
            danceConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if mods.danceMode then
                    local root = getRootPart()
                    if root then
                        root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(danceMoves[idx % #danceMoves + 1]), 0)
                        idx = idx + 1
                        task.wait(0.2)
                    end
                end
            end)
        else
            if danceConnection then danceConnection:Disconnect() end
        end
    elseif mod.id == "fireworks" then
        if isOn then
            if fireworksConnection then fireworksConnection:Disconnect() end
            fireworksConnection = game:GetService("RunService").Heartbeat:Connect(function()
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
        else
            if fireworksConnection then fireworksConnection:Disconnect() end
        end
    elseif mod.id == "confetti" then
        if isOn then
            if confettiConnection then confettiConnection:Disconnect() end
            confettiConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if mods.confetti then
                    local root = getRootPart()
                    if root then
                        for i = 1, 3 do
                            local conf = Instance.new("Part")
                            conf.Size = Vector3.new(0.2,0.2,0.2)
                            conf.Position = root.Position + Vector3.new(math.random(-3,3), math.random(0,5), math.random(-3,3))
                            conf.Anchored = true
                            conf.BrickColor = BrickColor.random()
                            conf.Parent = workspace
                            game:GetService("Debris"):AddItem(conf, 2)
                        end
                    end
                end
            end)
        else
            if confettiConnection then confettiConnection:Disconnect() end
        end
    elseif mod.id == "magnet" then
        if isOn then
            if magnetConnection then magnetConnection:Disconnect() end
            magnetConnection = game:GetService("RunService").Heartbeat:Connect(function()
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
        else
            if magnetConnection then magnetConnection:Disconnect() end
        end
    elseif mod.id == "wallClimb" then
        if isOn then
            local raycastParams = RaycastParams.new()
            raycastParams.FilterDescendantsInstances = {character}
            game:GetService("RunService").Heartbeat:Connect(function()
                if mods.wallClimb and rootPart then
                    local ray = workspace:Raycast(rootPart.Position, rootPart.CFrame.LookVector * 3, raycastParams)
                    if ray and ray.Normal.Y < 0.5 then
                        rootPart.Velocity = Vector3.new(0, 20, 0)
                    end
                end
            end)
        end
    elseif mod.id == "poisonAura" then
        if isOn then
            if poisonAuraConnection then poisonAuraConnection:Disconnect() end
            poisonAuraConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if mods.poisonAura then
                    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                        if otherPlayer ~= player then
                            local otherChar = otherPlayer.Character
                            if otherChar and otherChar:FindFirstChild("Humanoid") then
                                otherChar.Humanoid.Health = math.max(0, otherChar.Humanoid.Health - 2)
                            end
                        end
                    end
                end
            end)
        else
            if poisonAuraConnection then poisonAuraConnection:Disconnect() end
        end
    elseif mod.id == "fireAura" then
        if isOn then
            if fireAuraConnection then fireAuraConnection:Disconnect() end
            fireAuraConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if mods.fireAura then
                    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                        if otherPlayer ~= player then
                            local otherChar = otherPlayer.Character
                            if otherChar and otherChar:FindFirstChild("Humanoid") then
                                otherChar.Humanoid.Health = math.max(0, otherChar.Humanoid.Health - 1)
                            end
                        end
                    end
                end
            end)
        else
            if fireAuraConnection then fireAuraConnection:Disconnect() end
        end
    elseif mod.id == "lightningAura" then
        if isOn then
            if lightningAuraConnection then lightningAuraConnection:Disconnect() end
            lightningAuraConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if mods.lightningAura then
                    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                        if otherPlayer ~= player then
                            local otherChar = otherPlayer.Character
                            if otherChar and otherChar:FindFirstChild("Humanoid") then
                                otherChar.Humanoid.Health = math.max(0, otherChar.Humanoid.Health - 3)
                            end
                        end
                    end
                end
            end)
        else
            if lightningAuraConnection then lightningAuraConnection:Disconnect() end
        end
    elseif mod.id == "vampirism" then
        if isOn then
            if vampirismConnection then vampirismConnection:Disconnect() end
            vampirismConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if mods.vampirism and humanoid then
                    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                        if otherPlayer ~= player then
                            local otherChar = otherPlayer.Character
                            if otherChar and otherChar:FindFirstChild("Humanoid") then
                                local steal = 5
                                otherChar.Humanoid.Health = math.max(0, otherChar.Humanoid.Health - steal)
                                humanoid.Health = math.min(humanoid.MaxHealth, humanoid.Health + steal)
                            end
                        end
                    end
                end
            end)
        else
            if vampirismConnection then vampirismConnection:Disconnect() end
        end
    elseif mod.id == "lifesteal" then
        if isOn then
            local lifestealConn
            lifestealConn = game:GetService("RunService").Heartbeat:Connect(function()
                if mods.lifesteal and humanoid then
                    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                        if otherPlayer ~= player then
                            local otherChar = otherPlayer.Character
                            if otherChar and otherChar:FindFirstChild("Humanoid") then
                                local steal = 5
                                otherChar.Humanoid.Health = math.max(0, otherChar.Humanoid.Health - steal)
                                humanoid.Health = math.min(humanoid.MaxHealth, humanoid.Health + steal)
                            end
                        end
                    end
                end
            end)
        end
    elseif mod.id == "timeWarp" then
        if isOn then
            if timeWarpConnection then timeWarpConnection:Disconnect() end
            timeWarpConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if mods.timeWarp then
                    game:GetService("RunService"):SetRuntime(sliderValues.timeWarpSpeed)
                end
            end)
        else
            if timeWarpConnection then timeWarpConnection:Disconnect() end
            game:GetService("RunService"):SetRuntime(1)
        end
    elseif mod.id == "freezeAuraNew" then
        if isOn then
            if freezeConnection then freezeConnection:Disconnect() end
            freezeConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if mods.freezeAuraNew and rootPart then
                    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                        if otherPlayer ~= player then
                            local otherChar = otherPlayer.Character
                            if otherChar and otherChar:FindFirstChild("HumanoidRootPart") then
                                local dist = (rootPart.Position - otherChar.HumanoidRootPart.Position).Magnitude
                                if dist < sliderValues.freezeRange then
                                    otherChar.Humanoid.WalkSpeed = 0
                                else
                                    otherChar.Humanoid.WalkSpeed = 16
                                end
                            end
                        end
                    end
                end
            end)
        else
            if freezeConnection then freezeConnection:Disconnect() end
            for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                if otherPlayer ~= player then
                    local otherChar = otherPlayer.Character
                    if otherChar and otherChar:FindFirstChild("Humanoid") then
                        otherChar.Humanoid.WalkSpeed = 16
                    end
                end
            end
        end
    elseif mod.id == "healAura" then
        if isOn then
            if healAuraConnection then healAuraConnection:Disconnect() end
            healAuraConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if mods.healAura then
                    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                        if otherPlayer ~= player then
                            local otherChar = otherPlayer.Character
                            if otherChar and otherChar:FindFirstChild("Humanoid") and rootPart then
                                local dist = (rootPart.Position - otherChar.HumanoidRootPart.Position).Magnitude
                                if dist < sliderValues.healRange then
                                    otherChar.Humanoid.Health = math.min(otherChar.Humanoid.MaxHealth, otherChar.Humanoid.Health + 1)
                                end
                            end
                        end
                    end
                    if humanoid then
                        humanoid.Health = math.min(humanoid.MaxHealth, humanoid.Health + 2)
                    end
                end
            end)
        else
            if healAuraConnection then healAuraConnection:Disconnect() end
        end
    elseif mod.id == "shield" then
        if isOn then
            if shieldConnection then shieldConnection:Disconnect() end
            shieldConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if mods.shield and humanoid then
                    humanoid.MaxHealth = math.huge
                    humanoid.Health = math.huge
                elseif not mods.shield and humanoid then
                    humanoid.MaxHealth = 100
                end
            end)
        else
            if shieldConnection then shieldConnection:Disconnect() end
            if humanoid then humanoid.MaxHealth = 100 end
        end
    end
end

-- ============ CLICK MODS ============
local function executeClickMod(mod)
    local rootPart = getRootPart()
    local humanoid = getHumanoid()
    local character = getCharacter()
    
    if mod.id == "heal" then
        if humanoid then humanoid.Health = humanoid.MaxHealth end
    elseif mod.id == "killAll" then
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player then
                local otherChar = otherPlayer.Character
                if otherChar and otherChar:FindFirstChild("Humanoid") then
                    otherChar.Humanoid.Health = 0
                end
            end
        end
    elseif mod.id == "stealHealth" then
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player then
                local otherChar = otherPlayer.Character
                if otherChar and otherChar:FindFirstChild("Humanoid") and humanoid then
                    otherChar.Humanoid.Health = math.max(0, otherChar.Humanoid.Health - sliderValues.autoHealAmount)
                    humanoid.Health = math.min(humanoid.MaxHealth, humanoid.Health + sliderValues.autoHealAmount)
                end
            end
        end
    elseif mod.id == "explodePlayers" then
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player then
                local otherChar = otherPlayer.Character
                if otherChar and otherChar:FindFirstChild("HumanoidRootPart") then
                    local explosion = Instance.new("Explosion")
                    explosion.Position = otherChar.HumanoidRootPart.Position
                    explosion.Parent = workspace
                end
            end
        end
    elseif mod.id == "pushPlayers" then
        if not rootPart then return end
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player then
                local otherChar = otherPlayer.Character
                if otherChar and otherChar:FindFirstChild("HumanoidRootPart") then
                    local dir = (otherChar.HumanoidRootPart.Position - rootPart.Position).Unit
                    otherChar.HumanoidRootPart.Velocity = dir * sliderValues.pushPower
                end
            end
        end
    elseif mod.id == "pullPlayers" then
        if not rootPart then return end
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player then
                local otherChar = otherPlayer.Character
                if otherChar and otherChar:FindFirstChild("HumanoidRootPart") then
                    local dir = (rootPart.Position - otherChar.HumanoidRootPart.Position).Unit
                    otherChar.HumanoidRootPart.Velocity = dir * sliderValues.pullPower
                end
            end
        end
    elseif mod.id == "launchPlayers" then
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player then
                local otherChar = otherPlayer.Character
                if otherChar and otherChar:FindFirstChild("HumanoidRootPart") then
                    otherChar.HumanoidRootPart.Velocity = Vector3.new(0, sliderValues.launchPower, 0)
                end
            end
        end
    elseif mod.id == "teleportToPlayer" then
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player then
                local otherChar = otherPlayer.Character
                if otherChar and otherChar:FindFirstChild("HumanoidRootPart") and rootPart then
                    rootPart.CFrame = otherChar.HumanoidRootPart.CFrame
                    break
                end
            end
        end
    elseif mod.id == "clone" then
        local currentChar = getCharacter()
        if currentChar then
            local clone = currentChar:Clone()
            clone.Parent = workspace
            if rootPart then
                clone.HumanoidRootPart.CFrame = rootPart.CFrame + Vector3.new(5,0,0)
                clone.HumanoidRootPart.Anchored = true
            end
            game:GetService("Debris"):AddItem(clone, 10)
        end
    elseif mod.id == "timeRewind" then
        local positions = {}
        for i = 1, 30 do
            local root = getRootPart()
            if root then table.insert(positions, root.Position) end
            task.wait(0.1)
        end
        if #positions > 0 and rootPart then
            rootPart.CFrame = CFrame.new(positions[1])
        end
    elseif mod.id == "rocket" then
        if rootPart then rootPart.Velocity = Vector3.new(0, sliderValues.rocketPower, 0) end
    elseif mod.id == "fling" then
        if rootPart then rootPart.Velocity = Vector3.new(math.random(-sliderValues.flingPower, sliderValues.flingPower), sliderValues.flingPower, math.random(-sliderValues.flingPower, sliderValues.flingPower)) end
    elseif mod.id == "ragdoll" then
        if humanoid then
            humanoid:BreakJoints()
        end
    elseif mod.id == "blackHole" then
        if not rootPart then return end
        local center = rootPart.Position
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player then
                local otherChar = otherPlayer.Character
                if otherChar and otherChar:FindFirstChild("HumanoidRootPart") then
                    local dir = (center - otherChar.HumanoidRootPart.Position).Unit
                    otherChar.HumanoidRootPart.Velocity = dir * 150
                end
            end
        end
    elseif mod.id == "lightningStrike" then
        local nearest = nil
        local nearestDist = sliderValues.lightningRange
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player then
                local otherChar = otherPlayer.Character
                if otherChar and otherChar:FindFirstChild("HumanoidRootPart") and rootPart then
                    local dist = (rootPart.Position - otherChar.HumanoidRootPart.Position).Magnitude
                    if dist < nearestDist then
                        nearestDist = dist
                        nearest = otherChar
                    end
                end
            end
        end
        if nearest and nearest:FindFirstChild("HumanoidRootPart") then
            local lightning = Instance.new("Part")
            lightning.Size = Vector3.new(1, 10, 1)
            lightning.Position = nearest.HumanoidRootPart.Position
            lightning.Anchored = true
            lightning.BrickColor = BrickColor.new("Bright yellow")
            lightning.Material = Enum.Material.Neon
            lightning.Parent = workspace
            game:GetService("Debris"):AddItem(lightning, 0.5)
            if nearest:FindFirstChild("Humanoid") then
                nearest.Humanoid.Health = nearest.Humanoid.Health - 30
            end
        end
    elseif mod.id == "adrenaline" then
        if humanoid then
            local originalSpeed = humanoid.WalkSpeed
            local originalJump = humanoid.JumpPower
            humanoid.WalkSpeed = humanoid.WalkSpeed * 2
            humanoid.JumpPower = humanoid.JumpPower * 1.5
            task.wait(10)
            humanoid.WalkSpeed = originalSpeed
            humanoid.JumpPower = originalJump
        end
    elseif mod.id == "phaseShift" then
        if character then
            local originalCollide = {}
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    table.insert(originalCollide, {part, part.CanCollide})
                    part.CanCollide = false
                end
            end
            task.wait(5)
            for _, data in pairs(originalCollide) do
                data[1].CanCollide = data[2]
            end
        end
    elseif mod.id == "gravityWell" then
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player then
                local otherChar = otherPlayer.Character
                if otherChar and otherChar:FindFirstChild("HumanoidRootPart") then
                    otherChar.HumanoidRootPart.Velocity = Vector3.new(0, 100, 0)
                end
            end
        end
    elseif mod.id == "cloak" then
        if character then
            local originalTransparency = {}
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    table.insert(originalTransparency, {part, part.Transparency})
                    part.Transparency = 1
                end
            end
            task.wait(5)
            for _, data in pairs(originalTransparency) do
                data[1].Transparency = data[2]
            end
        end
    end
end

-- ============ CREATE MAIN MENU ============
function createMainMenu()
    local gui = Instance.new("ScreenGui")
    gui.Name = "HonoredOnePremium"
    gui.Parent = player.PlayerGui
    gui.ResetOnSpawn = false

    local menuWidth = 650
    local menuHeight = 700
    
    -- HOVER NAME (Shows when menu is closed)
    hoverName = Instance.new("TextButton")
    hoverName.Size = UDim2.new(0, 200, 0, 45)
    hoverName.Position = UDim2.new(0.02, 0, 0.02, 0)
    hoverName.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
    hoverName.BackgroundTransparency = 0.1
    hoverName.BorderSizePixel = 2
    hoverName.BorderColor3 = Color3.fromRGB(255, 215, 0)
    hoverName.Text = "👑 HDGB HONORED ONE"
    hoverName.TextColor3 = Color3.fromRGB(255, 255, 255)
    hoverName.TextSize = 12
    hoverName.Font = Enum.Font.GothamBold
    hoverName.Visible = true
    hoverName.Parent = gui
    
    local hoverCorner = Instance.new("UICorner")
    hoverCorner.CornerRadius = UDim.new(0, 12)
    hoverCorner.Parent = hoverName
    
    -- Hover effects
    hoverName.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(hoverName, TweenInfo.new(0.2), {BackgroundTransparency = 0, Size = UDim2.new(0, 210, 0, 50)}):Play()
    end)
    hoverName.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(hoverName, TweenInfo.new(0.2), {BackgroundTransparency = 0.1, Size = UDim2.new(0, 200, 0, 45)}):Play()
    end)
    
    -- Click to expand menu
    hoverName.MouseButton1Click:Connect(function()
        expandMenu()
    end)
    
    -- Draggable hover name
    local dragStart = nil
    local dragFrameStart = nil
    local dragging = false
    
    hoverName.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragStart = input.Position
            dragFrameStart = hoverName.Position
            dragging = true
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            local newX = math.clamp(dragFrameStart.X.Offset + delta.X, 0, 800)
            local newY = math.clamp(dragFrameStart.Y.Offset + delta.Y, 0, 500)
            hoverName.Position = UDim2.new(dragFrameStart.X.Scale, newX, dragFrameStart.Y.Scale, newY)
        end
    end)
    
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    -- MAIN MENU
    main = Instance.new("Frame")
    main.Size = UDim2.new(0, menuWidth, 0, 0)
    main.Position = UDim2.new(0.5, -menuWidth/2, 0.05, 0)
    main.BackgroundColor3 = Color3.fromRGB(8, 8, 18)
    main.BackgroundTransparency = 0.05
    main.ClipsDescendants = true
    main.AnchorPoint = Vector2.new(0.5, 0)
    main.Parent = gui
    
    -- Make menu draggable
    local menuDragStart = nil
    local menuDragFrameStart = nil
    local menuDragging = false
    
    main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            menuDragStart = input.Position
            menuDragFrameStart = main.Position
            menuDragging = true
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if menuDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - menuDragStart
            local newX = menuDragFrameStart.X.Offset + delta.X
            local newY = menuDragFrameStart.Y.Offset + delta.Y
            main.Position = UDim2.new(menuDragFrameStart.X.Scale, newX, menuDragFrameStart.Y.Scale, newY)
        end
    end)
    
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            menuDragging = false
        end
    end)
    
    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 20)
    mainCorner.Parent = main
    
    -- Title Bar
    local mainTitleBar = Instance.new("Frame")
    mainTitleBar.Size = UDim2.new(1, 0, 0, 60)
    mainTitleBar.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
    mainTitleBar.Parent = main
    mainTitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            menuDragStart = input.Position
            menuDragFrameStart = main.Position
            menuDragging = true
        end
    end)
    
    local mainTitleCorner = Instance.new("UICorner")
    mainTitleCorner.CornerRadius = UDim.new(0, 20)
    mainTitleCorner.Parent = mainTitleBar
    
    local mainTitleIcon = Instance.new("TextLabel")
    mainTitleIcon.Size = UDim2.new(0, 45, 1, 0)
    mainTitleIcon.Position = UDim2.new(0, 15, 0, 0)
    mainTitleIcon.BackgroundTransparency = 1
    mainTitleIcon.Text = "👑"
    mainTitleIcon.TextColor3 = Color3.fromRGB(255, 215, 0)
    mainTitleIcon.TextSize = 30
    mainTitleIcon.Font = Enum.Font.GothamBold
    mainTitleIcon.Parent = mainTitleBar
    
    local mainTitleText = Instance.new("TextLabel")
    mainTitleText.Size = UDim2.new(0, 350, 0, 30)
    mainTitleText.Position = UDim2.new(0, 65, 0, 8)
    mainTitleText.BackgroundTransparency = 1
    mainTitleText.Text = "HDGB HONORED ONE v12.2"
    mainTitleText.TextColor3 = Color3.fromRGB(255, 215, 0)
    mainTitleText.TextSize = 17
    mainTitleText.Font = Enum.Font.GothamBold
    mainTitleText.TextXAlignment = Enum.TextXAlignment.Left
    mainTitleText.Parent = mainTitleBar
    
    local mainSubText = Instance.new("TextLabel")
    mainSubText.Size = UDim2.new(0, 350, 0, 18)
    mainSubText.Position = UDim2.new(0, 65, 0, 38)
    mainSubText.BackgroundTransparency = 1
    mainSubText.Text = "Premium Edition | " .. #allMods .. " Mods | FULL SCROLLING"
    mainSubText.TextColor3 = Color3.fromRGB(200, 200, 200)
    mainSubText.TextSize = 9
    mainSubText.Font = Enum.Font.Gotham
    mainSubText.TextXAlignment = Enum.TextXAlignment.Left
    mainSubText.Parent = mainTitleBar
    
    -- Collapse button
    local collapseBtn = Instance.new("TextButton")
    collapseBtn.Size = UDim2.new(0, 35, 0, 35)
    collapseBtn.Position = UDim2.new(1, -45, 0, 12)
    collapseBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    collapseBtn.Text = "▼"
    collapseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    collapseBtn.TextSize = 14
    collapseBtn.Font = Enum.Font.GothamBold
    collapseBtn.Parent = mainTitleBar
    local collapseCorner = Instance.new("UICorner")
    collapseCorner.CornerRadius = UDim.new(0, 10)
    collapseCorner.Parent = collapseBtn
    
    -- Search Bar
    local searchFrame = Instance.new("Frame")
    searchFrame.Size = UDim2.new(0.96, 0, 0, 38)
    searchFrame.Position = UDim2.new(0.02, 0, 0, 68)
    searchFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    searchFrame.BackgroundTransparency = 0.5
    searchFrame.Parent = main
    local searchCorner = Instance.new("UICorner")
    searchCorner.CornerRadius = UDim.new(0, 10)
    searchCorner.Parent = searchFrame
    
    local searchIcon = Instance.new("TextLabel")
    searchIcon.Size = UDim2.new(0, 40, 1, 0)
    searchIcon.BackgroundTransparency = 1
    searchIcon.Text = "🔍"
    searchIcon.TextColor3 = Color3.fromRGB(150, 150, 200)
    searchIcon.TextSize = 16
    searchIcon.Font = Enum.Font.Gotham
    searchIcon.Parent = searchFrame
    
    searchBox = Instance.new("TextBox")
    searchBox.Size = UDim2.new(1, -45, 1, 0)
    searchBox.Position = UDim2.new(0, 45, 0, 0)
    searchBox.BackgroundTransparency = 1
    searchBox.PlaceholderText = "Search " .. #allMods .. " mods..."
    searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    searchBox.TextSize = 11
    searchBox.Font = Enum.Font.Gotham
    searchBox.ClearTextOnFocus = false
    searchBox.Parent = searchFrame
    
    -- Category Tabs
    local catBar = Instance.new("Frame")
    catBar.Size = UDim2.new(0.96, 0, 0, 32)
    catBar.Position = UDim2.new(0.02, 0, 0, 112)
    catBar.BackgroundTransparency = 1
    catBar.Parent = main
    
    local catLayout = Instance.new("UIListLayout")
    catLayout.FillDirection = Enum.FillDirection.Horizontal
    catLayout.Padding = UDim.new(0, 4)
    catLayout.Parent = catBar
    
    local catButtons = {}
    for i, cat in ipairs(categories) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 60, 1, 0)
        btn.BackgroundColor3 = (cat == "ALL") and Color3.fromRGB(139, 0, 0) or Color3.fromRGB(45, 45, 60)
        btn.Text = cat
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 8
        btn.Font = Enum.Font.GothamBold
        btn.Parent = catBar
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 8)
        btnCorner.Parent = btn
        catButtons[cat] = btn
        btn.MouseButton1Click:Connect(function()
            currentCategory = cat
            for _, b in pairs(catButtons) do b.BackgroundColor3 = Color3.fromRGB(45, 45, 60) end
            btn.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
            refreshMods()
        end)
    end
    
    -- MODS CONTAINER - FIXED SCROLLING
    modsContainer = Instance.new("ScrollingFrame")
    modsContainer.Size = UDim2.new(0.96, 0, 0.68, 0)
    modsContainer.Position = UDim2.new(0.02, 0, 0.23, 0)
    modsContainer.BackgroundTransparency = 1
    modsContainer.ScrollBarThickness = 8
    modsContainer.CanvasSize = UDim2.new(0, 0, 0, 5000) -- Large canvas for all mods
    modsContainer.Parent = main
    
    local modsLayout = Instance.new("UIListLayout")
    modsLayout.Padding = UDim.new(0, 5)
    modsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    modsLayout.Parent = modsContainer
    
    -- Update canvas size when content changes
    local function updateCanvasSize()
        local childrenHeight = 0
        for _, child in pairs(modsContainer:GetChildren()) do
            if child:IsA("TextButton") or child:IsA("Frame") then
                childrenHeight = childrenHeight + child.Size.Y.Offset + 5
            end
        end
        modsContainer.CanvasSize = UDim2.new(0, 0, 0, math.max(childrenHeight + 200, 800))
    end
    
    -- Stats Bar
    local statsBar = Instance.new("Frame")
    statsBar.Size = UDim2.new(0.96, 0, 0, 35)
    statsBar.Position = UDim2.new(0.02, 0, 0.89, 0)
    statsBar.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    statsBar.BackgroundTransparency = 0.5
    statsBar.Parent = main
    local statsCorner = Instance.new("UICorner")
    statsCorner.CornerRadius = UDim.new(0, 10)
    statsCorner.Parent = statsBar
    
    local modCountLabel = Instance.new("TextLabel")
    modCountLabel.Size = UDim2.new(0.4, 0, 1, 0)
    modCountLabel.BackgroundTransparency = 1
    modCountLabel.Text = "📊 " .. #allMods .. " Total Mods"
    modCountLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    modCountLabel.TextSize = 10
    modCountLabel.Font = Enum.Font.Gotham
    modCountLabel.Parent = statsBar
    
    activeLabel = Instance.new("TextLabel")
    activeLabel.Size = UDim2.new(0.3, 0, 1, 0)
    activeLabel.Position = UDim2.new(0.4, 0, 0, 0)
    activeLabel.BackgroundTransparency = 1
    activeLabel.Text = "✅ Active: 0"
    activeLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    activeLabel.TextSize = 10
    activeLabel.Font = Enum.Font.Gotham
    activeLabel.Parent = statsBar
    
    local sliderCountLabel = Instance.new("TextLabel")
    sliderCountLabel.Size = UDim2.new(0.3, 0, 1, 0)
    sliderCountLabel.Position = UDim2.new(0.7, 0, 0, 0)
    sliderCountLabel.BackgroundTransparency = 1
    sliderCountLabel.Text = "🎚️ 25+ Sliders"
    sliderCountLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
    sliderCountLabel.TextSize = 9
    sliderCountLabel.Font = Enum.Font.Gotham
    sliderCountLabel.Parent = statsBar
    
    -- Credit label
    local creditLabel = Instance.new("TextLabel")
    creditLabel.Size = UDim2.new(1, 0, 0, 20)
    creditLabel.Position = UDim2.new(0, 0, 0, menuHeight - 20)
    creditLabel.BackgroundTransparency = 1
    creditLabel.Text = "Created by " .. ownerName .. " | The Honored One | 89 TOTAL MODS | SCROLL ALL THE WAY DOWN"
    creditLabel.TextColor3 = Color3.fromRGB(100, 100, 120)
    creditLabel.TextSize = 8
    creditLabel.Font = Enum.Font.Gotham
    creditLabel.Parent = main
    
    -- ============ CREATE MOD BUTTON ============
    function createModButton(parent, mod)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.96, 0, 0, 44)
        btn.Position = UDim2.new(0.02, 0, 0, 0)
        btn.BackgroundColor3 = mods[mod.id] and Color3.fromRGB(80, 140, 80) or Color3.fromRGB(55, 55, 75)
        btn.Text = (mods[mod.id] and "🟢 " or "🔴 ") .. mod.name .. (mod.key and (" [" .. mod.key .. "]") or "")
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextSize = 10
        btn.Font = Enum.Font.GothamBold
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.Parent = parent
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 8)
        btnCorner.Parent = btn
        
        btn.MouseEnter:Connect(function()
            if btn.BackgroundColor3 ~= Color3.fromRGB(80, 140, 80) then
                btn.BackgroundColor3 = Color3.fromRGB(75, 75, 95)
            end
        end)
        btn.MouseLeave:Connect(function()
            if btn.BackgroundColor3 ~= Color3.fromRGB(80, 140, 80) then
                btn.BackgroundColor3 = Color3.fromRGB(55, 55, 75)
            end
        end)
        
        local desc = Instance.new("TextLabel")
        desc.Size = UDim2.new(0.5, 0, 0, 15)
        desc.Position = UDim2.new(0, 15, 0, 28)
        desc.BackgroundTransparency = 1
        desc.Text = mod.desc
        desc.TextColor3 = Color3.fromRGB(140, 140, 170)
        desc.TextSize = 8
        desc.Font = Enum.Font.Gotham
        desc.TextXAlignment = Enum.TextXAlignment.Left
        desc.Parent = btn
        
        -- Add slider
        if mod.hasSlider then
            local sliderContainer = Instance.new("Frame")
            sliderContainer.Size = UDim2.new(0.4, 0, 0, 20)
            sliderContainer.Position = UDim2.new(0.55, 0, 0, 24)
            sliderContainer.BackgroundTransparency = 1
            sliderContainer.Parent = btn
            
            local sliderBg = Instance.new("Frame")
            sliderBg.Size = UDim2.new(0.7, 0, 0, 4)
            sliderBg.Position = UDim2.new(0, 0, 0, 8)
            sliderBg.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
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
            valueLabel.Size = UDim2.new(0.25, 0, 1, 0)
            valueLabel.Position = UDim2.new(0.72, 0, 0, 0)
            valueLabel.BackgroundTransparency = 1
            valueLabel.Text = tostring(math.floor(sliderValues[mod.sliderId]))
            valueLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
            valueLabel.TextSize = 7
            valueLabel.Font = Enum.Font.GothamBold
            valueLabel.Parent = sliderContainer
            
            local dragging = false
            sliderBg.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                    local clickX = math.clamp(input.Position.X - sliderBg.AbsolutePosition.X, 0, sliderBg.AbsoluteSize.X)
                    local perc = clickX / sliderBg.AbsoluteSize.X
                    local val = mod.sliderMin + (perc * (mod.sliderMax - mod.sliderMin))
                    sliderValues[mod.sliderId] = val
                    fill.Size = UDim2.new(perc, 0, 1, 0)
                    valueLabel.Text = tostring(math.floor(val))
                    if mods[mod.id] then executeMod(mod, true) end
                end
            end)
            game:GetService("UserInputService").InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local clickX = math.clamp(input.Position.X - sliderBg.AbsolutePosition.X, 0, sliderBg.AbsoluteSize.X)
                    local perc = clickX / sliderBg.AbsoluteSize.X
                    local val = mod.sliderMin + (perc * (mod.sliderMax - mod.sliderMin))
                    sliderValues[mod.sliderId] = val
                    fill.Size = UDim2.new(perc, 0, 1, 0)
                    valueLabel.Text = tostring(math.floor(val))
                    if mods[mod.id] then executeMod(mod, true) end
                end
            end)
            game:GetService("UserInputService").InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
            end)
        end
        
        -- Favorite star
        local starBtn = Instance.new("TextButton")
        starBtn.Size = UDim2.new(0, 25, 0, 25)
        starBtn.Position = UDim2.new(1, -30, 0, 10)
        starBtn.BackgroundTransparency = 1
        starBtn.Text = favorites[mod.id] and "⭐" or "☆"
        starBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
        starBtn.TextSize = 14
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
            if currentCategory == "FAVORITES" then refreshMods() end
        end)
        
        btn.MouseButton1Click:Connect(function()
            local originalColor = btn.BackgroundColor3
            btn.BackgroundColor3 = Color3.fromRGB(255, 255, 200)
            task.wait(0.05)
            btn.BackgroundColor3 = originalColor
            if mod.type == "toggle" then
                mods[mod.id] = not mods[mod.id]
                btn.BackgroundColor3 = mods[mod.id] and Color3.fromRGB(80, 140, 80) or Color3.fromRGB(55, 55, 75)
                btn.Text = (mods[mod.id] and "🟢 " or "🔴 ") .. mod.name .. (mod.key and (" [" .. mod.key .. "]") or "")
                executeMod(mod, mods[mod.id])
            elseif mod.type == "click" then
                executeClickMod(mod)
            end
            updateCanvasSize()
        end)
        
        return btn, desc
    end
    
    -- ============ UPDATE TAB CONTENT ============
    local function createUpdateTab()
        for _, child in pairs(modsContainer:GetChildren()) do
            if child:IsA("TextButton") or child:IsA("Frame") then child:Destroy() end
        end
        
        local sections = {
            {title="📢 UPDATE " .. updateInfo.version, color=Color3.fromRGB(139,0,0), height=60,
                items={"Released: " .. updateInfo.date, "Creator: " .. updateInfo.creator, "Key: " .. updateInfo.key, "Total Mods: " .. updateInfo.totalMods}},
            {title="✨ WHAT'S NEW", color=Color3.fromRGB(139,0,0), height=35, items=updateInfo.newMods},
            {title="⌨️ KEYBOARD SHORTCUTS", color=Color3.fromRGB(139,0,0), height=35, items=updateInfo.shortcuts},
            {title="💎 HDGB HONORED ONE", color=Color3.fromRGB(30,30,50), height=50, 
                items={"The Honored One | Created by " .. ownerName, "Join Discord: " .. discordName, "Key: " .. updateInfo.key, "Total Mods: " .. updateInfo.totalMods}}
        }
        
        for _, section in ipairs(sections) do
            local header = Instance.new("Frame")
            header.Size = UDim2.new(0.96, 0, 0, section.height)
            header.Position = UDim2.new(0.02, 0, 0, 0)
            header.BackgroundColor3 = section.color
            header.BackgroundTransparency = 0.2
            header.Parent = modsContainer
            local headerCorner = Instance.new("UICorner")
            headerCorner.CornerRadius = UDim.new(0, 10)
            headerCorner.Parent = header
            
            local headerText = Instance.new("TextLabel")
            headerText.Size = UDim2.new(1, 0, 1, 0)
            headerText.BackgroundTransparency = 1
            headerText.Text = section.title
            headerText.TextColor3 = Color3.fromRGB(255, 215, 0)
            headerText.TextSize = section.height == 60 and 14 or 11
            headerText.Font = Enum.Font.GothamBold
            headerText.Parent = header
            
            if section.title == "📢 UPDATE " .. updateInfo.version then
                local yPos = 32
                for i, item in ipairs(section.items) do
                    local subItem = Instance.new("TextLabel")
                    subItem.Size = UDim2.new(1, 0, 0, 16)
                    subItem.Position = UDim2.new(0, 12, 0, yPos)
                    subItem.BackgroundTransparency = 1
                    subItem.Text = "• " .. item
                    subItem.TextColor3 = Color3.fromRGB(200,200,200)
                    subItem.TextSize = 8
                    subItem.Font = Enum.Font.Gotham
                    subItem.TextXAlignment = Enum.TextXAlignment.Left
                    subItem.Parent = header
                    yPos = yPos + 16
                end
            end
            
            for i, item in ipairs(section.items) do
                if section.title ~= "📢 UPDATE " .. updateInfo.version then
                    local itemFrame = Instance.new("Frame")
                    itemFrame.Size = UDim2.new(0.94, 0, 0, 28)
                    itemFrame.Position = UDim2.new(0.03, 0, 0, 0)
                    itemFrame.BackgroundColor3 = Color3.fromRGB(45,45,65)
                    itemFrame.BackgroundTransparency = 0.5
                    itemFrame.Parent = modsContainer
                    local itemCorner = Instance.new("UICorner")
                    itemCorner.CornerRadius = UDim.new(0, 6)
                    itemCorner.Parent = itemFrame
                    
                    local itemText = Instance.new("TextLabel")
                    itemText.Size = UDim2.new(1, -10, 1, 0)
                    itemText.Position = UDim2.new(0, 10, 0, 0)
                    itemText.BackgroundTransparency = 1
                    itemText.Text = (section.title == "⌨️ KEYBOARD SHORTCUTS" and "• " or "✨ ") .. item
                    itemText.TextColor3 = section.title == "⌨️ KEYBOARD SHORTCUTS" and Color3.fromRGB(200,200,220) or Color3.fromRGB(100,255,100)
                    itemText.TextSize = 8
                    itemText.Font = Enum.Font.Gotham
                    itemText.TextXAlignment = Enum.TextXAlignment.Left
                    itemText.Parent = itemFrame
                end
            end
        end
        modsContainer.CanvasSize = UDim2.new(0, 0, 0, 1200)
    end
    
    -- ============ REFRESH MODS ============
    function refreshMods()
        if not modsContainer then return end
        for _, child in pairs(modsContainer:GetChildren()) do
            if child:IsA("TextButton") or (child:IsA("Frame") and child ~= modsContainer:FindFirstChild("UIListLayout")) then
                child:Destroy()
            end
        end
        
        if currentCategory == "UPDATE" then
            createUpdateTab()
            return
        end
        
        -- Add sliders to MOVEMENT tab
        if currentCategory == "MOVEMENT" then
            createSlider(modsContainer, "Fly Speed", 20, 200, sliderValues.flySpeed, function(val) sliderValues.flySpeed = val end)
            createSlider(modsContainer, "Super Speed", 16, 200, sliderValues.runSpeed, function(val) sliderValues.runSpeed = val end)
            createSlider(modsContainer, "Dash Power", 50, 300, sliderValues.dashPower, function(val) sliderValues.dashPower = val end)
            createSlider(modsContainer, "Jump Power", 50, 200, sliderValues.jumpPower, function(val) sliderValues.jumpPower = val end)
            createSlider(modsContainer, "Gravity", 0, 200, sliderValues.gravity, function(val) sliderValues.gravity = val end)
            createSlider(modsContainer, "Slow Motion", 0.1, 1, sliderValues.slowMotionSpeed, function(val) sliderValues.slowMotionSpeed = val end)
            createSlider(modsContainer, "Hover Speed", 2, 15, sliderValues.hoverSpeed, function(val) sliderValues.hoverSpeed = val end)
            createSlider(modsContainer, "Time Warp Speed", 1.1, 3, sliderValues.timeWarpSpeed, function(val) sliderValues.timeWarpSpeed = val end)
        end
        
        -- Add sliders to COMBAT tab
        if currentCategory == "COMBAT" then
            createSlider(modsContainer, "Push Power", 20, 200, sliderValues.pushPower, function(val) sliderValues.pushPower = val end)
            createSlider(modsContainer, "Pull Power", 20, 200, sliderValues.pullPower, function(val) sliderValues.pullPower = val end)
            createSlider(modsContainer, "Launch Power", 50, 300, sliderValues.launchPower, function(val) sliderValues.launchPower = val end)
            createSlider(modsContainer, "Auto Heal Amount", 1, 20, sliderValues.autoHealAmount, function(val) sliderValues.autoHealAmount = val end)
            createSlider(modsContainer, "Steal Amount", 5, 50, sliderValues.autoHealAmount, function(val) sliderValues.autoHealAmount = val end)
            createSlider(modsContainer, "Freeze Aura Range", 10, 50, sliderValues.freezeRange, function(val) sliderValues.freezeRange = val end)
            createSlider(modsContainer, "Lightning Range", 10, 100, sliderValues.lightningRange, function(val) sliderValues.lightningRange = val end)
        end
        
        -- Add sliders to VISUAL tab
        if currentCategory == "VISUAL" then
            createSlider(modsContainer, "Big Head Size", 2, 6, sliderValues.bigHeadSize, function(val) sliderValues.bigHeadSize = val end)
            createSlider(modsContainer, "Giant Size", 3, 10, sliderValues.giantSize, function(val) sliderValues.giantSize = val end)
            createSlider(modsContainer, "Tiny Size", 0.3, 1, sliderValues.tinySize, function(val) sliderValues.tinySize = val end)
            createSlider(modsContainer, "Invisible Transparency", 0, 1, sliderValues.transparency, function(val) sliderValues.transparency = val end)
            createSlider(modsContainer, "Trail Length", 0.2, 2, sliderValues.trailLength, function(val) sliderValues.trailLength = val end)
        end
        
        -- Add sliders to WORLD tab
        if currentCategory == "WORLD" then
            createSlider(modsContainer, "Platform Size", 3, 10, sliderValues.platformSize, function(val) sliderValues.platformSize = val end)
            createSlider(modsContainer, "Platform Duration", 3, 10, sliderValues.platformDuration, function(val) sliderValues.platformDuration = val end)
            createSlider(modsContainer, "Brightness", 0.5, 3, sliderValues.brightness, function(val) sliderValues.brightness = val end)
            createSlider(modsContainer, "Heal Aura Range", 10, 50, sliderValues.healRange, function(val) sliderValues.healRange = val end)
        end
        
        -- Add sliders to FUN tab
        if currentCategory == "FUN" then
            createSlider(modsContainer, "Bouncy Power", 10, 60, sliderValues.bouncyPower, function(val) sliderValues.bouncyPower = val end)
            createSlider(modsContainer, "Spin Speed", 1, 30, sliderValues.spinSpeed, function(val) sliderValues.spinSpeed = val end)
            createSlider(modsContainer, "Rocket Power", 50, 500, sliderValues.rocketPower, function(val) sliderValues.rocketPower = val end)
            createSlider(modsContainer, "Fling Power", 50, 500, sliderValues.flingPower, function(val) sliderValues.flingPower = val end)
            createSlider(modsContainer, "Magnet Strength", 20, 100, sliderValues.magnetStrength, function(val) sliderValues.magnetStrength = val end)
        end
        
        -- Add sliders to UTILITY tab
        if currentCategory == "UTILITY" then
            createSlider(modsContainer, "Hitbox Size", 1, 5, sliderValues.hitboxSize, function(val) sliderValues.hitboxSize = val end)
            createSlider(modsContainer, "FOV", 70, 120, sliderValues.fovValue, function(val) sliderValues.fovValue = val end)
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
            createModButton(modsContainer, mod)
        end
        updateCanvasSize()
    end
    
    -- ============ UPDATE ACTIVE COUNT ============
    game:GetService("RunService").Heartbeat:Connect(function()
        local count = 0 for _, state in pairs(mods) do if state then count = count + 1 end end
        if activeLabel then activeLabel.Text = "✅ Active: " .. count end
    end)
    
    -- ============ FLY LOOP ============
    game:GetService("RunService").Heartbeat:Connect(function()
        if mods.fly and bodyVel then
            local root = getRootPart()
            if root and bodyVel.Parent ~= root then bodyVel.Parent = root end
            local moveDir = Vector3.new(0,0,0)
            local cam = workspace.CurrentCamera
            local input = game:GetService("UserInputService")
            if input:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
            if input:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
            if input:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
            if input:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
            if input:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0,1,0) end
            if input:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir - Vector3.new(0,1,0) end
            bodyVel.Velocity = moveDir.Magnitude > 0 and moveDir.Unit * sliderValues.flySpeed or Vector3.new(0,0,0)
        end
    end)
    
    -- ============ TELEPORT ============
    local mouse = player:GetMouse()
    mouse.Button1Down:Connect(function()
        if mods.teleport and mouse and mouse.Target then
            local root = getRootPart()
            if root then root.CFrame = CFrame.new(mouse.Hit.p) end
        end
    end)
    
    -- ============ DASH ============
    game:GetService("UserInputService").InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == Enum.KeyCode.Q and mods.dash then
            local root = getRootPart()
            if root then root.Velocity = workspace.CurrentCamera.CFrame.LookVector * sliderValues.dashPower end
        end
    end)
    
    -- ============ KEYBOARD SHORTCUTS ============
    game:GetService("UserInputService").InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == Enum.KeyCode.K then
            if main.Visible and main.Size.Y.Offset > 0 then collapseMenu() else expandMenu() end
        end
        local shortcuts = {
            {key=Enum.KeyCode.F, id="fly"},
            {key=Enum.KeyCode.G, id="superSpeed"},
            {key=Enum.KeyCode.H, id="autoPlatform"},
            {key=Enum.KeyCode.T, id="teleport"},
            {key=Enum.KeyCode.R, id="rainbowMode"},
            {key=Enum.KeyCode.N, id="noclip"},
        }
        for _, s in ipairs(shortcuts) do
            if input.KeyCode == s.key then
                mods[s.id] = not mods[s.id]
                for _, mod in ipairs(allMods) do if mod.id == s.id then executeMod(mod, mods[s.id]) break end end
                refreshMods()
                break
            end
        end
    end)
    
    -- ============ SEARCH FUNCTION ============
    searchBox.Changed:Connect(function() refreshMods() end)
    
    -- ============ ANIMATION FUNCTIONS ============
    local tweenService = game:GetService("TweenService")
    
    function expandMenu()
        if isAnimating then return end
        isAnimating = true
        main.Visible = true
        hoverName.Visible = false
        collapseBtn.Text = "▲"
        local expandTween = tweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, menuWidth, 0, menuHeight)})
        expandTween:Play()
        expandTween.Completed:Wait()
        isAnimating = false
        isMenuExpanded = true
        updateCanvasSize()
    end
    
    function collapseMenu()
        if isAnimating then return end
        isAnimating = true
        collapseBtn.Text = "▼"
        local collapseTween = tweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, menuWidth, 0, 0)})
        collapseTween:Play()
        collapseTween.Completed:Wait()
        main.Visible = false
        hoverName.Visible = true
        isAnimating = false
        isMenuExpanded = false
    end
    
    collapseBtn.MouseButton1Click:Connect(collapseMenu)
    
    -- ============ CHARACTER RESPAWN HANDLER ============
    player.CharacterAdded:Connect(function(newChar)
        task.wait(0.5)
        if mods.superSpeed then local hum = getHumanoid() if hum then hum.WalkSpeed = sliderValues.runSpeed end end
        if mods.godMode then local hum = getHumanoid() if hum then hum.MaxHealth = math.huge hum.Health = math.huge end end
        if mods.megaJump then local hum = getHumanoid() if hum then hum.JumpPower = sliderValues.jumpPower end end
        if mods.bigHead then local ch = getCharacter() if ch and ch:FindFirstChild("Head") then ch.Head.Size = Vector3.new(sliderValues.bigHeadSize, sliderValues.bigHeadSize, sliderValues.bigHeadSize) end end
        if mods.giantMode then local r = getRootPart() if r then r.Size = Vector3.new(sliderValues.giantSize, sliderValues.giantSize, 3) end end
        if mods.tinyMode then local r = getRootPart() if r then r.Size = Vector3.new(sliderValues.tinySize, sliderValues.tinySize, 0.5) end end
        if mods.autoPlatform then
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
        end
        if mods.fly then
            if bodyVel then bodyVel:Destroy() end
            bodyVel = Instance.new("BodyVelocity")
            bodyVel.MaxForce = Vector3.new(1,1,1)*100000
            local root = getRootPart()
            if root then bodyVel.Parent = root end
            local hum = getHumanoid()
            if hum then hum.PlatformStand = true end
        end
        if mods.esp then
            if espFolder then espFolder:Destroy() end
            espFolder = nil
            executeMod({id="esp"}, true)
        end
        if mods.timeWarp then
            if timeWarpConnection then timeWarpConnection:Disconnect() end
            timeWarpConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if mods.timeWarp then game:GetService("RunService"):SetRuntime(sliderValues.timeWarpSpeed) end
            end)
        end
        if mods.poisonAura then executeMod({id="poisonAura"}, true) end
        if mods.fireAura then executeMod({id="fireAura"}, true) end
        if mods.lightningAura then executeMod({id="lightningAura"}, true) end
        if mods.vampirism then executeMod({id="vampirism"}, true) end
        if mods.freezeAuraNew then executeMod({id="freezeAuraNew"}, true) end
        if mods.healAura then executeMod({id="healAura"}, true) end
        if mods.magnet then executeMod({id="magnet"}, true) end
        print("All mods reapplied after respawn!")
    end)
    
    -- ============ INITIAL STATE ============
    refreshMods()
    main.Size = UDim2.new(0, menuWidth, 0, 0)
    main.Visible = false
    hoverName.Visible = true
    isMenuExpanded = false
end

print("=== HDGB HONORED ONE PREMIUM v12.2 ===")
print("Created by: " .. ownerName)
print("DISCORD: " .. discordName)
print("KEY: HDGB")
print("TOTAL MODS: " .. #allMods)
print("FULL SCROLLING - You can scroll ALL the way down now!")
print("Click the HOVER NAME to open the menu!")
