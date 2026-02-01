-- ENVI HUB LOADER (RAW GITHUB)

local BASE =
"https://raw.githubusercontent.com/Fdhlnn23/EnviHUB/main/envi/"

local FILES = {
    init = "init.lua",
    window = "window.lua",
    elements = "elements.lua",
    icons = "icons.lua",
    theme = "theme.lua",
}

local Modules = {}

local function fakeRequire(name)
    if Modules[name] then
        return Modules[name]
    end
    error("Module not found: "..tostring(name))
end

for name, file in pairs(FILES) do
    local src = game:HttpGet(BASE .. file)
    local fn = loadstring(src)
    setfenv(fn, setmetatable({
        require = fakeRequire,
        script = {},
    }, { __index = getfenv() }))
    Modules[name] = fn()
end

return Modules.init
