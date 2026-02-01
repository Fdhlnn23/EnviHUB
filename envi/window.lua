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

    function Window:CreateTab(name)
        local btn = Instance.new("TextButton", sidebar)
        btn.Size = UDim2.new(1,-12,0,36)
        btn.Text = (Icons[name] or "•").."  "..name
        btn.TextXAlignment = Left
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 13
        btn.TextColor3 = Theme.Text
        btn.BackgroundColor3 = Theme.Background
        btn.BorderSizePixel = 0
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)

        local page = Instance.new("Frame", content)
        page.Size = UDim2.new(1,0,1,0)
        page.Visible = false
        page.BackgroundTransparency = 1

        btn.MouseButton1Click:Connect(function()
            for _,v in pairs(content:GetChildren()) do
                if v:IsA("Frame") then v.Visible = false end
            end
            page.Visible = true
        end)

        local Tab = {}

        function Tab:Paragraph(opt)
            Elements:Paragraph(page, Theme, opt)
        end
        function Tab:Button(opt)
            Elements:Button(page, Theme, opt)
        end
        function Tab:Toggle(opt)
            Elements:Toggle(page, Theme, opt)
        end
        function Tab:Dropdown(opt)
            Elements:Dropdown(page, Theme, opt)
        end

        return Tab
    end

    return Window
end
