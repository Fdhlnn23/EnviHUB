local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

local CustomPanel = nil
local Connection = nil

-- ===== CLEAR OLD UI =====
if CoreGui:FindFirstChild("EnviHubUI") then
    CoreGui.EnviHubUI:Destroy()
end

-- ===== SCREEN GUI =====
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "EnviHubUI"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- ===== MAIN WINDOW =====
local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Position = UDim2.fromScale(0.5, 0.5)
Main.Size = UDim2.fromOffset(680, 420)
Main.BackgroundColor3 = Color3.fromRGB(20, 10, 30)
Main.BackgroundTransparency = 0.2
Main.BorderSizePixel = 0
Main.ClipsDescendants = false

-- ===== DRAGGABLE MAIN WINDOW =====
local function MakeDraggable(frame, handle)
    local dragging, dragInput, dragStart, startPos
    
    handle = handle or frame
    
    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X, 
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end
    
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

-- ===== TOGGLE BUTTON (IMPROVED) =====
local function CreateToggleButton(image_id, target_ui)
    local ToggleGui = Instance.new("ScreenGui")
    ToggleGui.Parent = CoreGui
    ToggleGui.Name = "ToggleButtonGui"
    ToggleGui.ResetOnSpawn = false

    local IconButton = Instance.new("ImageButton", ToggleGui)
    IconButton.Size = UDim2.fromOffset(50, 50)
    IconButton.Position = UDim2.new(0.1, 0, 0.5, 0)
    IconButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    IconButton.Image = image_id
    IconButton.AutoButtonColor = false
    
    local Corner = Instance.new("UICorner", IconButton)
    Corner.CornerRadius = UDim.new(0, 12)
    
    local Stroke = Instance.new("UIStroke", IconButton)
    Stroke.Color = Color3.fromRGB(255, 0, 200)
    Stroke.Thickness = 2

    -- Make toggle button draggable
    local dragging, dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        IconButton.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X, 
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end

    IconButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = IconButton.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    IconButton.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    IconButton.MouseButton1Click:Connect(function()
        if not dragging then
            target_ui.Visible = not target_ui.Visible
            
            IconButton:TweenSize(UDim2.fromOffset(45, 45), "Out", "Quad", 0.1, true)
            task.wait(0.1)
            IconButton:TweenSize(UDim2.fromOffset(50, 50), "Out", "Quad", 0.1, true)
        end
    end)
end

CreateToggleButton("rbxassetid://101669656973003", Main)

local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(0, 12)

local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Color3.fromRGB(255, 0, 210)
MainStroke.Thickness = 1.2
MainStroke.Transparency = 0.5

-- ===== TITLE BAR =====
local TitleBar = Instance.new("Frame", Main)
TitleBar.Size = UDim2.new(1, 0, 0, 44)
TitleBar.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", TitleBar)
Title.Size = UDim2.new(1, -100, 1, 0)
Title.Position = UDim2.fromOffset(15, 2)
Title.BackgroundTransparency = 1
Title.Text = "Envi Hub  |  GIG TERCEPAT DI D STORE"
Title.Font = Enum.Font.FredokaOne
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextColor3 = Color3.fromRGB(255, 0, 200)

-- ===== CLOSE BUTTON =====
local CloseBtn = Instance.new("TextButton", TitleBar)
CloseBtn.Size = UDim2.fromOffset(35, 35)
CloseBtn.Position = UDim2.new(1, -40, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18
CloseBtn.AutoButtonColor = false
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

CloseBtn.MouseButton1Click:Connect(function()
    Main.Visible = false
end)

CloseBtn.MouseEnter:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 100, 100)}):Play()
end)

CloseBtn.MouseLeave:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 50, 50)}):Play()
end)

-- Make main window draggable via title bar
MakeDraggable(Main, TitleBar)

local Divider = Instance.new("Frame", Main)
Divider.Position = UDim2.fromOffset(0, 44)
Divider.Size = UDim2.new(1, 0, 0, 1)
Divider.BackgroundColor3 = Color3.fromRGB(255, 0, 200)
Divider.BackgroundTransparency = 0.8

-- ===== SIDEBAR SCROLLING =====
local Sidebar = Instance.new("ScrollingFrame", Main)
Sidebar.Name = "Sidebar"
Sidebar.Position = UDim2.fromOffset(10, 55)
Sidebar.Size = UDim2.fromOffset(165, 355)
Sidebar.BackgroundTransparency = 1
Sidebar.BorderSizePixel = 0
Sidebar.ScrollBarThickness = 2
Sidebar.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 200)
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
Sidebar.ScrollBarImageTransparency = 0.5

