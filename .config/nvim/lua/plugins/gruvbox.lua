return {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    terminal_colors = true,
    opts = {
        italic = {
            strings = false,
            emphasis = false,
            comments = false,
            operators = false,
            folds = false,
        },
        contrast = 'hard',
    },
    config = function(_, opts)
        local gruvbox = require('gruvbox')
        gruvbox.setup(opts)
        gruvbox.load()
    end,
}
