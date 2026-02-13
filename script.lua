local SeaHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/YuiSess/Uibanana/refs/heads/main/README.md"))()
local Window = SeaHub:CreateWindow({
    Title = "Eclipse Hub",
    Subtitle = "- By:Kira",
    Image = "rbxassetid://112485471724320"
})
-- TAB 1
local MainTab = Window:AddTab("Main")
local Section = MainTab:AddLeftGroupbox("Main Controls")

-- 1. TOGGLE
Section:AddToggle("EnableFeature", {
    Text = "Enable Feature",
    Default = false,
    Callback = function(v)
        print("Toggle:", v)
    end
})
-- 2. BUTTON
Section:AddButton({
    Text = "Click Me",
    Func = function()
        print("Button clicked!")
        SeaHub:Notify({
            Title = "Success",
            Desc = "Button worked!",
            ShowTime = 3
        })
    end
})

-- 3. SLIDER
Section:AddSlider({
    Text = "Walk Speed",
    Min = 16,
    Max = 200,
    Default = 50,
    Callback = function(v)
        print("WalkSpeed:", v)
    end
})

-- 4. DROPDOWN
Section:AddDropdown("WeaponType", {
    Text = "Weapon Type",
    Values = {"Sword", "Gun", "Magic", "Melee"},
    Default = 1,
    Callback = function(v)
        print("Weapon:", v)
    end
})

-- 5. INPUT
Section:AddInput("PlayerName", {
    Text = "Player Name",
    Placeholder = "Enter username...",
    Callback = function(v)
        print("Input:", v)
    end
})

-- 6. LABEL
local MyLabel = Section:AddLabel("Status: Ready")

-- 7. KEYBIND
Section:AddKeyBind({
    Title = "Toggle Key",
    Key = "F",
    Callback = function(v)
        print("Key pressed:", v)
    end
})

-- SECTION PHẢI DÙNG AddRightGroupbox
local SettingsSection = MainTab:AddRightGroupbox("Settings")

SettingsSection:AddToggle("ToggleUI", {
    Text = "Toggle UI Visibility",
    Default = true,
    Callback = function(v)
        SeaHub.ToggleUI()
    end
})

SettingsSection:AddButton({
    Text = "Destroy UI",
    Func = function()
        SeaHub.DestroyUI()
    end
})

-- TAB 2 (Y HỆT TAB 1)
local SecondTab = Window:AddTab("Second Tab")
local Section2 = SecondTab:AddLeftGroupbox("Second Controls")

-- 1. TOGGLE
Section2:AddToggle("EnableFeature2", {
    Text = "Enable Feature 2",
    Default = false,
    Callback = function(v)
        print("Toggle 2:", v)
    end
})

-- 2. BUTTON
Section2:AddButton({
    Text = "Click Me 2",
    Func = function()
        print("Button 2 clicked!")
        SeaHub:Notify({
            Title = "Success",
            Desc = "Button 2 worked!",
            ShowTime = 3
        })
    end
})

-- 3. SLIDER
Section2:AddSlider({
    Text = "Jump Power",
    Min = 50,
    Max = 200,
    Default = 100,
    Callback = function(v)
        print("JumpPower:", v)
    end
})

-- 4. DROPDOWN
Section2:AddDropdown("CharacterType", {
    Text = "Character Type",
    Values = {"Warrior", "Mage", "Archer", "Assassin"},
    Default = 1,
    Callback = function(v)
        print("Character:", v)
    end
})

-- 5. INPUT
Section2:AddInput("CharacterName", {
    Text = "Character Name",
    Placeholder = "Enter character name...",
    Callback = function(v)
        print("Character Input:", v)
    end
})

-- 6. LABEL
local MyLabel2 = Section2:AddLabel("Status: Active")

-- 7. KEYBIND
Section2:AddKeyBind({
    Title = "Special Key",
    Key = "G",
    Callback = function(v)
        print("Special Key pressed:", v)
    end
})

-- SECTION PHẢI DÙNG AddRightGroupbox
local SettingsSection2 = SecondTab:AddRightGroupbox("Second Settings")

SettingsSection2:AddToggle("AutoFarm", {
    Text = "Auto Farm",
    Default = false,
    Callback = function(v)
        print("Auto Farm:", v)
    end
})

SettingsSection2:AddButton({
    Text = "Reset Settings",
    Func = function()
        print("Settings reset!")
        SeaHub:Notify({
            Title = "Reset",
            Desc = "All settings have been reset!",
            ShowTime = 3
        })
    end
})