local SideLayout = Instance.new("UIListLayout", Sidebar)
SideLayout.Padding = UDim.new(0, 5)
SideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder

SideLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Sidebar.CanvasSize = UDim2.new(0, 0, 0, SideLayout.AbsoluteContentSize.Y + 10)
end)

local SidePadding = Instance.new("UIPadding", Sidebar)
SidePadding.PaddingLeft = UDim.new(0, 5)
SidePadding.PaddingTop = UDim.new(0, 2)

-- ===== CONTENT AREA =====
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.fromOffset(185, 55)
Content.Size = UDim2.fromOffset(480, 355)
Content.BackgroundTransparency = 1

-- ===============================
-- ELEMENTS SYSTEM
-- ===============================
local Pages = {}
local CurrentPage = nil
local tabCount = 0

local function SwitchPage(name)
    for _, page in pairs(Pages) do
        page.Visible = false
    end
    if Pages[name] then
        Pages[name].Visible = true
        CurrentPage = Pages[name]
    end
end

local function CreatePage(name)
    local Page = Instance.new("ScrollingFrame", Content)
    Page.Name = name .. "_Page"
    Page.Size = UDim2.fromScale(1, 1)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.ScrollBarThickness = 2
    Page.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 200)
    Page.BorderSizePixel = 0

    local Layout = Instance.new("UIListLayout", Page)
    Layout.Padding = UDim.new(0, 8)
    Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    
    Instance.new("UIPadding", Page).PaddingTop = UDim.new(0, 5)

    Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Page.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 20)
    end)

    Pages[name] = Page
    return Page
end

-- ===== UI ELEMENTS =====

-- 1. PARAGRAF
local function AddParagraph(parent, text)
    local Para = Instance.new("Frame", parent)
    Para.Size = UDim2.new(0.96, 0, 0, 35)
    Para.BackgroundColor3 = Color3.fromRGB(45, 20, 55)
    Para.BackgroundTransparency = 0.4
    Instance.new("UICorner", Para).CornerRadius = UDim.new(0, 6)

    local Label = Instance.new("TextLabel", Para)
    Label.Size = UDim2.new(1, -20, 1, -10)
    Label.Position = UDim2.fromOffset(10, 5)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(220, 220, 220)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 13
    Label.TextWrapped = true
    Label.TextXAlignment = Enum.TextXAlignment.Left

    Label:GetPropertyChangedSignal("TextBounds"):Connect(function()
        Para.Size = UDim2.new(0.96, 0, 0, Label.TextBounds.Y + 15)
    end)
    
    return Para
end

-- 2. BUTTON
local function AddButton(parent, text, callback)
    local Btn = Instance.new("TextButton", parent)
    Btn.Size = UDim2.new(0.96, 0, 0, 38)
    Btn.BackgroundColor3 = Color3.fromRGB(60, 20, 80)
    Btn.AutoButtonColor = false
    Btn.Text = ""
    Btn.ClipsDescendants = true
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)
    
    local BtnLabel = Instance.new("TextLabel", Btn)
    BtnLabel.Size = UDim2.new(1, 0, 1, 0)
    BtnLabel.BackgroundTransparency = 1
    BtnLabel.Text = text
    BtnLabel.TextColor3 = Color3.new(1, 1, 1)
    BtnLabel.Font = Enum.Font.GothamBold
    BtnLabel.TextSize = 14

    Btn.MouseEnter:Connect(function()
        TweenService:Create(Btn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(80, 30, 110)}):Play()
    end)
    Btn.MouseLeave:Connect(function()
        TweenService:Create(Btn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(60, 20, 80)}):Play()
    end)
    Btn.MouseButton1Down:Connect(function()
        Btn:TweenSize(UDim2.new(0.92, 0, 0, 34), "Out", "Quad", 0.1, true)
    end)
    Btn.MouseButton1Up:Connect(function()
        Btn:TweenSize(UDim2.new(0.96, 0, 0, 38), "Out", "Quad", 0.1, true)
        if callback then callback() end
    end)
    
    return Btn
end

