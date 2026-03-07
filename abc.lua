-- Gui to Lua
-- Version: 3.2

-- Instances:

local MusicPanel = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local BagianBawah = Instance.new("Frame")
local IconMusic = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local PembuatLagu = Instance.new("TextLabel")
local JudulLagu = Instance.new("TextLabel")
local DurasiMusic = Instance.new("Frame")
local Durasi = Instance.new("Frame")
local DurasiJalan = Instance.new("Frame")
local MenitSekarang = Instance.new("TextLabel")
local TotalMenitLagu = Instance.new("TextLabel")
local Play = Instance.new("ImageButton")
local Next = Instance.new("ImageButton")
local Previous = Instance.new("ImageButton")
local BackgroundMusic = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local IconMusic_2 = Instance.new("ImageLabel")
local UICorner_4 = Instance.new("UICorner")
local JudulPembuat = Instance.new("TextLabel")
local SearchBox = Instance.new("Frame")
local SearchInput = Instance.new("TextBox")
local UICorner_5 = Instance.new("UICorner")
local ListMusic = Instance.new("ScrollingFrame")
local Next_2 = Instance.new("TextLabel")
local NowPlaying = Instance.new("TextLabel")
local TemplateNow = Instance.new("Frame")
local IconMusic_3 = Instance.new("ImageLabel")
local JudulLagu_2 = Instance.new("TextLabel")
local PembuatLagu_2 = Instance.new("TextLabel")
local TemplateNext = Instance.new("Frame")
local IconMusic_4 = Instance.new("ImageLabel")
local JudulLagu_3 = Instance.new("TextLabel")
local PembuatLagu_3 = Instance.new("TextLabel")
local UIListLayout = Instance.new("UIListLayout")
local SearchMusic = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local ListSearch = Instance.new("Frame")
local TemplateSearch = Instance.new("Frame")
local IconMusic_5 = Instance.new("ImageButton")
local TextButton = Instance.new("TextButton")
local JudulLagu_4 = Instance.new("TextLabel")
local PembuatLagu_4 = Instance.new("TextLabel")
local UIListLayout_2 = Instance.new("UIListLayout")
local Divider = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local NotFound = Instance.new("TextLabel")
local Frame_2 = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")

--Properties:

MusicPanel.Name = "MusicPanel"
MusicPanel.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
MusicPanel.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = MusicPanel
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.114427857, 0, 0.101361573, 0)
Frame.Size = UDim2.new(0.769999981, 0, 0.800000012, 0)

UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = Frame

BagianBawah.Name = "BagianBawah"
BagianBawah.Parent = Frame
BagianBawah.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BagianBawah.BackgroundTransparency = 3.000
BagianBawah.BorderColor3 = Color3.fromRGB(0, 0, 0)
BagianBawah.BorderSizePixel = 0
BagianBawah.Position = UDim2.new(0, 0, 0.870000005, 0)
BagianBawah.Size = UDim2.new(1, 0, 0.129999995, 0)

IconMusic.Name = "IconMusic"
IconMusic.Parent = BagianBawah
IconMusic.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
IconMusic.BackgroundTransparency = 1.000
IconMusic.BorderColor3 = Color3.fromRGB(0, 0, 0)
IconMusic.BorderSizePixel = 0
IconMusic.Position = UDim2.new(0.0221520886, 0, 0.101827078, 0)
IconMusic.Size = UDim2.new(0.06, 0, 0.785523176, 0)
IconMusic.Image = "rbxassetid://120133315735968"
IconMusic.ScaleType = Enum.ScaleType.Crop

UICorner_2.CornerRadius = UDim.new(0, 12)
UICorner_2.Parent = IconMusic

PembuatLagu.Name = "PembuatLagu"
PembuatLagu.Parent = IconMusic
PembuatLagu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PembuatLagu.BackgroundTransparency = 1.000
PembuatLagu.BorderColor3 = Color3.fromRGB(0, 0, 0)
PembuatLagu.BorderSizePixel = 0
PembuatLagu.Position = UDim2.new(1.12903678, 0, 0.502592862, 0)
PembuatLagu.Size = UDim2.new(3.21102262, 0, 0.399999976, 0)
PembuatLagu.Font = Enum.Font.Gotham
PembuatLagu.Text = "Lorem Ipsum"
PembuatLagu.TextColor3 = Color3.fromRGB(255, 255, 255)
PembuatLagu.TextSize = 20.000
PembuatLagu.TextXAlignment = Enum.TextXAlignment.Left

