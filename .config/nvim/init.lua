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
_load("globals")
_load("keymaps")
_load("autocmds")
_load("bootstrap")
