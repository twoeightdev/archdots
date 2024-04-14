-- Enable experimental loader
vim.loader.enable()

-- Use pcall to load the modules
---@param module string
---@return any
local function load_module(module)
    ---@type boolean, any
    local success, loaded = pcall(require, module)
    if success then
        return loaded
    end
end

-- Load modules
load_module('options')
load_module('keymaps')
load_module('autocommands')
load_module('bootstrap')
