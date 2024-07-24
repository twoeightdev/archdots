return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = function()
        local mocha = require("catppuccin.palettes").get_palette("mocha")

        return {
            open_mapping = [[<c-\>]],
            size = 15,
            hide_numbers = true,
            shell = vim.opt.shell:get(),
            -- NOTE: set shade_terminals to false for guibg to work
            shade_terminals = false,
            shading_factor = 2,
            persist_size = true,
            start_in_insert = true,
            direction = "horizontal",
            close_on_exit = true,
            float_opts = {
                border = "single",
            },
            highlights = {
                Normal = {
                    guibg = mocha.surface0,
                },
            },
        }
    end,
}
