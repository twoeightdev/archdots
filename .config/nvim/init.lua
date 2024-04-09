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
    vim.notify('Error loading ' .. module, vim.log.levels.ERROR)
end

-- Load modules
load_module('core.options')
load_module('core.keymaps')
load_module('core.autocommands')
load_module('core.bootstrap')
