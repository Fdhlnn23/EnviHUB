local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local Theme = require("theme")
local Icons = require("icons")
local Elements = require("elements")

return function()

    -- ScreenGui
    local gui = Instance.new("ScreenGui")
    gui.Name = "EnviUI"
    gui.ResetOnSpawn = false
    gui.Parent = PlayerGui

    -- Main frame
    local Main = Instance.new("Frame")
    Main.Parent = gui
    Main.Size = UDim2.fromScale(0.7, 0.75)
    Main.Position = UDim2.fromScale(0.15, 0.12)
    Main.BackgroundColor3 = Theme.Background
    Main.BorderSizePixel = 0
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

    -- Sidebar
    local Sidebar = Instance.new("Frame")
    Sidebar.Parent = Main
    Sidebar.Size = UDim2.new(0, 180, 1, 0)
    Sidebar.BackgroundColor3 = Theme.Panel
    Sidebar.BorderSizePixel = 0

    local SideLayout = Instance.new("UIListLayout", Sidebar)
    SideLayout.Padding = UDim.new(0, 6)

    -- Content holder
    local Content = Instance.new("Frame")
    Content.Parent = Main
    Content.Position = UDim2.new(0, 180, 0, 0)
    Content.Size = UDim2.new(1, -180, 1, 0)
    Content.BackgroundTransparency = 1

    local Window = {}
    local CurrentTab = nil

    -- =========================
    -- CREATE TAB (INI YANG KAMU TANYA)
    -- =========================
    function Window:CreateTab(name)

        -- Sidebar Button
        local TabButton = Instance.new("TextButton")
        TabButton.Parent = Sidebar
        TabButton.Size = UDim2.new(1, -12, 0, 36)
        TabButton.BackgroundColor3 = Theme.Background
        TabButton.BorderSizePixel = 0
        TabButton.Text = (Icons[name] or "•") .. "  " .. name
        TabButton.TextColor3 = Theme.Text
        TabButton.Font = Enum.Font.Gotham
        TabButton.TextSize = 13
        TabButton.TextXAlignment = Enum.TextXAlignment.Left
        TabButton.AutoButtonColor = false
        Instance.new("UICorner", TabButton).CornerRadius = UDim.new(0, 8)

        -- Tab Page
        local Page = Instance.new("Frame")
        Page.Parent = Content
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.Visible = false
        Page.BackgroundTransparency = 1

        local PageLayout = Instance.new("UIListLayout", Page)
        PageLayout.Padding = UDim.new(0, 10)

        -- Tab switching
        TabButton.MouseButton1Click:Connect(function()
            if CurrentTab then
                CurrentTab.Visible = false
            end
            Page.Visible = true
            CurrentTab = Page
        end)

        -- AUTO OPEN FIRST TAB
        if not CurrentTab then
            Page.Visible = true
            CurrentTab = Page
        end

        -- =========================
        -- TAB API (ELEMENTS)
        -- =========================
        local Tab = {}

        function Tab:Paragraph(opt)
            Elements:Paragraph(Page, Theme, opt)
        end

        function Tab:Button(opt)
            Elements:Button(Page, Theme, opt)
        end

        function Tab:Toggle(opt)
            Elements:Toggle(Page, Theme, opt)
        end

        function Tab:Dropdown(opt)
            Elements:Dropdown(Page, Theme, opt)
        end

        return Tab
    end

    return Window
end