JudulLagu.Name = "JudulLagu"
JudulLagu.Parent = IconMusic
JudulLagu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
JudulLagu.BackgroundTransparency = 1.000
JudulLagu.BorderColor3 = Color3.fromRGB(0, 0, 0)
JudulLagu.BorderSizePixel = 0
JudulLagu.Position = UDim2.new(1.12903702, 0, 0.179999456, 0)
JudulLagu.Size = UDim2.new(3.21102095, 0, 0.399999976, 0)
JudulLagu.Font = Enum.Font.GothamBold
JudulLagu.Text = "Lorem Ipsum"
JudulLagu.TextColor3 = Color3.fromRGB(255, 255, 255)
JudulLagu.TextSize = 20.000
JudulLagu.TextXAlignment = Enum.TextXAlignment.Left

DurasiMusic.Name = "DurasiMusic"
DurasiMusic.Parent = BagianBawah
DurasiMusic.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DurasiMusic.BorderColor3 = Color3.fromRGB(0, 0, 0)
DurasiMusic.BorderSizePixel = 0
DurasiMusic.Position = UDim2.new(0.289710343, 0, 0.136359572, 0)
DurasiMusic.Size = UDim2.new(0.420579344, 0, 0.661842048, 0)
DurasiMusic.ZIndex = 2

Durasi.Name = "Durasi"
Durasi.Parent = DurasiMusic
Durasi.BackgroundColor3 = Color3.fromRGB(139, 139, 139)
Durasi.BorderColor3 = Color3.fromRGB(0, 0, 0)
Durasi.BorderSizePixel = 0
Durasi.Position = UDim2.new(0.151676208, 0, 0.769270241, 0)
Durasi.Size = UDim2.new(0.699308276, 0, 0.100000001, 0)

DurasiJalan.Name = "DurasiJalan"
DurasiJalan.Parent = Durasi
DurasiJalan.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DurasiJalan.BorderColor3 = Color3.fromRGB(0, 0, 0)
DurasiJalan.BorderSizePixel = 0
DurasiJalan.Size = UDim2.new(0.00541265449, 0, 1, 0)

MenitSekarang.Name = "MenitSekarang"
MenitSekarang.Parent = DurasiMusic
MenitSekarang.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MenitSekarang.BackgroundTransparency = 1.000
MenitSekarang.BorderColor3 = Color3.fromRGB(0, 0, 0)
MenitSekarang.BorderSizePixel = 0
MenitSekarang.Position = UDim2.new(0, 0, 0.659374475, 0)
MenitSekarang.Size = UDim2.new(0, 51, 0, 13)
MenitSekarang.Font = Enum.Font.Gotham
MenitSekarang.Text = "00:00"
MenitSekarang.TextColor3 = Color3.fromRGB(255, 255, 255)
MenitSekarang.TextSize = 16.000

TotalMenitLagu.Name = "TotalMenitLagu"
TotalMenitLagu.Parent = DurasiMusic
TotalMenitLagu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TotalMenitLagu.BackgroundTransparency = 1.000
TotalMenitLagu.BorderColor3 = Color3.fromRGB(0, 0, 0)
TotalMenitLagu.BorderSizePixel = 0
TotalMenitLagu.Position = UDim2.new(0.846199691, 0, 0.659374475, 0)
TotalMenitLagu.Size = UDim2.new(0, 51, 0, 13)
TotalMenitLagu.Font = Enum.Font.Gotham
TotalMenitLagu.Text = "00:00"
TotalMenitLagu.TextColor3 = Color3.fromRGB(255, 255, 255)
TotalMenitLagu.TextSize = 16.000

Play.Name = "Play"
Play.Parent = DurasiMusic
Play.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Play.BackgroundTransparency = 1.000
Play.BorderColor3 = Color3.fromRGB(0, 0, 0)
Play.BorderSizePixel = 0
Play.Position = UDim2.new(0.450316787, 0, 0.0219791494, 0)
Play.Size = UDim2.new(0, 31, 0, 31)
Play.Image = "rbxassetid://98696058719618"