-- 3. TOGGLE (SWITCH STYLE)
local function AddToggle(parent, text, default, callback)
    local Tgl = Instance.new("TextButton", parent)
    Tgl.Size = UDim2.new(0.96, 0, 0, 40)
    Tgl.BackgroundColor3 = Color3.fromRGB(40, 15, 60)
    Tgl.BackgroundTransparency = 1
    Tgl.AutoButtonColor = false
    Tgl.Text = ""
    Instance.new("UICorner", Tgl).CornerRadius = UDim.new(0, 6)
    
    local Label = Instance.new("TextLabel", Tgl)
    Label.Size = UDim2.new(1, -60, 1, 0)
    Label.Position = UDim2.fromOffset(5, 0)
    Label.Text = text
    Label.TextColor3 = Color3.new(1, 1, 1)
    Label.Font = Enum.Font.FredokaOne
    Label.TextSize = 16
    Label.BackgroundTransparency = 1
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local SwitchBg = Instance.new("Frame", Tgl)
    SwitchBg.Size = UDim2.fromOffset(38, 20)
    SwitchBg.Position = UDim2.new(1, -48, 0.5, -9)
    SwitchBg.BackgroundColor3 = default and Color3.fromRGB(255, 0, 200) or Color3.fromRGB(20, 5, 30)
    Instance.new("UICorner", SwitchBg).CornerRadius = UDim.new(1, 0)
    
    local Knob = Instance.new("Frame", SwitchBg)
    Knob.Size = UDim2.fromOffset(12, 12)
    Knob.Position = default and UDim2.fromOffset(21, 3) or UDim2.fromOffset(3, 3)
    Knob.BackgroundColor3 = default and Color3.new(1, 1, 1) or Color3.fromRGB(200, 200, 200)
    Instance.new("UICorner", Knob).CornerRadius = UDim.new(1, 0)

    local on = default or false
    
    local function SetState(state)
        on = state
        TweenService:Create(Knob, TweenInfo.new(0.2), {
            Position = on and UDim2.fromOffset(21, 3) or UDim2.fromOffset(3, 3),
            BackgroundColor3 = on and Color3.new(1, 1, 1) or Color3.fromRGB(200, 200, 200)
        }):Play()
        TweenService:Create(SwitchBg, TweenInfo.new(0.2), {
            BackgroundColor3 = on and Color3.fromRGB(255, 0, 200) or Color3.fromRGB(20, 5, 30)
        }):Play()
    end
    
    Tgl.MouseButton1Click:Connect(function()
        on = not on
        SetState(on)
        if callback then callback(on) end
    end)
    
    Tgl.SetValue = SetState
    Tgl.GetValue = function() return on end
    
    return Tgl
end

-- 4. SLIDER
local function AddSlider(parent, text, min, max, default, callback)
    local SliderFrame = Instance.new("Frame", parent)
    SliderFrame.Size = UDim2.new(0.96, 0, 0, 50)
    SliderFrame.BackgroundTransparency = 1
    
    local TitleL = Instance.new("TextLabel", SliderFrame)
    TitleL.Size = UDim2.new(1, 0, 0, 20)
    TitleL.BackgroundTransparency = 1
    TitleL.Text = text
    TitleL.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleL.Font = Enum.Font.GothamBold
    TitleL.TextSize = 14
    TitleL.TextXAlignment = Enum.TextXAlignment.Left
    
    local ValueLabel = Instance.new("TextLabel", SliderFrame)
    ValueLabel.Size = UDim2.new(0, 50, 0, 20)
    ValueLabel.Position = UDim2.new(1, -50, 0, 0)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = tostring(default)
    ValueLabel.TextColor3 = Color3.fromRGB(255, 0, 200)
    ValueLabel.Font = Enum.Font.GothamBold
    ValueLabel.TextSize = 14
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    
    local SliderBack = Instance.new("Frame", SliderFrame)
    SliderBack.Size = UDim2.new(1, 0, 0, 6)
    SliderBack.Position = UDim2.new(0, 0, 1, -10)
    SliderBack.BackgroundColor3 = Color3.fromRGB(40, 15, 60)
    Instance.new("UICorner", SliderBack).CornerRadius = UDim.new(1, 0)
    
    local SliderFill = Instance.new("Frame", SliderBack)
    SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    SliderFill.BackgroundColor3 = Color3.fromRGB(255, 0, 200)
    SliderFill.BorderSizePixel = 0
    Instance.new("UICorner", SliderFill).CornerRadius = UDim.new(1, 0)
    
    local SliderButton = Instance.new("TextButton", SliderBack)
    SliderButton.Size = UDim2.new(1, 0, 1, 10)
    SliderButton.Position = UDim2.new(0, 0, 0, -5)
    SliderButton.BackgroundTransparency = 1
    SliderButton.Text = ""
    
    local dragging = false
    
    local function UpdateSlider(input)
        local pos = math.clamp((input.Position.X - SliderBack.AbsolutePosition.X) / SliderBack.AbsoluteSize.X, 0, 1)
        local value = math.floor(min + (max - min) * pos)
        
        SliderFill.Size = UDim2.new(pos, 0, 1, 0)
        ValueLabel.Text = tostring(value)
        
        if callback then callback(value) end
    end
    
    SliderButton.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            UpdateSlider(input)
        end
    end)
    
    SliderButton.MouseButton1Click:Connect(function(input)
        UpdateSlider(input)
    end)
    
    SliderFrame.SetValue = function(value)
        value = math.clamp(value, min, max)
        local pos = (value - min) / (max - min)
        SliderFill.Size = UDim2.new(pos, 0, 1, 0)
        ValueLabel.Text = tostring(value)
    end
    
    SliderFrame.GetValue = function()
        return tonumber(ValueLabel.Text)
    end
    
    return SliderFrame
