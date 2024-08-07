return {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    version = "*",
    event = "UIEnter",
    keys = {
        {
            "<Tab>",
            "<cmd>BufferLineCycleNext<cr>",
            desc = "Go to next buffer",
        },
        {
            "<S-Tab>",
            "<cmd>BufferLineCyclePrev<cr>",
            desc = "Go to previous buffer",
        },
    },
    opts = function()
        local mocha = require("catppuccin.palettes").get_palette("mocha")

        return {
            options = {
                themable = true,
                diagnostics = "nvim_lsp",
            },
            highlights = require("catppuccin.groups.integrations.bufferline").get({
                custom = {
                    all = {
                        indicator_selected = { fg = mocha.lavender },
                        indicator_visible = { fg = mocha.mantle, bg = mocha.mantle },
                        buffer_selected = { fg = mocha.lavender }, -- current
                        modified = { fg = mocha.lavender },
                        modified_visible = { fg = mocha.lavender },
                        modified_selected = { fg = mocha.lavender },
                    },
                },
            }),
        }
    end,
}