Next.Name = "Next"
Next.Parent = DurasiMusic
Next.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Next.BackgroundTransparency = 1.000
Next.BorderColor3 = Color3.fromRGB(0, 0, 0)
Next.BorderSizePixel = 0
Next.Position = UDim2.new(0.582789898, 0, 0.0219791494, 0)
Next.Size = UDim2.new(0, 31, 0, 31)
Next.Image = "rbxassetid://136640827187388"

Previous.Name = "Previous"
Previous.Parent = DurasiMusic
Previous.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Previous.BackgroundTransparency = 1.000
Previous.BorderColor3 = Color3.fromRGB(0, 0, 0)
Previous.BorderSizePixel = 0
Previous.Position = UDim2.new(0.317843556, 0, 0.0219791494, 0)
Previous.Size = UDim2.new(0, 31, 0, 31)
Previous.Image = "rbxassetid://113161310770080"

BackgroundMusic.Name = "BackgroundMusic"
BackgroundMusic.Parent = Frame
BackgroundMusic.BackgroundColor3 = Color3.fromRGB(60, 8, 112)
BackgroundMusic.BorderColor3 = Color3.fromRGB(0, 0, 0)
BackgroundMusic.BorderSizePixel = 0
BackgroundMusic.Position = UDim2.new(0.0212249625, 0, 0.0850983113, 0)
BackgroundMusic.Size = UDim2.new(0.720072031, 0, 0.767776191, 0)

UICorner_3.CornerRadius = UDim.new(0, 15)
UICorner_3.Parent = BackgroundMusic

IconMusic_2.Name = "IconMusic"
IconMusic_2.Parent = BackgroundMusic
IconMusic_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
IconMusic_2.BackgroundTransparency = 1.000
IconMusic_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
IconMusic_2.BorderSizePixel = 0
IconMusic_2.Position = UDim2.new(0.170220107, 0, 0.13597095, 0)
IconMusic_2.Size = UDim2.new(0.581110239, 0, 0.785523117, 0)
IconMusic_2.Image = "rbxassetid://120133315735968"
IconMusic_2.ScaleType = Enum.ScaleType.Crop

UICorner_4.CornerRadius = UDim.new(0, 15)
UICorner_4.Parent = IconMusic_2

JudulPembuat.Name = "Judul-Pembuat"
JudulPembuat.Parent = BackgroundMusic
JudulPembuat.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
JudulPembuat.BackgroundTransparency = 1.000
JudulPembuat.BorderColor3 = Color3.fromRGB(0, 0, 0)
JudulPembuat.BorderSizePixel = 0
JudulPembuat.Position = UDim2.new(0.0250061918, 0, 0.0275229346, 0)
JudulPembuat.Size = UDim2.new(0, 263, 0, 21)
JudulPembuat.Font = Enum.Font.GothamBold
JudulPembuat.Text = "Lorem Ipsum - Lorem Ipsum"
JudulPembuat.TextColor3 = Color3.fromRGB(255, 255, 255)
JudulPembuat.TextSize = 20.000
JudulPembuat.TextXAlignment = Enum.TextXAlignment.Left

SearchBox.Name = "SearchBox"
SearchBox.Parent = Frame
SearchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.BackgroundTransparency = 1.000
SearchBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
SearchBox.BorderSizePixel = 0
SearchBox.Position = UDim2.new(0.24425599, 0, -0.00189107412, 0)
SearchBox.Size = UDim2.new(0.518978, 0, 0.0850983113, 0)
SearchBox.ZIndex = 2

SearchInput.Name = "SearchInput"
SearchInput.Parent = SearchBox
SearchInput.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
SearchInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
SearchInput.BorderSizePixel = 0
SearchInput.Position = UDim2.new(0.115689807, 0, 0.155555785, 0)
SearchInput.Size = UDim2.new(0.768145442, 0, 0.699999869, 0)
SearchInput.Font = Enum.Font.Gotham
SearchInput.PlaceholderText = "Search"
SearchInput.Text = ""
SearchInput.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchInput.TextSize = 22.000

