local Elements = {}

function Elements:Paragraph(tab, theme, opt)
    local box = Instance.new("Frame", tab)
    box.Size = UDim2.new(1,-16,0,50)
    box.BackgroundColor3 = theme.Panel
    box.BorderSizePixel = 0
    Instance.new("UICorner", box).CornerRadius = UDim.new(0,10)

    local stroke = Instance.new("UIStroke", box)
    stroke.Color = theme.Stroke

    local txt = Instance.new("TextLabel", box)
    txt.Size = UDim2.new(1,-20,1,0)
    txt.Position = UDim2.new(0,10,0,0)
    txt.TextWrapped = true
    txt.TextXAlignment = Left
    txt.Text = opt.Title or "Paragraph"
    txt.Font = Enum.Font.Gotham
    txt.TextSize = 13
    txt.TextColor3 = opt.Locked and theme.Muted or theme.Text
    txt.BackgroundTransparency = 1
end

function Elements:Button(tab, theme, opt)
    local btn = Instance.new("TextButton", tab)
    btn.Size = UDim2.new(1,-16,0,40)
    btn.Text = opt.Title or "Button"
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 13
    btn.TextColor3 = theme.Text
    btn.BackgroundColor3 = theme.Panel
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,10)

    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = theme.Stroke

    btn.MouseButton1Click:Connect(function()
        if opt.Callback then
            opt.Callback()
        end
    end)
end

function Elements:Toggle(tab, theme, opt)
    local frame = Instance.new("Frame", tab)
    frame.Size = UDim2.new(1,-16,0,40)
    frame.BackgroundColor3 = theme.Panel
    frame.BorderSizePixel = 0
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0,10)

    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = theme.Stroke

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1,-60,1,0)
    label.Position = UDim2.new(0,10,0,0)
    label.TextXAlignment = Left
    label.Text = opt.Title or "Toggle"
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextColor3 = theme.Text
    label.BackgroundTransparency = 1

    local toggle = Instance.new("TextButton", frame)
    toggle.Size = UDim2.new(0,40,0,20)
    toggle.Position = UDim2.new(1,-50,0.5,-10)
    toggle.Text = ""
    toggle.BackgroundColor3 = theme.Background
    toggle.BorderSizePixel = 0
    Instance.new("UICorner", toggle).CornerRadius = UDim.new(1,0)

    local state = false

    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.BackgroundColor3 = state and theme.Accent or theme.Background
        if opt.Callback then
            opt.Callback(state)
        end
    end)
end

function Elements:Dropdown(tab, theme, opt)
    local frame = Instance.new("Frame", tab)
    frame.Size = UDim2.new(1,-16,0,40)
    frame.BackgroundColor3 = theme.Panel
    frame.BorderSizePixel = 0
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0,10)

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1,-20,1,0)
    label.Position = UDim2.new(0,10,0,0)
    label.TextXAlignment = Left
    label.Text = opt.Title.." : "..(opt.Default or "")
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextColor3 = theme.Text
    label.BackgroundTransparency = 1

    frame.InputBegan:Connect(function()
        local value = opt.Options[math.random(1,#opt.Options)]
        label.Text = opt.Title.." : "..value
        if opt.Callback then
            opt.Callback(value)
        end
    end)
end

return Elements
