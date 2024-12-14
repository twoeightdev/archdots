local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    install = {
        colorscheme = { "catppuccin" },
    },
    ui = {
        icons = {
            cmd = "  ",
            config = "  ",
            event = "  ",
            ft = "  ",
            init = "  ",
            imports = "  ",
            keys = "  ",
            lazy = " ",
            loaded = " ",
            not_loaded = " ",
            plugin = "  ",
            runtime = "  ",
            require = "  ",
            source = " ",
            start = "",
            task = "  ",
        },
        title = "󰒲 Lazy.nvim",
        custom_keys = { false },
        border = "single",
        backdrop = 100,
        wrap = false,
        size = {
            width = 0.9,
            height = 0.9,
        },
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = { notify = false },
    rocks = {
        enabled = false,
    },
    git = {
        log = { "--since=3 days ago", timeout = 120 },
    },
    diff = { cmd = "terminal_git" },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
                "rplugin",
                "matchparen",
                "matchit",
            },
        },
    },
})

-- Last Modified: Sun, 15 Dec 2024 12:04:07 AM
