-- ENVI UI LOADER (RAW GITHUB)

local BASE =
    "https://raw.githubusercontent.com/USERNAME/REPO/main/src/"

local Files = {
    ["init"] = "init.lua",
    ["window"] = "window.lua",
    ["elements"] = "elements.lua",
    ["icons"] = "icons.lua",
    ["theme"] = "theme.lua",
}

local Modules = {}

local function fakeRequire(name)
    if Modules[name] then
        return Modules[name]
    end
    error("Module not found: "..name)
end

-- load all modules
for key, file in pairs(Files) do
    local src = game:HttpGet(BASE .. file)
    local fn = loadstring(src)
    setfenv(fn, setmetatable({
        require = fakeRequire,
        script = { Parent = {} },
    }, { __index = getfenv() }))
    Modules[key] = fn()
end

return Modules.init
