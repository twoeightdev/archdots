-- Experimental loader
vim.loader.enable()

local function safereq(module)
    local success, err_msg = pcall(require, module)
    if not success then
        local msg = ("Error loading %s\n%s"):format(module, err_msg)
        vim.defer_fn(function()
            vim.notify(msg, vim.log.levels.ERROR)
        end, 1000)
    end
end

-- Load modules
safereq("core.options")
safereq("core.statusline")
safereq("core.winbar")
safereq("core.keymaps")
safereq("core.autocmds")
safereq("core.bootstrap")

-- Last Modified: Sat, 14 Dec 2024 08:22:00 PM
