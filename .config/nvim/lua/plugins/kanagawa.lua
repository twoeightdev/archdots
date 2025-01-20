return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        undercurl = true,
        commentStyle = { italic = true },
        transparent = true,
        terminalColors = true,
        overrides = function(colors)
            return {
                -- WhichKeyNormal = { bg = colors.palette.dragonBlack3 },
                NormalFloat = { bg = "none" },
                -- WhichKeyBorder = {
                --     bg = colors.palette.dragonBlack3,
                --     fg = colors.palette.dragonWhite,
                -- },
                FloatBorder = { bg = "none" },
                -- WhichKey = {
                --     bg = colors.palette.dragonBlack3,
                --     fg = colors.palette.dragonPink,
                -- },
                MatchParen = {
                    bg = "none",
                    fg = "none",
                    underline = true,
                    bold = true,
                },
                FoldColumn = { bg = "none" },
                SignColumn = { bg = "none" },
                LineNr = { bg = "none" },
                MiniIndentscopeSymbol = { fg = colors.palette.dragonGreen },
                DiagnosticVirtualTextError = { bg = "none" },
                DiagnosticVirtualTextHint = { bg = "none" },
                DiagnosticVirtualTextInfo = { bg = "none" },
                DiagnosticVirtualTextWarn = { bg = "none" },
            }
        end,
        theme = "wave",
        background = {
            dark = "dragon",
            light = "lotus",
        },
    },
    config = function(_, opts)
        local kanagawa = require("kanagawa")
        kanagawa.setup(opts)
        kanagawa.load()
    end,
}

-- Last Modified: Sun, 19 Jan 2025 02:37:26 AM
