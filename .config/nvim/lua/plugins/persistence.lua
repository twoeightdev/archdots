return {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = { options = vim.opt.sessionoptions:get() },
    keys = {
        {
            '<leader>qs',
            function()
                return require('persistence').load()
            end,
            desc = 'Restore the session for the current dir',
        },
        {
            '<leader>ql',
            function()
                return require('persistence').load({ last = true })
            end,
            desc = 'Restore the last session',
        },
        {
            '<leader>qd',
            function()
                return require('persistence').stop()
            end,
            desc = 'Stop persistence',
        },
    },
}