end

-- 5. DROPDOWN (IMPROVED)
local function AddDropdown(parent, text, options, callback, config)
    config = config or {}
    local isMultiSelect = config.multiSelect or false
    local selectedValues = config.defaultValues or {}
    
    local Drop = Instance.new("Frame", parent)
    Drop.Size = UDim2.new(0.96, 0, 0, 40)
    Drop.BackgroundTransparency = 1

    local TitleL = Instance.new("TextLabel", Drop)
    TitleL.Size = UDim2.new(0.4, 0, 1, 0)
    TitleL.Position = UDim2.fromOffset(5, 0)
    TitleL.BackgroundTransparency = 1
    TitleL.Text = text
    TitleL.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleL.Font = Enum.Font.FredokaOne
    TitleL.TextSize = 14
    TitleL.TextXAlignment = Enum.TextXAlignment.Left

    local MainBtn = Instance.new("TextButton", Drop)
    MainBtn.Size = UDim2.new(0.55, 0, 0.8, 0)
    MainBtn.Position = UDim2.new(1, -5, 0.5, 0)
    MainBtn.AnchorPoint = Vector2.new(1, 0.5)
    MainBtn.BackgroundColor3 = Color3.fromRGB(60, 20, 80)
    MainBtn.Text = isMultiSelect and "Select Options" or "Select Option"
    MainBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    MainBtn.Font = Enum.Font.FredokaOne
    MainBtn.TextSize = 13
    MainBtn.AutoButtonColor = false
    MainBtn.ClipsDescendants = true
    Instance.new("UICorner", MainBtn).CornerRadius = UDim.new(0, 4)

    local function UpdateButtonText()
        if isMultiSelect then
            if #selectedValues == 0 then
                MainBtn.Text = "Select Options"
            elseif #selectedValues == 1 then
                MainBtn.Text = selectedValues[1]
            else
                MainBtn.Text = #selectedValues .. " selected"
            end
        else
            MainBtn.Text = selectedValues[1] or "Select Option"
        end
    end

    local MainGui = ScreenGui

    local ListPanel = Instance.new("Frame", MainGui) 
    ListPanel.Size = UDim2.new(0, 220, 0, 250)
    ListPanel.BackgroundColor3 = Color3.fromRGB(60, 20, 80)
    ListPanel.BorderSizePixel = 0
    ListPanel.Visible = false
    ListPanel.ZIndex = 100
    Instance.new("UICorner", ListPanel).CornerRadius = UDim.new(0, 4)
    
    local Stroke = Instance.new("UIStroke", ListPanel)
    Stroke.Color = Color3.fromRGB(255, 0, 210)
    Stroke.Transparency = 0.5
    Stroke.Thickness = 1

    local SearchBox = Instance.new("TextBox", ListPanel)
    SearchBox.Size = UDim2.new(1, 0, 0, 35)
    SearchBox.BackgroundTransparency = 1
    SearchBox.PlaceholderText = "Search"
    SearchBox.Text = ""
    SearchBox.TextColor3 = Color3.new(1, 1, 1)
    SearchBox.Font = Enum.Font.FredokaOne
    SearchBox.TextSize = 13
    SearchBox.ClearTextOnFocus = false

    local Line = Instance.new("Frame", ListPanel)
    Line.Size = UDim2.new(1, 0, 0, 1)
    Line.Position = UDim2.new(0, 0, 0, 35)
    Line.BackgroundColor3 = Color3.fromRGB(255, 0, 210)
    Line.Transparency = 0.5
    Line.BorderSizePixel = 0

    local Scroll = Instance.new("ScrollingFrame", ListPanel)
    Scroll.Size = UDim2.new(1, 0, 1, -40)
    Scroll.Position = UDim2.new(0, 0, 0, 40)
    Scroll.BackgroundTransparency = 1
    Scroll.ScrollBarThickness = 2
    Scroll.BorderSizePixel = 0
    Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Scroll.ScrollingDirection = Enum.ScrollingDirection.Y
    
    local UIList = Instance.new("UIListLayout", Scroll)
    UIList.SortOrder = Enum.SortOrder.LayoutOrder

    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local searchText = SearchBox.Text:lower()
        for _, item in pairs(Scroll:GetChildren()) do
            if item:IsA("TextButton") then
                item.Visible = searchText == "" or string.find(item.Name:lower(), searchText) ~= nil
            end
        end
    end)

    local function IsSelected(value)
        for _, v in pairs(selectedValues) do
            if v == value then return true end
        end
        return false
    end

    local function ToggleSelection(value)
        local found = false
        for i, v in pairs(selectedValues) do
            if v == value then
                table.remove(selectedValues, i)
                found = true
                break
            end
        end
        if not found then
            if isMultiSelect then
                table.insert(selectedValues, value)
            else
                selectedValues = {value}
            end
        end
    end

    local function UpdateAllCheckmarks()
        for _, item in pairs(Scroll:GetChildren()) do
            if item:IsA("TextButton") then
                local check = item:FindFirstChild("Check")
                if check and isMultiSelect then
                    check.Visible = IsSelected(item.Name)
                end
            end
        end
    end

    local open = false
    MainBtn.MouseButton1Click:Connect(function()
        open = not open
        if open then
            local pos = MainBtn.AbsolutePosition
            local size = MainBtn.AbsoluteSize
            
            ListPanel.Position = UDim2.fromOffset(pos.X, pos.Y + size.Y + 5)
            ListPanel.Size = UDim2.new(0, size.X, 0, 200) 
            ListPanel.Visible = true
            SearchBox.Text = ""
            UpdateAllCheckmarks()
        else
            ListPanel.Visible = false
        end
    end)

    for _, v in pairs(options) do
        local Opt = Instance.new("TextButton", Scroll)
        Opt.Name = v
        Opt.Size = UDim2.new(1, 0, 0, 35)
        Opt.BackgroundTransparency = 1
        Opt.Text = "      " .. v
        Opt.TextColor3 = Color3.fromRGB(220, 220, 220)
        Opt.Font = Enum.Font.FredokaOne
        Opt.TextSize = 13
        Opt.TextXAlignment = Enum.TextXAlignment.Left
        Opt.AutoButtonColor = false

        local Ind = Instance.new("Frame", Opt)
        Ind.Size = UDim2.new(0, 3, 0.5, 0)
        Ind.Position = UDim2.new(0, 4, 0.25, 0)
        Ind.BackgroundColor3 = Color3.fromRGB(255, 0, 210)
        Ind.Visible = false
        Ind.BorderSizePixel = 0

        local Check = Instance.new("TextLabel", Opt)
        Check.Name = "Check"
        Check.Size = UDim2.new(0, 20, 0, 20)
        Check.Position = UDim2.new(1, -25, 0.5, 0)
        Check.AnchorPoint = Vector2.new(0.5, 0.5)
        Check.BackgroundColor3 = Color3.fromRGB(40, 15, 60)
        Check.BorderSizePixel = 0
        Check.Text = "✓"
        Check.TextColor3 = Color3.fromRGB(255, 0, 210)
        Check.Font = Enum.Font.FredokaOne
        Check.TextSize = 16
        Check.Visible = isMultiSelect and IsSelected(v)
        Instance.new("UICorner", Check).CornerRadius = UDim.new(0, 3)

        Opt.MouseEnter:Connect(function() 
            Opt.BackgroundTransparency = 0.95
            Opt.BackgroundColor3 = Color3.fromRGB(80, 30, 100)
            Ind.Visible = true
        end)
        Opt.MouseLeave:Connect(function() 
            Opt.BackgroundTransparency = 1 
            Ind.Visible = false
        end)

        Opt.MouseButton1Click:Connect(function()
            ToggleSelection(v)
            
            if isMultiSelect then
                Check.Visible = IsSelected(v)
                UpdateButtonText()
                if callback then callback(selectedValues) end
            else
                UpdateButtonText()
                UpdateAllCheckmarks()
                open = false
                ListPanel.Visible = false
                if callback then callback(v) end
            end
        end)
    end
    
    Drop.UpdateOptions = function(newOptions)
        for _, child in pairs(Scroll:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
        
        for _, v in pairs(newOptions) do
            local Opt = Instance.new("TextButton", Scroll)
            Opt.Name = v
            Opt.Size = UDim2.new(1, 0, 0, 35)
            Opt.BackgroundTransparency = 1
            Opt.Text = "      " .. v
            Opt.TextColor3 = Color3.fromRGB(220, 220, 220)
            Opt.Font = Enum.Font.FredokaOne
            Opt.TextSize = 13
            Opt.TextXAlignment = Enum.TextXAlignment.Left
            Opt.AutoButtonColor = false

            local Ind = Instance.new("Frame", Opt)
            Ind.Size = UDim2.new(0, 3, 0.5, 0)
            Ind.Position = UDim2.new(0, 4, 0.25, 0)
            Ind.BackgroundColor3 = Color3.fromRGB(255, 0, 210)
            Ind.Visible = false
            Ind.BorderSizePixel = 0

            local Check = Instance.new("TextLabel", Opt)
            Check.Name = "Check"
            Check.Size = UDim2.new(0, 20, 0, 20)
            Check.Position = UDim2.new(1, -25, 0.5, 0)
            Check.AnchorPoint = Vector2.new(0.5, 0.5)
            Check.BackgroundColor3 = Color3.fromRGB(40, 15, 60)
            Check.BorderSizePixel = 0
            Check.Text = "✓"
            Check.TextColor3 = Color3.fromRGB(255, 0, 210)
            Check.Font = Enum.Font.FredokaOne
            Check.TextSize = 16
            Check.Visible = isMultiSelect and IsSelected(v)
            Instance.new("UICorner", Check).CornerRadius = UDim.new(0, 3)

            Opt.MouseEnter:Connect(function() 
                Opt.BackgroundTransparency = 0.95
                Opt.BackgroundColor3 = Color3.fromRGB(80, 30, 100)
                Ind.Visible = true
            end)
            Opt.MouseLeave:Connect(function() 
                Opt.BackgroundTransparency = 1 
                Ind.Visible = false
            end)

            Opt.MouseButton1Click:Connect(function()
                ToggleSelection(v)
                
                if isMultiSelect then
                    Check.Visible = IsSelected(v)
                    UpdateButtonText()
                    if callback then callback(selectedValues) end
                else
                    UpdateButtonText()
                    UpdateAllCheckmarks()
                    open = false
                    ListPanel.Visible = false
                    if callback then callback(v) end
                end
            end)
        end
    end

    Drop.Clear = function()
        selectedValues = {}
        UpdateButtonText()
        UpdateAllCheckmarks()
        if callback then
            callback(isMultiSelect and selectedValues or nil)
        end
    end

    Drop.SetValue = function(value)
        if isMultiSelect then
            selectedValues = type(value) == "table" and value or {value}
        else
            selectedValues = {value}
        end
        UpdateButtonText()
        UpdateAllCheckmarks()
    end

    Drop.GetValue = function()
        return isMultiSelect and selectedValues or selectedValues[1]
    end

    UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if open and ListPanel.Visible then
                local mouse = game.Players.LocalPlayer:GetMouse()
                local panelPos = ListPanel.AbsolutePosition
                local panelSize = ListPanel.AbsoluteSize
                
                if mouse.X < panelPos.X or mouse.X > panelPos.X + panelSize.X or
                   mouse.Y < panelPos.Y or mouse.Y > panelPos.Y + panelSize.Y then
                    local btnPos = MainBtn.AbsolutePosition
                    local btnSize = MainBtn.AbsoluteSize
                    if mouse.X < btnPos.X or mouse.X > btnPos.X + btnSize.X or
                       mouse.Y < btnPos.Y or mouse.Y > btnPos.Y + btnSize.Y then
                        open = false
                        ListPanel.Visible = false
                    end
                end
            end
        end
    end)
    
    UpdateButtonText()
    
    return Drop
