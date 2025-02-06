return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        terminal_colrs = true,
        contrast = "hard",
        transparent_mode = false,
        overrides = {
            FoldColumn = { link = "GruvboxBg0" },
            SignColumn = { link = "GruvboxBg0" },
            NormalFloat = { bg = "none" },
            MatchParen = { bg = "none", underline = true },
        },
    },
    config = function(_, opts)
        local gruvbox = require("gruvbox")
        gruvbox.setup(opts)
        gruvbox.load()
    end,
}

-- Last Modified: Wed, 05 Feb 2025 12:39:21 AM
