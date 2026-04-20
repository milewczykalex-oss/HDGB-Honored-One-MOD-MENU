local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Season Rewards Auto Claimer",
    LoadingTitle = "Season Rewards Script",
    LoadingSubtitle = "by Grok",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "SeasonAutoClaim",
        FileName = "SeasonConfig"
    },
    Discord = {
        Enabled = false,
    },
})

local Tab = Window:CreateTab("Main", 4483362458) -- You can change the icon ID

local maxLevel = 100

-- Main Section
local MainSection = Tab:CreateSection("Auto Claim Settings")

local LevelSlider = Tab:CreateSlider({
    Name = "Max Level to Claim",
    Range = {1, 500},
    Increment = 1,
    CurrentValue = 100,
    Flag = "MaxLevel",
    Callback = function(Value)
        maxLevel = Value
    end,
})

local Toggle = Tab:CreateToggle({
    Name = "Auto Claim Rewards",
    CurrentValue = false,
    Flag = "AutoClaimToggle",
    Callback = function(Value)
        if Value then
            Rayfield:Notify({
                Title = "Auto Claim Started",
                Content = "Claiming rewards up to level " .. maxLevel,
                Duration = 3,
                Image = 4483362458,
            })
            
            spawn(function()
                while Toggle.CurrentValue do
                    for level = 1, maxLevel do
                        task.spawn(function()
                            local args = {level}
                            
                            local seasonServiceRF = game:GetService("ReplicatedStorage")
                                :WaitForChild("Packages")
                                :WaitForChild("_Index")
                                :WaitForChild("sleitnick_knit@1.7.0")
                                :WaitForChild("knit")
                                :WaitForChild("Services")
                                :WaitForChild("SeasonService")
                                :WaitForChild("RF")

                            -- Request Ranked Reward
                            pcall(function()
                                seasonServiceRF:WaitForChild("RequestRankedReward"):InvokeServer(unpack(args))
                            end)

                            -- Request Level Reward
                            pcall(function()
                                seasonServiceRF:WaitForChild("RequestLevelRewards"):InvokeServer(unpack(args))
                            end)
                        end)
                    end
                    
                    task.wait(0.5) -- Small delay between full cycles
                end
            end)
        else
            Rayfield:Notify({
                Title = "Auto Claim Stopped",
                Content = "Stopped claiming rewards",
                Duration = 3,
            })
        end
    end,
})

-- Status Label
local StatusLabel = Tab:CreateLabel("Status: Idle")

-- Optional: Add a button to manually claim once
Tab:CreateButton({
    Name = "Claim All Levels Now (One Time)",
    Callback = function()
        Rayfield:Notify({
            Title = "Manual Claim",
            Content = "Claiming rewards for levels 1 to " .. maxLevel,
            Duration = 4,
        })
        
        for level = 1, maxLevel do
            task.spawn(function()
                local args = {level}
                local seasonServiceRF = game:GetService("ReplicatedStorage")
                    :WaitForChild("Packages")
                    :WaitForChild("_Index")
                    :WaitForChild("sleitnick_knit@1.7.0")
                    :WaitForChild("knit")
                    :WaitForChild("Services")
                    :WaitForChild("SeasonService")
                    :WaitForChild("RF")

                pcall(function()
                    seasonServiceRF:WaitForChild("RequestRankedReward"):InvokeServer(unpack(args))
                end)
                pcall(function()
                    seasonServiceRF:WaitForChild("RequestLevelRewards"):InvokeServer(unpack(args))
                end)
            end)
        end
    end,
})
