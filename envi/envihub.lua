local EnviUI = require(game.ReplicatedStorage.EnviUI)

local Window = EnviUI:CreateWindow()

local Info = Window:CreateTab("Info")
Info:Paragraph({
    Title = "Envi Hub Information"
})

Info:Button({
    Title = "Join Discord",
    Callback = function()
        print("clicked")
    end
})
