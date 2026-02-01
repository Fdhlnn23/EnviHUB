-- ENVI HUB LOADER (STABLE VERSION)

local BASE =
"https://raw.githubusercontent.com/Fdhlnn23/EnviHUB/envi/"

local FILES = {
    "theme",
    "icons",
    "elements",
    "window",
    "init",
}

local Modules = {}

-- custom require
local function requireModule(name)
    if not Modules[name] then
        error("[EnviHUB] Module not loaded: "..name)
    end
    return Modules[name]
end

for _, name in ipairs(FILES) do
    local src = game:HttpGet(BASE .. name .. ".lua")
    local fn = loadstring(src)

    local env = setmetatable({
        require = requireModule,
        script = {},
    }, { __index = getfenv() })

    setfenv(fn, env)
    Modules[name] = fn()
end

return Modules.init
