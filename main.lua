local UI = loadstring(game:HttpGet(
    "RAW_LINK_EnviUI.lua"
))()

local Icons = {
    Info = "rbxassetid://10747373176",
    Fishing = "rbxassetid://10747383471"
}

local Info = UI.CreateTab("Info", Icons.Info)
local Fish = UI.CreateTab("Fishing", Icons.Fishing)

-- CONTOH ISI
local function AddParagraph(parent, text)
    local L = Instance.new("TextLabel", parent)
    L.Size = UDim2.new(0.96,0,0,30)
    L.BackgroundTransparency = 1
    L.TextWrapped = true
    L.Text = text
    L.TextColor3 = Color3.new(1,1,1)
end

AddParagraph(Info, "Envi Hub adalah script premium dengan UI Chloe X style.")
AddParagraph(Fish, "Fishing automation ready.")

UI.SwitchPage("Info")
