local Elements = {}

function Elements:Paragraph(parent, theme, opt)
    local box = Instance.new("Frame", parent)
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
    txt.TextXAlignment = Enum.TextXAlignment.Left
    txt.TextYAlignment = Enum.TextYAlignment.Center
    txt.Text = opt.Title or "Paragraph"
    txt.Font = Enum.Font.Gotham
    txt.TextSize = 13
    txt.TextColor3 = opt.Locked and theme.Muted or theme.Text
    txt.BackgroundTransparency = 1
end

function Elements:Button(parent, theme, opt)
    local btn = Instance.new("TextButton", parent)
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

function Elements:Toggle(parent, theme, opt)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(1,-16,0,40)
    frame.BackgroundColor3 = theme.Panel
    frame.BorderSizePixel = 0
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0,10)

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1,-60,1,0)
    label.Position = UDim2.new(0,10,0,0)
    label.TextXAlignment = Enum.TextXAlignment.Left
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

function Elements:Dropdown(parent, theme, opt)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1,-16,0,40)
    btn.Text = opt.Title
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 13
    btn.TextColor3 = theme.Text
    btn.BackgroundColor3 = theme.Panel
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,10)

    local index = 1
    btn.MouseButton1Click:Connect(function()
        index = index % #opt.Options + 1
        btn.Text = opt.Title.." : "..opt.Options[index]
        if opt.Callback then
            opt.Callback(opt.Options[index])
        end
    end)
end

return Elements
