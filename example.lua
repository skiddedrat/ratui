-- RatUI example usage
local RatUI = loadstring(readfile("ui.lua"))()

local ui = RatUI.new({
    ScriptName = "RatUI",
    ToggleKey = Enum.KeyCode.RightShift,
})

local win = ui:CreateWindow({
    Title = "RatUI",
    Subtitle = "inspired layout • custom session pulse",
    Blur = true,
    BlurSize = 9,
})

local combat = win:CreateTab("Combat", "⚔")
combat:AddToggle("Silent Aim", false, function(v)
    win:Notify("Silent Aim", v and "Enabled" or "Disabled", 2)
end)
combat:AddSlider("FOV", 25, 450, 120, function() end)
combat:AddKeybind("Silent Aim", Enum.KeyCode.Q, "Toggle")
combat:AddButton("Mock Target", function()
    win:SetTarget({ Name = "Training Dummy", Distance = 31.6, Health = 82, MaxHealth = 100 })
end)

local visuals = win:CreateTab("Visuals", "👁")
visuals:AddToggle("ESP", true)
visuals:AddToggle("Chams", false)
visuals:AddKeybind("ESP", Enum.KeyCode.V, "Toggle")

local misc = win:CreateTab("Misc", "✦")
misc:AddButton("Clear Target", function()
    win:ClearTarget()
end)
misc:AddButton("Notify Test", function()
    win:Notify("RatUI", "Right-side tabs + watermark + keybind list ready.", 3)
end)

win:Notify("RatUI", "Loaded. Press RightShift to toggle window.", 4)