UICorner_5.CornerRadius = UDim.new(0, 15)
UICorner_5.Parent = SearchInput

ListMusic.Name = "ListMusic"
ListMusic.Parent = Frame
ListMusic.Active = true
ListMusic.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
ListMusic.BackgroundTransparency = 1.000
ListMusic.BorderColor3 = Color3.fromRGB(0, 0, 0)
ListMusic.BorderSizePixel = 0
ListMusic.Position = UDim2.new(0.765860796, 0, 0.106229797, 0)
ListMusic.Size = UDim2.new(0.20907861, 0, 0.746644676, 0)
ListMusic.ZIndex = 2
ListMusic.ScrollBarThickness = 0

Next_2.Name = "Next"
Next_2.Parent = ListMusic
Next_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Next_2.BackgroundTransparency = 1.000
Next_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Next_2.BorderSizePixel = 0
Next_2.LayoutOrder = 3
Next_2.Position = UDim2.new(0, 0, 0.0609896816, 0)
Next_2.Size = UDim2.new(0, 164, 0, 22)
Next_2.Font = Enum.Font.GothamBold
Next_2.Text = "Next"
Next_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Next_2.TextSize = 20.000
Next_2.TextXAlignment = Enum.TextXAlignment.Left

NowPlaying.Name = "NowPlaying"
NowPlaying.Parent = ListMusic
NowPlaying.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NowPlaying.BackgroundTransparency = 1.000
NowPlaying.BorderColor3 = Color3.fromRGB(0, 0, 0)
NowPlaying.BorderSizePixel = 0
NowPlaying.LayoutOrder = 1
NowPlaying.Position = UDim2.new(0.0338982828, 0, 0.0325363688, 0)
NowPlaying.Size = UDim2.new(0, 164, 0, 22)
NowPlaying.Font = Enum.Font.GothamBold
NowPlaying.Text = "Now Playing"
NowPlaying.TextColor3 = Color3.fromRGB(255, 255, 255)
NowPlaying.TextSize = 20.000
NowPlaying.TextXAlignment = Enum.TextXAlignment.Left

TemplateNow.Name = "TemplateNow"
TemplateNow.Parent = ListMusic
TemplateNow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TemplateNow.BackgroundTransparency = 1.000
TemplateNow.BorderColor3 = Color3.fromRGB(0, 0, 0)
TemplateNow.BorderSizePixel = 0
TemplateNow.LayoutOrder = 2
TemplateNow.Position = UDim2.new(-0.00564936874, 0, 0.0203943178, 0)
TemplateNow.Size = UDim2.new(0.999999285, 0, 0.0382095873, 0)

IconMusic_3.Name = "IconMusic"
IconMusic_3.Parent = TemplateNow
IconMusic_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
IconMusic_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
IconMusic_3.BorderSizePixel = 0
IconMusic_3.Position = UDim2.new(0.0395090394, 0, 0.122850135, 0)
IconMusic_3.Size = UDim2.new(0, 30, 0, 30)
IconMusic_3.Image = "rbxassetid://120133315735968"

JudulLagu_2.Name = "JudulLagu"
JudulLagu_2.Parent = IconMusic_3
JudulLagu_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
JudulLagu_2.BackgroundTransparency = 1.000
JudulLagu_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
JudulLagu_2.BorderSizePixel = 0
JudulLagu_2.Position = UDim2.new(1.13333333, 0, 0, 0)
JudulLagu_2.Size = UDim2.new(0, 136, 0, 12)
JudulLagu_2.Font = Enum.Font.GothamBold
JudulLagu_2.Text = "Lorem Ipsum"
JudulLagu_2.TextColor3 = Color3.fromRGB(255, 255, 255)
JudulLagu_2.TextSize = 17.000
JudulLagu_2.TextXAlignment = Enum.TextXAlignment.Left

