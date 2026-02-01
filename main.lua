-- ===============================
-- ENVI HUB - CHLOE UI CORE
-- ===============================

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- ===== CLEAR OLD UI =====
if PlayerGui:FindFirstChild("EnviHubUI") then
    PlayerGui.EnviHubUI:Destroy()
end

-- ===== SCREEN GUI =====
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "EnviHubUI"
ScreenGui.Parent = PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ===== MAIN WINDOW =====
local Main = Instance.new("Frame", ScreenGui)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Position = UDim2.fromScale(0.5, 0.5)
Main.Size = UDim2.fromOffset(680, 420)
Main.BackgroundColor3 = Color3.fromRGB(20, 10, 30)
Main.BackgroundTransparency = 0.2
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(255, 0, 210)
Stroke.Thickness = 1.2
Stroke.Transparency = 0.5

-- ===== TITLE =====
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, -20, 0, 40)
Title.Position = UDim2.fromOffset(15, 2)
Title.BackgroundTransparency = 1
Title.Text = "Envi Hub  |  Chloe UI"
Title.Font = Enum.Font.FredokaOne
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextColor3 = Color3.fromRGB(255, 0, 200)

-- ===== SIDEBAR =====
local Sidebar = Instance.new("ScrollingFrame", Main)
Sidebar.Position = UDim2.fromOffset(10, 55)
Sidebar.Size = UDim2.fromOffset(165, 355)
Sidebar.BackgroundTransparency = 1
Sidebar.ScrollBarThickness = 2
Sidebar.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 200)

local SideLayout = Instance.new("UIListLayout", Sidebar)
SideLayout.Padding = UDim.new(0, 5)

SideLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Sidebar.CanvasSize = UDim2.new(0, 0, 0, SideLayout.AbsoluteContentSize.Y + 10)
end)

-- ===== CONTENT =====
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.fromOffset(185, 55)
Content.Size = UDim2.fromOffset(480, 355)
Content.BackgroundTransparency = 1

-- ===============================
-- TAB SYSTEM
-- ===============================
local Pages = {}
local tabCount = 0
local currentIndicator
local CurrentPage

local function SwitchPage(name)
    for _, p in pairs(Pages) do
        p.Visible = false
    end
    if Pages[name] then
        Pages[name].Visible = true
        CurrentPage = Pages[name]
    end
end

local UI = {}

function UI.CreateTab(text, iconId)
    tabCount += 1

    -- TAB BUTTON
    local TabBtn = Instance.new("TextButton", Sidebar)
    TabBtn.Size = UDim2.new(1, -10, 0, 38)
    TabBtn.Text = ""
    TabBtn.AutoButtonColor = false
    TabBtn.BackgroundTransparency = 1
    Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 6)

    local Indicator = Instance.new("Frame", TabBtn)
    Indicator.Size = UDim2.new(0, 3, 0, 0)
    Indicator.Position = UDim2.new(0, 0, 0.5, 0)
    Indicator.BackgroundColor3 = Color3.fromRGB(0, 220, 255)
    Indicator.Visible = false
    Instance.new("UICorner", Indicator).CornerRadius = UDim.new(1, 0)

    local Icon = Instance.new("ImageLabel", TabBtn)
    Icon.Size = UDim2.fromOffset(20, 20)
    Icon.Position = UDim2.new(0, 12, 0.5, -10)
    Icon.BackgroundTransparency = 1
    Icon.Image = iconId or ""

    local Label = Instance.new("TextLabel", TabBtn)
    Label.Size = UDim2.new(1, -45, 1, 0)
    Label.Position = UDim2.fromOffset(40, 0)
    Label.BackgroundTransparency = 1
    Label.Text = "|  " .. text
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextColor3 = Color3.new(1,1,1)

    -- PAGE
    local Page = Instance.new("ScrollingFrame", Content)
    Page.Size = UDim2.fromScale(1,1)
    Page.Visible = false
    Page.ScrollBarThickness = 2
    Page.ScrollBarImageColor3 = Color3.fromRGB(255,0,200)

    local Layout = Instance.new("UIListLayout", Page)
    Layout.Padding = UDim.new(0, 8)

    Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Page.CanvasSize = UDim2.new(0,0,0,Layout.AbsoluteContentSize.Y + 20)
    end)

    Pages[text] = Page

    TabBtn.MouseButton1Click:Connect(function()
        if currentIndicator and currentIndicator ~= Indicator then
            TweenService:Create(currentIndicator, TweenInfo.new(0.2), {
                Size = UDim2.new(0,3,0,0)
            }):Play()
        end

        Indicator.Visible = true
        currentIndicator = Indicator

        TweenService:Create(Indicator, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
            Size = UDim2.new(0,3,0.6,0),
            Position = UDim2.new(0,0,0.2,0)
        }):Play()

        SwitchPage(text)
    end)

    return Page
end

UI.SwitchPage = SwitchPage
UI.ScreenGui = ScreenGui

return UI
