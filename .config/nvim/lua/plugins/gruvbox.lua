return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
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
            DiagnosticSignError = { bg = "none", fg = "#cc241d" },
            DiagnosticSignWarn = { bg = "none", fg = "#d79921" },
            DiagnosticSignHint = { bg = "none", fg = "#458588" },
            DiagnosticSignInfo = { bg = "none", fg = "#b16286" },
            -- DapUIWatchesEmpty = { bg = "#cc241d", fg = "#cc241d" },
            WhichKeyFloat = { bg = "#1d2021" },
        },
    },
    config = function(_, opts)
        local gruvbox = require("gruvbox")
        gruvbox.setup(opts)
        gruvbox.load()
    end,
}
