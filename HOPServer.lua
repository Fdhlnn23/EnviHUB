local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Stats = game:GetService("Stats")

local player = Players.LocalPlayer
local placeId = game.PlaceId

local MAX_PING = 90

-- ambil ping
local function getPing()
    local pingStr = Stats.Network.ServerStatsItem["Data Ping"]:GetValueString()
    return tonumber(string.match(pingStr, "%d+"))
end

-- ambil server list
local function getServers(cursor)
    local url = "https://games.roblox.com/v1/games/"..placeId.."/servers/Public?sortOrder=Asc&limit=100"
    if cursor then
        url = url .. "&cursor=" .. cursor
    end
    
    local success, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(url))
    end)
    
    if success then return result end
end

-- cari server
local function findServer()
    local cursor = nil
    
    for i = 1,5 do
        local data = getServers(cursor)
        if not data then break end
        
        for _, s in pairs(data.data) do
            if s.playing < s.maxPlayers - 3 then
                return s.id
            end
        end
        
        cursor = data.nextPageCursor
        if not cursor then break end
    end
end

-- 🔥 penting: isi script diri sendiri (self-queue)
local SOURCE = [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/Fdhlnn23/EnviHUB/refs/heads/main/HOPServer.lua"))()
]]

-- loop utama
while true do
    task.wait(5)

    local ping = getPing()
    print("Ping:", ping)

    if ping and ping <= MAX_PING then
        print("✅ Udah dapet server bagus, stop.")
        break
    end

    print("❌ Ping jelek, hopping...")

    local serverId = findServer()

    if serverId then
        -- 🔑 ini biar terus jalan tiap teleport
        if queue_on_teleport then
            queue_on_teleport(SOURCE)
        elseif syn and syn.queue_on_teleport then
            syn.queue_on_teleport(SOURCE)
        end

        task.wait(2)
        TeleportService:TeleportToPlaceInstance(placeId, serverId, player)
    else
        task.wait(3)
    end
end