end

-- 6. SECTION
local function AddSection(parent, text)
    local Sec = Instance.new("Frame", parent)
    Sec.Size = UDim2.new(0.96, 0, 0, 35)
    Sec.BackgroundColor3 = Color3.fromRGB(35, 10, 50)
    Sec.ClipsDescendants = true
    Sec.AutomaticSize = Enum.AutomaticSize.Y
    Instance.new("UICorner", Sec).CornerRadius = UDim.new(0, 6)

    local Stroke = Instance.new("UIStroke", Sec)
    Stroke.Color = Color3.fromRGB(255, 0, 210)
    Stroke.Transparency = 0.5

    local Header = Instance.new("TextButton", Sec)
    Header.Size = UDim2.new(1, 0, 0, 35)
    Header.BackgroundTransparency = 1
    Header.Text = "  " .. text
    Header.TextColor3 = Color3.fromRGB(255, 255, 255)
    Header.Font = Enum.Font.GothamBold
    Header.TextSize = 14
    Header.TextXAlignment = Enum.TextXAlignment.Left

    local Arrow = Instance.new("ImageLabel", Header)
    Arrow.Size = UDim2.fromOffset(18, 18)
    Arrow.Position = UDim2.new(1, -28, 0.5, -9)
    Arrow.BackgroundTransparency = 1
    Arrow.Image = "rbxassetid://6034818372"
    Arrow.Rotation = -90
    Arrow.ImageColor3 = Color3.fromRGB(0, 220, 255)

    local Container = Instance.new("Frame", Sec)
    Container.Size = UDim2.new(1, 0, 0, 0)
    Container.Position = UDim2.fromOffset(0, 40)
    Container.BackgroundTransparency = 1
    Container.Visible = false 

    local Layout = Instance.new("UIListLayout", Container)
    Layout.Padding = UDim.new(0, 6)
    Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    Instance.new("UIPadding", Container).PaddingBottom = UDim.new(0, 10)

    local open = false
    Header.MouseButton1Click:Connect(function()
        open = not open
        Container.Visible = open

        TweenService:Create(Arrow, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
            Rotation = open and 0 or -90
        }):Play()

        TweenService:Create(Header, TweenInfo.new(0.3), {
            TextColor3 = open and Color3.fromRGB(255, 0, 210) or Color3.fromRGB(255, 255, 255)
        }):Play()
    end)
    
    return Container
