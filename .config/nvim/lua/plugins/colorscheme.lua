return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavour = "mocha",
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
                CursorColumn = { bg = colors.surface0 },
                -- NormalFloat = { bg = colors.surface0 },
                -- FloatBorder = { fg = colors.lavender },
                -- Pmenu = { bg = colors.surface0 },
                -- MiniIndentscopeSymbol = { fg = colors.mauve },
            }
        end,
        integrations = {
            cmp = true,
            gitsigns = true,
            illuminate = true,
            treesitter = true,
            indent_blankline = {
                enable = true,
                scope_color = "mauve",
            },
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