PembuatLagu_2.Name = "PembuatLagu"
PembuatLagu_2.Parent = IconMusic_3
PembuatLagu_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PembuatLagu_2.BackgroundTransparency = 1.000
PembuatLagu_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
PembuatLagu_2.BorderSizePixel = 0
PembuatLagu_2.Position = UDim2.new(1.13333333, 0, 0.414634198, 0)
PembuatLagu_2.Size = UDim2.new(0, 136, 0, 17)
PembuatLagu_2.Font = Enum.Font.Gotham
PembuatLagu_2.Text = "Lorem Ipsum"
PembuatLagu_2.TextColor3 = Color3.fromRGB(255, 255, 255)
PembuatLagu_2.TextSize = 17.000
PembuatLagu_2.TextXAlignment = Enum.TextXAlignment.Left

TemplateNext.Name = "TemplateNext"
TemplateNext.Parent = ListMusic
TemplateNext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TemplateNext.BackgroundTransparency = 1.000
TemplateNext.BorderColor3 = Color3.fromRGB(0, 0, 0)
TemplateNext.BorderSizePixel = 0
TemplateNext.LayoutOrder = 4
TemplateNext.Position = UDim2.new(0, 0, 0.112518914, 0)
TemplateNext.Size = UDim2.new(0.999999285, 0, 0.0382095873, 0)

IconMusic_4.Name = "IconMusic"
IconMusic_4.Parent = TemplateNext
IconMusic_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
IconMusic_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
IconMusic_4.BorderSizePixel = 0
IconMusic_4.Position = UDim2.new(0.0395090394, 0, 0.122850135, 0)
IconMusic_4.Size = UDim2.new(0, 30, 0, 30)
IconMusic_4.Image = "rbxassetid://120133315735968"

JudulLagu_3.Name = "JudulLagu"
JudulLagu_3.Parent = IconMusic_4
JudulLagu_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
JudulLagu_3.BackgroundTransparency = 1.000
JudulLagu_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
JudulLagu_3.BorderSizePixel = 0
JudulLagu_3.Position = UDim2.new(1.13333333, 0, 0, 0)
JudulLagu_3.Size = UDim2.new(0, 136, 0, 12)
JudulLagu_3.Font = Enum.Font.GothamBold
JudulLagu_3.Text = "Lorem Ipsum"
JudulLagu_3.TextColor3 = Color3.fromRGB(255, 255, 255)
JudulLagu_3.TextSize = 17.000
JudulLagu_3.TextXAlignment = Enum.TextXAlignment.Left

PembuatLagu_3.Name = "PembuatLagu"
PembuatLagu_3.Parent = IconMusic_4
PembuatLagu_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PembuatLagu_3.BackgroundTransparency = 1.000
PembuatLagu_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
PembuatLagu_3.BorderSizePixel = 0
PembuatLagu_3.Position = UDim2.new(1.13333333, 0, 0.414634198, 0)
PembuatLagu_3.Size = UDim2.new(0, 136, 0, 17)
PembuatLagu_3.Font = Enum.Font.Gotham
PembuatLagu_3.Text = "Lorem Ipsum"
PembuatLagu_3.TextColor3 = Color3.fromRGB(255, 255, 255)
PembuatLagu_3.TextSize = 17.000
PembuatLagu_3.TextXAlignment = Enum.TextXAlignment.Left

UIListLayout.Parent = ListMusic
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

SearchMusic.Name = "SearchMusic"
SearchMusic.Parent = Frame
SearchMusic.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
SearchMusic.BorderColor3 = Color3.fromRGB(0, 0, 0)
SearchMusic.BorderSizePixel = 0
SearchMusic.Position = UDim2.new(0.304296404, 0, 0.0170196816, 0)
SearchMusic.Size = UDim2.new(0.398650557, 0, 0.408245087, 0)
SearchMusic.Visible = false

UICorner_6.CornerRadius = UDim.new(0, 15)
UICorner_6.Parent = SearchMusic

ListSearch.Name = "ListSearch"
ListSearch.Parent = SearchMusic
ListSearch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ListSearch.BackgroundTransparency = 1.000
ListSearch.BorderColor3 = Color3.fromRGB(0, 0, 0)
ListSearch.BorderSizePixel = 0
ListSearch.Position = UDim2.new(0, 0, 0.148230463, 0)
ListSearch.Size = UDim2.new(0, 310, 0, 183)