end

-- 7. TEXTBOX
local function AddTextbox(parent, text, placeholder, callback)
    local TextboxFrame = Instance.new("Frame", parent)
    TextboxFrame.Size = UDim2.new(0.96, 0, 0, 40)
    TextboxFrame.BackgroundTransparency = 1
    
    local TitleL = Instance.new("TextLabel", TextboxFrame)
    TitleL.Size = UDim2.new(0.4, 0, 1, 0)
    TitleL.Position = UDim2.fromOffset(5, 0)
    TitleL.BackgroundTransparency = 1
    TitleL.Text = text
    TitleL.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleL.Font = Enum.Font.GothamBold
    TitleL.TextSize = 16
    TitleL.TextXAlignment = Enum.TextXAlignment.Left

    local Box = Instance.new("TextBox", TextboxFrame)
    Box.Size = UDim2.new(0.5, 0, 0.8, 0)
    Box.Position = UDim2.new(1, -5, 0.5, 0)
    Box.AnchorPoint = Vector2.new(1, 0.5)
    Box.BackgroundColor3 = Color3.fromRGB(60, 20, 80)
    Box.BackgroundTransparency = 0.5
    Box.PlaceholderText = placeholder
    Box.PlaceholderColor3 = Color3.fromRGB(200, 200, 200)
    Box.Text = ""
    Box.TextColor3 = Color3.fromRGB(255, 255, 255)
    Box.Font = Enum.Font.Gotham
    Box.TextSize = 16
    
    local UICorner = Instance.new("UICorner", Box)
    UICorner.CornerRadius = UDim.new(0, 12)
    
    local UIPadding = Instance.new("UIPadding", Box)
    UIPadding.PaddingLeft = UDim.new(0, 15)
    UIPadding.PaddingRight = UDim.new(0, 15)
    
    Box.FocusLost:Connect(function() 
        if callback then callback(Box.Text) end
    end)
    
    TextboxFrame.SetValue = function(value)
        Box.Text = tostring(value)
    end
    
    TextboxFrame.GetValue = function()
        return Box.Text
    end
    
    return TextboxFrame
