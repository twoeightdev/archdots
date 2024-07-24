-- Enable experimental loader
vim.loader.enable()

-- Use pcall to load the modules
local function _load(module)
    local success, loaded = pcall(require, module)
    if success then
        return loaded
    end
end

-- Load modules
_load("core.options")
_load("core.keymaps")
_load("core.autocmds")
_load("core.bootstrap")
