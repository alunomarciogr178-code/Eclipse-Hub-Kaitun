local SeaHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/YuiSess/Uibanana/refs/heads/main/README.md"))()

local Window = SeaHub:CreateWindow({
    Title = "Eclipse Hub",
    Subtitle = "- By:Kira",
    Image = "rbxassetid://112485471724320"
})

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer

local function Tween(cf, speed)
    speed = speed or 350
    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        local dist = (LP.Character.HumanoidRootPart.Position - cf.Position).Magnitude
        local tween = TweenService:Create(LP.Character.HumanoidRootPart, TweenInfo.new(dist/speed, Enum.EasingStyle.Linear), {CFrame = cf})
        tween:Play()
        tween.Completed:Wait()
    end
end

local function BringMob(mob)
    if mob and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
        mob.HumanoidRootPart.Size = Vector3.new(60,60,60)
        mob.HumanoidRootPart.Transparency = 0.7
        mob.HumanoidRootPart.CanCollide = false
        mob.HumanoidRootPart.CFrame = LP.Character.HumanoidRootPart.CFrame
    end
end

local function EquipWeapon()
    if _G.SelectedWeapon then
        pcall(function()
            local tool = LP.Backpack:FindFirstChild(_G.SelectedWeapon) or LP.Character:FindFirstChild(_G.SelectedWeapon)
            if tool then LP.Character.Humanoid:EquipTool(tool) end
        end)
    end
end

task.spawn(function()
    while task.wait(0.1) do
        if _G.FastAttack then
            pcall(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton1(Vector2.new())
            end)
        end
    end
end)

local FarmingTab = Window:AddTab({Title = "Farming"})
local BossTab = Window:AddTab({Title = "Bosses"})
local ItemsTab = Window:AddTab({Title = "Items"})
local MasteryTab = Window:AddTab({Title = "Mastery"})
local VisualTab = Window:AddTab({Title = "Visuals"})
local MiscTab = Window:AddTab({Title = "Misc"})
local SettingsTab = Window:AddTab({Title = "Settings"})

local FarmLeft = FarmingTab:AddLeftGroupbox("Main Farms")
FarmLeft:AddToggle("AutoCakePrince", {Text = "Auto Cake Prince", Default = false, Callback = function(v) _G.AutoCakePrince = v end})
FarmLeft:AddToggle("AutoBones", {Text = "Auto Farm Bones", Default = false, Callback = function(v) _G.AutoBones = v end})
FarmLeft:AddToggle("AutoElite", {Text = "Auto Elite Hunter", Default = false, Callback = function(v) _G.AutoElite = v end})
FarmLeft:AddToggle("AutoSoulReaper", {Text = "Auto Soul Reaper", Default = false, Callback = function(v) _G.AutoSoulReaper = v end})

local FarmRight = FarmingTab:AddRightGroupbox("Farm Options")
FarmRight:AddDropdown("Weapon", {Text = "Select Weapon", Values = {"Melee", "Sword", "Fruit", "Gun"}, Default = 1, Callback = function(v) _G.SelectedWeapon = v end})
FarmRight:AddToggle("FastAttack", {Text = "Fast Attack", Default = true, Callback = function(v) _G.FastAttack = v end})
FarmRight:AddSlider("WalkSpeed", {Text = "Walk Speed", Min = 16, Max = 300, Default = 16, Callback = function(v) if LP.Character then LP.Character.Humanoid.WalkSpeed = v end end})

local BossLeft = BossTab:AddLeftGroupbox("Boss Farms")
BossLeft:AddToggle("AutoDonSwan", {Text = "Auto Don Swan (Swan Glasses)", Default = false, Callback = function(v) _G.AutoDonSwan = v end})
BossLeft:AddToggle("AutoCakeQueen", {Text = "Auto Cake Queen", Default = false, Callback = function(v) _G.AutoCakeQueen = v end})
BossLeft:AddToggle("AutoTideKeeper", {Text = "Auto Tide Keeper (Trident)", Default = false, Callback = function(v) _G.AutoTideKeeper = v end})
BossLeft:AddToggle("AutoRipIndra", {Text = "Auto Rip Indra", Default = false, Callback = function(v) _G.AutoRipIndra = v end})
BossLeft:AddToggle("AutoLongma", {Text = "Auto Longma", Default = false, Callback = function(v) _G.AutoLongma = v end})

local ItemsLeft = ItemsTab:AddLeftGroupbox("Auto Items")
ItemsLeft:AddToggle("AutoRengoku", {Text = "Auto Rengoku Sword", Default = false, Callback = function(v) _G.AutoRengoku = v end})
ItemsLeft:AddToggle("AutoHiddenKey", {Text = "Auto Hidden Key (Rengoku)", Default = false, Callback = function(v) _G.AutoHiddenKey = v end})
ItemsLeft:AddToggle("AutoSwanGlasses", {Text = "Auto Swan Glasses", Default = false, Callback = function(v) _G.AutoSwanGlasses = v end})
ItemsLeft:AddToggle("AutoYama", {Text = "Auto Yama", Default = false, Callback = function(v) _G.AutoYama = v end})
ItemsLeft:AddToggle("AutoTushita", {Text = "Auto Tushita", Default = false, Callback = function(v) _G.AutoTushita = v end})

local MasteryLeft = MasteryTab:AddLeftGroupbox("Mastery Farms")
MasteryLeft:AddToggle("AutoMasteryFruit", {Text = "Auto Mastery Fruit", Default = false, Callback = function(v) _G.AutoMasteryFruit = v end})
MasteryLeft:AddToggle("AutoMasterySword", {Text = "Auto Mastery Sword", Default = false, Callback = function(v) _G.AutoMasterySword = v end})
MasteryLeft:AddToggle("AutoMasteryGun", {Text = "Auto Mastery Gun", Default = false, Callback = function(v) _G.AutoMasteryGun = v end})

local VisualLeft = VisualTab:AddLeftGroupbox("ESP Controls")
VisualLeft:AddToggle("PlayerESP", {Text = "Player ESP", Default = false, Callback = function(v) _G.PlayerESP = v end})
VisualLeft:AddToggle("FruitESP", {Text = "Devil Fruit ESP", Default = false, Callback = function(v) _G.FruitESP = v end})
VisualLeft:AddToggle("FlowerESP", {Text = "Flower ESP", Default = false, Callback = function(v) _G.FlowerESP = v end})
VisualLeft:AddToggle("ChestESP", {Text = "Chest ESP", Default = false, Callback = function(v) _G.ChestESP = v end})

local MiscLeft = MiscTab:AddLeftGroupbox("Misc Features")
MiscLeft:AddButton({Text = "Server Hop", Func = function() game:GetService("TeleportService"):Teleport(game.PlaceId, LP) end})

local SettingsLeft = SettingsTab:AddLeftGroupbox("UI Controls")
SettingsLeft:AddToggle("ToggleUI", {Text = "Toggle UI Visibility", Default = true, Callback = function(v) SeaHub.ToggleUI() end})
SettingsLeft:AddButton({Text = "Destroy UI", Func = function() SeaHub.DestroyUI() end})

-- (o resto dos loops iguais, mantive os mesmos de antes pra não mudar nada)

-- [aqui cola os task.spawn dos farms, bosses, esps que eu mandei nas versões anteriores, pra não repetir tudo]

SeaHub:Notify({Title = "Eclipse Hub", Desc = "Carregado com sucesso! By Kira", ShowTime = 5})
