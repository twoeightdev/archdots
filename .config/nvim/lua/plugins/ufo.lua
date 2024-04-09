return {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = { 'BufReadPost', 'BufNewFile' },
    keys = {
        {
            'zR',
            function()
                return require('ufo').openAllFolds()
            end,
            desc = 'Open all folds',
        },
        {
            'zM',
            function()
                return require('ufo').closeAllFolds()
            end,
            desc = 'Close all folds',
        },
    },
    opts = {
        provider_selector = function(_, filetype, buftype)
            return (filetype == '' or buftype == 'nofile') and 'indent' or { 'treesitter', 'indent' }
        end,
    },
}
