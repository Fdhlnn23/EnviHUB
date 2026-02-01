local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

return function(cfg)
    local UI = require(script.Parent)
    local theme = UI.Theme
    local icons = UI.Icons
    local elements = UI.Elements

    local gui = Instance.new("ScreenGui", PlayerGui)
    gui.Name = "EnviUI"

    local main = Instance.new("Frame", gui)
    main.Size = UDim2.fromScale(0.7,0.75)
    main.Position = UDim2.fromScale(0.15,0.12)
    main.BackgroundColor3 = theme.Background
    Instance.new("UICorner", main).CornerRadius = UDim.new(0,12)

    local side = Instance.new("Frame", main)
    side.Size = UDim2.new(0,170,1,0)
    side.BackgroundColor3 = theme.Panel

    local content = Instance.new("Frame", main)
    content.Position = UDim2.new(0,170,0,0)
    content.Size = UDim2.new(1,-170,1,0)
    content.BackgroundTransparency = 1

    local Window = {}

    function Window:CreateTab(name)
        local btn = Instance.new("TextButton", side)
        btn.Size = UDim2.new(1,-12,0,36)
        btn.Text = (icons[name] or "•").."  "..name
        btn.TextXAlignment = Left
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 13
        btn.TextColor3 = theme.Text
        btn.BackgroundColor3 = theme.Background
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)

        local page = Instance.new("Frame", content)
        page.Size = UDim2.new(1,0,1,0)
        page.Visible = false

        btn.MouseButton1Click:Connect(function()
            for _,v in pairs(content:GetChildren()) do
                if v:IsA("Frame") then v.Visible = false end
            end
            page.Visible = true
        end)

        local Tab = {}

        function Tab:Paragraph(opt)
            elements:Paragraph(page, theme, opt)
        end

        function Tab:Button(opt)
            elements:Button(page, theme, opt)
        end

        function Tab:Toggle(opt)
            elements:Toggle(page, theme, opt)
        end

        function Tab:Dropdown(opt)
            elements:Dropdown(page, theme, opt)
        end

        return Tab
    end

    return Window
end
