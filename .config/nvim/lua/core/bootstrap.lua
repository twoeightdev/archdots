-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
    git = { log = { '--since=3 days ago' }, timeout = 60 },
    ui = { custom_keys = { false }, backdrop = 100 },
    install = { colorscheme = { 'gruvbox' } },
    change_detection = {
        enabled = true,
        notify = false,
    },
    diff = {
        cmd = 'terminal_git',
    },
    performance = {
        rtp = {
            disabled_plugins = {
                'gzip',
                'netrwPlugin',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
                'rplugin',
                'matchparen',
                'matchit',
            },
        },
    },
}

-- Load plugins and options
require('lazy').setup('plugins', opts)
