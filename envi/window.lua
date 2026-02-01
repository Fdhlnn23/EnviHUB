local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

local Theme = loadstring(game:HttpGet("https://raw.githubusercontent.com/Fdhlnn23/EnviHUB/refs/heads/main/envi/theme.lua"))()
local Elements = loadstring(game:HttpGet(

return function()

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
    local Main = Instance.new("Frame")
    Main.Parent = ScreenGui
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.Position = UDim2.fromScale(0.5, 0.5)
    Main.Size = UDim2.fromOffset(680, 420)
    Main.BackgroundColor3 = Color3.fromRGB(20, 10, 30)
    Main.BackgroundTransparency = 0.2
    Main.BorderSizePixel = 0
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

    -- ===== SIDEBAR =====
    local Sidebar = Instance.new("ScrollingFrame")
    Sidebar.Parent = Main
    Sidebar.Name = "Sidebar"
    Sidebar.Position = UDim2.fromOffset(10, 55)
    Sidebar.Size = UDim2.fromOffset(165, 355)
    Sidebar.BackgroundTransparency = 1
    Sidebar.ScrollBarThickness = 2

    local SideLayout = Instance.new("UIListLayout", Sidebar)
    SideLayout.Padding = UDim.new(0, 5)

    -- ===== CONTENT =====
    local Content = Instance.new("Frame")
    Content.Parent = Main
    Content.Position = UDim2.fromOffset(185, 55)
    Content.Size = UDim2.fromOffset(480, 355)
    Content.BackgroundTransparency = 1

    -- =========================
    -- WINDOW API (INI PENTING)
    -- =========================
    local Window = {}

    -- ⬇️ CreateTab kamu NANTI MASUK SINI
    function Window:CreateTab(text, iconId)
    tabCount += 1

    -- =====================
    -- TAB BUTTON
    -- =====================
    local TabBtn = Instance.new("TextButton")
    TabBtn.Name = text .. "_Tab"
    TabBtn.Parent = Sidebar
    TabBtn.LayoutOrder = tabCount
    TabBtn.Size = UDim2.new(1, -10, 0, 38)
    TabBtn.BackgroundTransparency = 1
    TabBtn.Text = ""
    TabBtn.AutoButtonColor = false
    Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 6)

    -- =====================
    -- INDICATOR
    -- =====================
    local Indicator = Instance.new("Frame")
    Indicator.Parent = TabBtn
    Indicator.BackgroundColor3 = Theme.Accent or Color3.fromRGB(0, 220, 255)
    Indicator.Size = UDim2.new(0, 3, 0, 0)
    Indicator.Position = UDim2.new(0, 0, 0.5, 0)
    Indicator.Visible = false
    Instance.new("UICorner", Indicator).CornerRadius = UDim.new(1, 0)

    -- =====================
    -- CONTAINER
    -- =====================
    local Container = Instance.new("Frame")
    Container.Parent = TabBtn
    Container.Size = UDim2.new(1, 0, 1, 0)
    Container.BackgroundTransparency = 1

    -- =====================
    -- ICON
    -- =====================
    local IconImg = Instance.new("ImageLabel")
    IconImg.Parent = Container
    IconImg.Size = UDim2.fromOffset(20, 20)
    IconImg.Position = UDim2.new(0, 12, 0.5, -10)
    IconImg.BackgroundTransparency = 1
    IconImg.Image = iconId or ""
    IconImg.ImageColor3 = Color3.new(1, 1, 1)

    -- =====================
    -- LABEL
    -- =====================
    local TabLabel = Instance.new("TextLabel")
    TabLabel.Parent = Container
    TabLabel.Size = UDim2.new(1, -45, 1, 0)
    TabLabel.Position = UDim2.fromOffset(40, 0)
    TabLabel.BackgroundTransparency = 1
    TabLabel.Text = "|  " .. text
    TabLabel.TextColor3 = Color3.new(1, 1, 1)
    TabLabel.Font = Enum.Font.GothamBold
    TabLabel.TextSize = 14
    TabLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- =====================
    -- PAGE (INI GANTI CreatePage)
    -- =====================
    local Page = Instance.new("Frame")
    Page.Name = text .. "_Page"
    Page.Parent = Content
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.Visible = false
    Page.BackgroundTransparency = 1

    local PageLayout = Instance.new("UIListLayout")
    PageLayout.Parent = Page
    PageLayout.Padding = UDim.new(0, 10)
    PageLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    -- =====================
    -- TAB CLICK
    -- =====================
    TabBtn.MouseButton1Click:Connect(function()
        -- reset indicator lama
        if currentIndicator and currentIndicator ~= Indicator then
            TweenService:Create(
                currentIndicator,
                TweenInfo.new(0.2, Enum.EasingStyle.Quart),
                {
                    Size = UDim2.new(0, 3, 0, 0),
                    Position = UDim2.new(0, 0, 0.5, 0)
                }
            ):Play()

            TweenService:Create(
                currentIndicator.Parent,
                TweenInfo.new(0.2),
                { BackgroundTransparency = 1 }
            ):Play()
        end

        -- hide page lama
        if currentPage then
            currentPage.Visible = false
        end

        -- show page baru
        Page.Visible = true
        Indicator.Visible = true
        currentIndicator = Indicator
        currentPage = Page

        -- animate indicator
        TweenService:Create(
            Indicator,
            TweenInfo.new(0.3, Enum.EasingStyle.Back),
            {
                Size = UDim2.new(0, 3, 0.6, 0),
                Position = UDim2.new(0, 0, 0.2, 0)
            }
        ):Play()

        TweenService:Create(
            TabBtn,
            TweenInfo.new(0.3),
            {
                BackgroundTransparency = 0.8,
                BackgroundColor3 = Color3.new(1,1,1)
            }
        ):Play()
    end)

    -- =====================
    -- AUTO OPEN FIRST TAB
    -- =====================
    if not currentPage then
        Page.Visible = true
        Indicator.Visible = true
        currentIndicator = Indicator
        currentPage = Page
    end

    -- =====================
    -- TAB API (ELEMENT)
    -- =====================
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

