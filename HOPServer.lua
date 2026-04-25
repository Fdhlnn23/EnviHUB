local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Stats = game:GetService("Stats")

local player = Players.LocalPlayer
local placeId = game.PlaceId

local MAX_PING = 90
local checkedServers = {}

-- ambil ping
local function getPing()
    local pingStr = Stats.Network.ServerStatsItem["Data Ping"]:GetValueString()
    local ping = tonumber(string.match(pingStr, "%d+"))
    return ping
end

-- ambil server
local function getServers(cursor)
    local url = "https://games.roblox.com/v1/games/"..placeId.."/servers/Public?sortOrder=Asc&limit=100"
    if cursor then
        url = url .. "&cursor=" .. cursor
    end
    
    local success, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(url))
    end)
    
    if success then
        return result
    end
end

-- cari server
local function findServer()
    local cursor = nil
    
    for i = 1,5 do
        local data = getServers(cursor)
        if not data then break end
        
        for _, server in pairs(data.data) do
            if server.playing < server.maxPlayers - 3 then
                if not checkedServers[server.id] then
                    checkedServers[server.id] = true
                    return server.id
                end
            end
        end
        
        cursor = data.nextPageCursor
        if not cursor then break end
    end
end

-- function utama
local function main()
    while true do
        task.wait(5)
        
        local ping = getPing()
        print("Ping:", ping)

        if ping and ping <= MAX_PING then
            print("✅ Dapet server bagus, stop.")
            break
        end

        print("❌ Ping tinggi, pindah server...")

        local serverId = findServer()
        
        if serverId then
            -- ini kunci nya!
            if queue_on_teleport then
                queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/Fdhlnn23/EnviHUB/refs/heads/main/HOPServer.lua"))
            end
            
            task.wait(2)
            TeleportService:TeleportToPlaceInstance(placeId, serverId, player)
        else
            print("Retry cari server...")
            task.wait(3)
        end
    end
end

main()
