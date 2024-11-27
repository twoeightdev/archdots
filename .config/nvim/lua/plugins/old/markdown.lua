return {
    "MeanderingProgrammer/markdown.nvim",
    enabled = true,
    lazy = false,
    main = "render-markdown",
    dependencies = "nvim-treesitter/nvim-treesitter",
    -- ft = { "md", "markdown" },
    keys = {
        {
            "<leader>am",
            function()
                return require("render-markdown").toggle()
            end,
            desc = "Markdown render toggle",
        },
    },
    opts = {
        win_options = {
            conceallevel = {
                rendered = 2,
            },
            concealcursor = {
                rendered = "n",
            },
        },
        heading = {
            sign = false,
            position = "overlay",
            icons = {
                "Ⓐ  ",
                "Ⓑ  ",
                "Ⓒ  ",
                "Ⓓ  ",
                "Ⓔ  ",
                "Ⓕ  ",
            },
            -- width = "block",
            width = "full",
        },
        code = {
            sign = false,
            style = "language",
            -- width = "block",
            width = "full",
            border = "thin",
        },
        bullet = {
            right_pad = 1,
        },
    },
}
