return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavour = "auto",
        background = {
            light = "latte",
            dark = "mocha",
        },
        transparent_background = true,
        no_italic = false,
        no_bold = false,
        no_underline = false,
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        color_overrides = {},
        custom_highlights = function(colors)
            return {
                MiniIndentscopeSymbol = { fg = colors.mauve },
                WhichKeyNormal = { bg = colors.base },
                WhichKey = { bg = colors.base, fg = colors.peach },
                MatchParen = {
                    bg = "none",
                    fg = colors.yellow,
                    underline = true,
                    bold = true,
                },
                DiagnosticVirtualTextError = { bg = "none" },
                DiagnosticVirtualTextHint = { bg = "none" },
                DiagnosticVirtualTextInfo = { bg = "none" },
                DiagnosticVirtualTextWarn = { bg = "none" },
                -- WinBar = { fg = colors.red },
            }
        end,
        default_integrations = true,
        integrations = {
            cmp = true,
            -- blink_cmp = true,
            dap = true,
            dashboard = true,
            dap_ui = true,
            fzf = true,
            gitsigns = true,
            indent_blankline = true,
            -- illuminate = true,
            markdown = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "bold" },
                    hints = { "bold" },
                    warnings = { "bold" },
                    information = { "bold" },
                    ok = { "bold" },
                },
                inlay_hints = {
                    background = false,
                },
            },
            neogit = true,
            treesitter = true,
            mason = true,
            which_key = true,
        },
    },
    config = function(_, opts)
        local catppuccin = require("catppuccin")
        catppuccin.setup(opts)
        catppuccin.load()
    end,
}

-- Last Modified: Fri, 13 Dec 2024 02:17:58 AM
