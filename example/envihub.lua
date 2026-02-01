local EnviUI = require(game.ReplicatedStorage.envi)

local Window = EnviUI:CreateWindow()

local Info = Window:CreateTab("Info")
Info:Paragraph({
    Title = "Envi Hub Information"
})

Info:Button({
    Title = "Test Button",
    Callback = function()
        print("OK")
    end
})