end

-- 8. KEYBIND
local function AddKeybind(parent, text, default, callback)
    local KeybindFrame = Instance.new("Frame", parent)
    KeybindFrame.Size = UDim2.new(0.96, 0, 0, 40)
    KeybindFrame.BackgroundTransparency = 1
    
    local TitleL = Instance.new("TextLabel", KeybindFrame)
    TitleL.Size = UDim2.new(0.6, 0, 1, 0)
    TitleL.BackgroundTransparency = 1
    TitleL.Text = text
    TitleL.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleL.Font = Enum.Font.GothamBold
    TitleL.TextSize = 14
    TitleL.TextXAlignment = Enum.TextXAlignment.Left
    
    local KeyBtn = Instance.new("TextButton", KeybindFrame)
    KeyBtn.Size = UDim2.new(0, 80, 0.8, 0)
    KeyBtn.Position = UDim2.new(1, -5, 0.5, 0)
    KeyBtn.AnchorPoint = Vector2.new(1, 0.5)
    KeyBtn.BackgroundColor3 = Color3.fromRGB(60, 20, 80)
    KeyBtn.Text = default or "None"
    KeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyBtn.Font = Enum.Font.GothamBold
    KeyBtn.TextSize = 13
    KeyBtn.AutoButtonColor = false
    Instance.new("UICorner", KeyBtn).CornerRadius = UDim.new(0, 6)
    
    local currentKey = default
    local binding = false
    
    KeyBtn.MouseButton1Click:Connect(function()
        if not binding then
            binding = true
            KeyBtn.Text = "..."
            
            local connection
            connection = UserInputService.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    local key = input.KeyCode.Name
                    currentKey = key
                    KeyBtn.Text = key
                    binding = false
                    connection:Disconnect()
                    if callback then callback(key) end
                end
            end)
        end
    end)
    
    KeybindFrame.SetValue = function(key)
        currentKey = key
        KeyBtn.Text = key
    end
    
    KeybindFrame.GetValue = function()
        return currentKey
    end
    
    return KeybindFrame
