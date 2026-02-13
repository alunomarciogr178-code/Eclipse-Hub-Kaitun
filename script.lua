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
            LP.Character.Humanoid:EquipTool(LP.Backpack:FindFirstChild(_G.SelectedWeapon))
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

local FarmingTab = Window:AddTab("Farming")
local BossTab = Window:AddTab("Bosses")
local ItemsTab = Window:AddTab("Items")
local MasteryTab = Window:AddTab("Mastery")
local VisualTab = Window:AddTab("Visuals")
local MiscTab = Window:AddTab("Misc")
local SettingsTab = Window:AddTab("Settings")

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
MasteryLeft:AddToggle("AutoMasterySword", {Text = "Auto Mastery Sword", Defaultilag = false, Callback = function(v) _G.AutoMasterySword = v end})
MasteryLeft:AddToggle("AutoMasteryGun", {Text = "Auto Mastery Gun", Default = false, Callback = function(v) _G.AutoMasteryGun = v end})

local VisualLeft = VisualTab:AddLeftGroupbox("ESP Controls")
VisualLeft:AddToggle("PlayerESP", {Text = "Player ESP", Default = false, Callback = function(v) _G.PlayerESP = v end})
VisualLeft:AddToggle("FruitESP", {Text = "Devil Fruit ESP", Default = false, Callback = function(v) _G.FruitESP = v end})
VisualLeft:AddToggle("FlowerESP", {Text = "Flower ESP", Default = false, Callback = function(v) _G.FlowerESP = v end})
VisualLeft:AddToggle("ChestESP", {Text = "Chest ESP", Default = false, Callback = function(v) _G.ChestESP = v end})

local MiscLeft = MiscTab:AddLeftGroupbox("Misc Features")
MiscLeft:AddToggle("AutoQuest", {Text = "Auto Accept Quests", Default = false, Callback = function(v) _G.AutoQuest = v end})
MiscLeft:AddButton({Text = "Server Hop", Func = function() game:GetService("TeleportService"):Teleport(game.PlaceId) end})

local SettingsLeft = SettingsTab:AddLeftGroupbox("UI Controls")
SettingsLeft:AddToggle("ToggleUI", {Text = "Toggle UI Visibility", Default = true, Callback = function(v) SeaHub.ToggleUI() end})
SettingsLeft:AddButton({Text = "Destroy UI", Func = function() SeaHub.DestroyUI() end})

task.spawn(function()
    while task.wait(0.5) do
        if _G.AutoCakePrince then
            pcall(function()
                EquipWeapon()
                local status = ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                if string.find(status, "open") or Workspace.Enemies:FindFirstChild("Cake Prince") then
                    for _,v in pairs(Workspace.Enemies:GetChildren()) do
                        if v.Name == "Cake Prince" then
                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                            BringMob(v)
                        end
                    end
                else
                    Tween(CFrame.new(-1826, 73, -12326))
                    for _,v in pairs(Workspace.Enemies:GetChildren()) do
                        if string.find(v.Name, "Cookie") or string.find(v.Name, "Cake") or string.find(v.Name, "Chocolate") then
                            BringMob(v)
                        end
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if _G.AutoBones then
            pcall(function()
                EquipWeapon()
                Tween(CFrame.new(-9515, 164, 5785))
                for _,v in pairs(Workspace.Enemies:GetChildren()) do
                    if string.find(v.Name, "Skeleton") or string.find(v.Name, "Zombie") or string.find(v.Name, "Demonic") then
                        BringMob(v)
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if _G.AutoRengoku or _G.AutoHiddenKey then
            pcall(function()
                EquipWeapon()
                Tween(CFrame.new(-5420, 15, -2800))
                if Workspace.Enemies:FindFirstChild("Awakened Ice Admiral") then
                    for _,v in pairs(Workspace.Enemies:GetChildren()) do
                        if v.Name == "Awakened Ice Admiral" then
                            BringMob(v)
                        end
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if _G.AutoMasteryFruit or _G.AutoMasterySword or _G.AutoMasteryGun then
            pcall(function()
                EquipWeapon()
                Tween(CFrame.new(-9515, 164, 5785))
                for _,v in pairs(Workspace.Enemies:GetChildren()) do
                    if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" then
                        BringMob(v)
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if _G.PlayerESP then
            for _,p in pairs(Players:GetPlayers()) do
                if p ~= LP and p.Character and p.Character:FindFirstChild("Head") then
                    if not p.Character.Head:FindFirstChild("ESPBill") then
                        local bill = Instance.new("BillboardGui", p.Character.Head)
                        bill.Name = "ESPBill"
                        bill.AlwaysOnTop = true
                        bill.Size = UDim2.new(0,100,0,50)
                        bill.StudsOffset = Vector3.new(0,3,0)
                        local txt = Instance.new("TextLabel", bill)
                        txt.BackgroundTransparency = 1
                        txt.Size = UDim2.new(1,0,1,0)
                        txt.TextColor3 = Color3.new(1,0,0)
                        txt.Text = p.Name
                    end
                    local dist = math.floor((p.Character.HumanoidRootPart.Position - LP.Character.HumanoidRootPart.Position).Magnitude / 3)
                    p.Character.Head.ESPBill.TextLabel.Text = p.Name .. " | " .. dist .. "m"
                end
            end
        else
            for _,p in pairs(Players:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("Head") and p.Character.Head:FindFirstChild("ESPBill") then
                    p.Character.Head.ESPBill:Destroy()
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if _G.FruitESP then
            for _,v in pairs(Workspace:GetChildren()) do
                if v:FindFirstChild("Handle") and string.find(v.Name, "Fruit") then
                    if not v.Handle:FindFirstChild("FruitESP") then
                        local bill = Instance.new("BillboardGui", v.Handle)
                        bill.Name = "FruitESP"
                        bill.AlwaysOnTop = true
                        bill.Size = UDim2.new(0,200,0,50)
                        local txt = Instance.new("TextLabel", bill)
                        txt.Text = v.Name .. " Fruit"
                        txt.TextColor3 = Color3.new(0,1,0)
                        txt.BackgroundTransparency = 1
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if _G.FlowerESP then
            for _,v in pairs(Workspace:GetChildren()) do
                if string.find(v.Name, "Flower") then
                    if not v:FindFirstChild("FlowerESP") then
                        local bill = Instance.new("BillboardGui", v)
                        bill.Name = "FlowerESP"
                        bill.AlwaysOnTop = true
                        local txt = Instance.new("TextLabel", bill)
                        txt.Text = v.Name
                        txt.TextColor3 = Color3.new(1,0.5,0)
                    end
                end
            end
        end
    end
end)

SeaHub:Notify({Title = "Eclipse Hub", Desc = "Carregado com sucesso!", ShowTime = 5})
