local TweenService = game:GetService("TweenService")

local currentIndicator = nil
local currentPage = nil
local tabCount = 0

function Window:CreateTab(text, iconId)
    tabCount += 1

    -- TAB BUTTON
    local TabBtn = Instance.new("TextButton")
    TabBtn.Name = text .. "_Tab"
    TabBtn.Parent = Sidebar
    TabBtn.LayoutOrder = tabCount
    TabBtn.Size = UDim2.new(1, -10, 0, 38)
    TabBtn.BackgroundTransparency = 1
    TabBtn.Text = ""
    TabBtn.AutoButtonColor = false
    Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 6)

    -- INDICATOR
    local Indicator = Instance.new("Frame")
    Indicator.Parent = TabBtn
    Indicator.BackgroundColor3 = Theme.Accent
    Indicator.Size = UDim2.new(0, 3, 0, 0)
    Indicator.Position = UDim2.new(0, 0, 0.5, 0)
    Indicator.Visible = false
    Instance.new("UICorner", Indicator).CornerRadius = UDim.new(1, 0)

    -- CONTAINER
    local Container = Instance.new("Frame")
    Container.Parent = TabBtn
    Container.Size = UDim2.new(1, 0, 1, 0)
    Container.BackgroundTransparency = 1

    -- ICON
    local IconImg = Instance.new("ImageLabel")
    IconImg.Parent = Container
    IconImg.Size = UDim2.fromOffset(20, 20)
    IconImg.Position = UDim2.new(0, 12, 0.5, -10)
    IconImg.BackgroundTransparency = 1
    IconImg.Image = iconId or ""
    IconImg.ImageColor3 = Theme.Text

    -- LABEL
    local TabLabel = Instance.new("TextLabel")
    TabLabel.Parent = Container
    TabLabel.Size = UDim2.new(1, -45, 1, 0)
    TabLabel.Position = UDim2.fromOffset(40, 0)
    TabLabel.BackgroundTransparency = 1
    TabLabel.Text = "|  " .. text
    TabLabel.TextColor3 = Theme.Text
    TabLabel.Font = Enum.Font.GothamBold
    TabLabel.TextSize = 14
    TabLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- PAGE
    local Page = Instance.new("Frame")
    Page.Parent = Content
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.Visible = false
    Page.BackgroundTransparency = 1

    local PageLayout = Instance.new("UIListLayout")
    PageLayout.Parent = Page
    PageLayout.Padding = UDim.new(0, 10)

    -- CLICK
    TabBtn.MouseButton1Click:Connect(function()
        if currentIndicator and currentIndicator ~= Indicator then
            TweenService:Create(
                currentIndicator,
                TweenInfo.new(0.2, Enum.EasingStyle.Quart),
                {
                    Size = UDim2.new(0, 3, 0, 0),
                    Position = UDim2.new(0, 0, 0.5, 0)
                }
            ):Play()
        end

        if currentPage then
            currentPage.Visible = false
        end

        Indicator.Visible = true
        Page.Visible = true
        currentIndicator = Indicator
        currentPage = Page

        TweenService:Create(
            Indicator,
            TweenInfo.new(0.3, Enum.EasingStyle.Back),
            {
                Size = UDim2.new(0, 3, 0.6, 0),
                Position = UDim2.new(0, 0, 0.2, 0)
            }
        ):Play()
    end)

    -- AUTO OPEN FIRST TAB
    if not currentPage then
        Page.Visible = true
        Indicator.Visible = true
        currentPage = Page
        currentIndicator = Indicator
    end

    -- TAB API
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

    return Window
end