TemplateSearch.Name = "TemplateSearch"
TemplateSearch.Parent = ListSearch
TemplateSearch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TemplateSearch.BackgroundTransparency = 1.000
TemplateSearch.BorderColor3 = Color3.fromRGB(0, 0, 0)
TemplateSearch.BorderSizePixel = 0
TemplateSearch.LayoutOrder = 1
TemplateSearch.Position = UDim2.new(0, 0, 0.0203943308, 0)
TemplateSearch.Size = UDim2.new(1.00306904, 0, 0.211318508, 0)

IconMusic_5.Name = "IconMusic"
IconMusic_5.Parent = TemplateSearch
IconMusic_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
IconMusic_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
IconMusic_5.BorderSizePixel = 0
IconMusic_5.Position = UDim2.new(0.0399999991, 0, 0.123000003, 0)
IconMusic_5.Size = UDim2.new(0, 30, 0, 30)
IconMusic_5.Image = "rbxassetid://120133315735968"

TextButton.Parent = TemplateSearch
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.14815037, 0, 0.121857911, 0)
TextButton.Size = UDim2.new(0.819273174, 0, 0.800000012, 0)
TextButton.Font = Enum.Font.Gotham
TextButton.Text = ""
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000

JudulLagu_4.Name = "JudulLagu"
JudulLagu_4.Parent = TextButton
JudulLagu_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
JudulLagu_4.BackgroundTransparency = 1.000
JudulLagu_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
JudulLagu_4.BorderSizePixel = 0
JudulLagu_4.Position = UDim2.new(0.0154625494, 0, 0, 0)
JudulLagu_4.Size = UDim2.new(0, 136, 0, 12)
JudulLagu_4.Font = Enum.Font.GothamBold
JudulLagu_4.Text = "Lorem Ipsum"
JudulLagu_4.TextColor3 = Color3.fromRGB(255, 255, 255)
JudulLagu_4.TextSize = 17.000
JudulLagu_4.TextXAlignment = Enum.TextXAlignment.Left

PembuatLagu_4.Name = "PembuatLagu"
PembuatLagu_4.Parent = TextButton
PembuatLagu_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PembuatLagu_4.BackgroundTransparency = 1.000
PembuatLagu_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
PembuatLagu_4.BorderSizePixel = 0
PembuatLagu_4.Position = UDim2.new(0.0154625494, 0, 0.414634198, 0)
PembuatLagu_4.Size = UDim2.new(0, 136, 0, 17)
PembuatLagu_4.Font = Enum.Font.Gotham
PembuatLagu_4.Text = "Lorem Ipsum"
PembuatLagu_4.TextColor3 = Color3.fromRGB(255, 255, 255)
PembuatLagu_4.TextSize = 17.000
PembuatLagu_4.TextXAlignment = Enum.TextXAlignment.Left

UIListLayout_2.Parent = ListSearch
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

Divider.Name = "Divider"
Divider.Parent = SearchMusic
Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
Divider.BorderSizePixel = 0
Divider.Position = UDim2.new(-9.81425927e-08, 0, 0.143598333, 0)
Divider.Size = UDim2.new(0.999999821, 0, 0.00999999978, 0)
Divider.ZIndex = 2

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(53, 53, 53)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(53, 53, 53))}
UIGradient.Parent = Divider

NotFound.Name = "NotFound"
NotFound.Parent = SearchMusic
NotFound.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotFound.BackgroundTransparency = 1.000
NotFound.BorderColor3 = Color3.fromRGB(0, 0, 0)
NotFound.BorderSizePixel = 0
NotFound.Position = UDim2.new(0, 0, 0.150000006, 0)
NotFound.Size = UDim2.new(1, 0, 0.100000001, 0)
NotFound.Visible = false
NotFound.Font = Enum.Font.Gotham
NotFound.Text = "Not Found"
NotFound.TextColor3 = Color3.fromRGB(255, 255, 255)
NotFound.TextSize = 20.000

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.756281435, 0, 0.0832072645, 0)
Frame_2.Size = UDim2.new(0.226999998, 0, 0.769667208, 0)

UICorner_7.CornerRadius = UDim.new(0, 15)
UICorner_7.Parent = Frame_2
