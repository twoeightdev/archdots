return {
    "ellisonleao/gruvbox.nvim",
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
        contrast = "hard",
        overrides = {
            SignColumn = { bg = "#1d2021" },
            FoldColumn = { bg = "#1d2021" },
            MatchParen = { bg = "", fg = "#d79921", underline = true },
        },
    },
    config = function(_, opts)
        local gruvbox = require("gruvbox")
        gruvbox.setup(opts)
        gruvbox.load()
    end,
}
