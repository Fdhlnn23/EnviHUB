local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local Theme = require("theme")
local Icons = require("icons")
local Elements = require("elements")

return function()

    local gui = Instance.new("ScreenGui", PlayerGui)
    gui.Name = "EnviUI"

    local main = Instance.new("Frame", gui)
    main.Size = UDim2.fromScale(0.7,0.75)
    main.Position = UDim2.fromScale(0.15,0.12)
    main.BackgroundColor3 = Theme.Background
    main.BorderSizePixel = 0
    Instance.new("UICorner", main).CornerRadius = UDim.new(0,12)

    local sidebar = Instance.new("Frame", main)
    sidebar.Size = UDim2.new(0,170,1,0)
    sidebar.BackgroundColor3 = Theme.Panel
    sidebar.BorderSizePixel = 0

    local content = Instance.new("Frame", main)
    content.Position = UDim2.new(0,170,0,0)
    content.Size = UDim2.new(1,-170,1,0)
    content.BackgroundTransparency = 1

    local Window = {}

    function Window.CreateTab(text, iconId)
    tabCount = tabCount + 1
    local TabBtn = Instance.new("TextButton", Sidebar)
    TabBtn.Name = text .. "_Tab"
    TabBtn.LayoutOrder = tabCount -- Penentu urutan
    TabBtn.Size = UDim2.new(1, -10, 0, 38)
    TabBtn.BackgroundTransparency = 1
    TabBtn.Text = ""
    TabBtn.AutoButtonColor = false
    Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 6)

    local Indicator = Instance.new("Frame", TabBtn)
    Indicator.BackgroundColor3 = Color3.fromRGB(0, 220, 255)
    Indicator.Size = UDim2.new(0, 3, 0, 0) 
    Indicator.Position = UDim2.new(0, 0, 0.5, 0)
    Indicator.Visible = false
    Instance.new("UICorner", Indicator).CornerRadius = UDim.new(1, 0)

    local Container = Instance.new("Frame", TabBtn)
    Container.Size = UDim2.new(1, 0, 1, 0)
    Container.BackgroundTransparency = 1

    local IconImg = Instance.new("ImageLabel", Container)
    IconImg.Size = UDim2.fromOffset(20, 20)
    IconImg.Position = UDim2.new(0, 12, 0.5, -10)
    IconImg.BackgroundTransparency = 1
    IconImg.Image = iconId
    IconImg.ImageColor3 = Color3.new(1, 1, 1)

    local TabLabel = Instance.new("TextLabel", Container)
    TabLabel.Size = UDim2.new(1, -45, 1, 0)
    TabLabel.Position = UDim2.fromOffset(40, 0)
    TabLabel.BackgroundTransparency = 1
    TabLabel.Text = "|  " .. text
    TabLabel.TextColor3 = Color3.new(1, 1, 1)
    TabLabel.Font = Enum.Font.GothamBold
    TabLabel.TextSize = 14
    TabLabel.TextXAlignment = Enum.TextXAlignment.Left

    TabBtn.MouseButton1Click:Connect(function()
        if currentIndicator and currentIndicator ~= Indicator then
            TweenService:Create(currentIndicator, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Size = UDim2.new(0, 3, 0, 0), Position = UDim2.new(0, 0, 0.5, 0)}):Play()
            TweenService:Create(currentIndicator.Parent, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
        end
        Indicator.Visible = true
        currentIndicator = Indicator
        TweenService:Create(Indicator, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Size = UDim2.new(0, 3, 0.6, 0), Position = UDim2.new(0, 0, 0.2, 0)}):Play()
        TweenService:Create(TabBtn, TweenInfo.new(0.3), {BackgroundTransparency = 0.8, BackgroundColor3 = Color3.new(1,1,1)}):Play()
        SwitchPage(text)
    end)

    return CreatePage(text)
end

    return Window
end