end

-- 9. COLOR PICKER
local function AddColorPicker(parent, text, default, callback)
    local ColorFrame = Instance.new("Frame", parent)
    ColorFrame.Size = UDim2.new(0.96, 0, 0, 40)
    ColorFrame.BackgroundTransparency = 1
    
    local TitleL = Instance.new("TextLabel", ColorFrame)
    TitleL.Size = UDim2.new(0.7, 0, 1, 0)
    TitleL.BackgroundTransparency = 1
    TitleL.Text = text
    TitleL.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleL.Font = Enum.Font.GothamBold
    TitleL.TextSize = 14
    TitleL.TextXAlignment = Enum.TextXAlignment.Left
    
    local ColorBox = Instance.new("TextButton", ColorFrame)
    ColorBox.Size = UDim2.fromOffset(35, 25)
    ColorBox.Position = UDim2.new(1, -5, 0.5, 0)
    ColorBox.AnchorPoint = Vector2.new(1, 0.5)
    ColorBox.BackgroundColor3 = default or Color3.fromRGB(255, 0, 200)
    ColorBox.Text = ""
    ColorBox.AutoButtonColor = false
    Instance.new("UICorner", ColorBox).CornerRadius = UDim.new(0, 4)
    
    local Stroke = Instance.new("UIStroke", ColorBox)
    Stroke.Color = Color3.fromRGB(255, 255, 255)
    Stroke.Thickness = 1
    
    local currentColor = default or Color3.fromRGB(255, 0, 200)
    
    -- Simple color picker (you can expand this with RGB sliders)
    ColorBox.MouseButton1Click:Connect(function()
        -- This is a placeholder - implement full color picker UI if needed
        local r = math.random(0, 255)
        local g = math.random(0, 255)
        local b = math.random(0, 255)
        currentColor = Color3.fromRGB(r, g, b)
        ColorBox.BackgroundColor3 = currentColor
        if callback then callback(currentColor) end
    end)
    
    ColorFrame.SetValue = function(color)
        currentColor = color
        ColorBox.BackgroundColor3 = color
    end
    
    ColorFrame.GetValue = function()
        return currentColor
    end
    
    return ColorFrame
end

-- ===============================
-- TAB CREATION
-- ===============================
local Icons = {
    ["Info"] = "rbxassetid://73226695432849",
    ["Fishing"] = "rbxassetid://114347642817960",
    ["Shop"] = "rbxassetid://104166424776310",
    ["Automatically"] = "rbxassetid://104166424776310",
    ["Trading"] = "rbxassetid://90028412534804",
    ["Menu"] = "rbxassetid://91003594521266",
    ["Quest"] = "rbxassetid://102931003401592",
    ["Teleport"] = "rbxassetid://79671642021972",
    ["Webhook"] = "rbxassetid://100592907832268",
    ["Misc"] = "rbxassetid://99052235164442",
    ["Config"] = "rbxassetid://88665465259311",
}

local currentIndicator = nil

local function CreateTab(text, iconId)
    tabCount = tabCount + 1
    local TabBtn = Instance.new("TextButton", Sidebar)
    TabBtn.Name = text .. "_Tab"
    TabBtn.LayoutOrder = tabCount
    TabBtn.Size = UDim2.new(1, -10, 0, 38)
    TabBtn.BackgroundTransparency = 1
    TabBtn.Text = ""
    TabBtn.AutoButtonColor = false
    Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 6)

    local Indicator = Instance.new("Frame", TabBtn)
    Indicator.BackgroundColor3 = Color3.fromRGB(255, 0, 210)
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

-- ===============================
-- LIBRARY RETURN
-- ===============================
local Library = {
    CreateTab = CreateTab,
    AddParagraph = AddParagraph,
    AddButton = AddButton,
    AddToggle = AddToggle,
    AddSlider = AddSlider,
    AddDropdown = AddDropdown,
    AddSection = AddSection,
    AddTextbox = AddTextbox,
    AddKeybind = AddKeybind,
    AddColorPicker = AddColorPicker,
}

return Library
