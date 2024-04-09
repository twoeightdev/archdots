return {
    'folke/which-key.nvim',
    keys = { '<leader>', '"', "'", '`', 'c', 'y', 'd', 'z', 'g', '[', ']', '<C-w>' },
    opts = {
        operators = { gc = 'Comments' },
        defaults = {
            mode = { 'n', 'v' },
            ['g'] = { name = '+goto' },
            ['gc'] = { name = '+comments' },
            ['gz'] = { name = '+surround' },
            ['z'] = { name = '+folds' },
            [']'] = { name = 'next' },
            ['['] = { name = 'prev' },
            ['<leader>q'] = { name = '+quit/session' },
            ['<leader>f'] = { name = '+find' },
            ['<leader>b'] = { name = '+buffers' },
            ['<leader>g'] = { name = '+git' },
            ['<leader>x'] = { name = '+diagnostics/quickfix' },
            ['<leader>d'] = { name = '+debugger' },
        },
    },
    config = function(_, opts)
        local wk = require('which-key')
        wk.setup(opts)
        wk.register(opts.defaults)
    end,
}
