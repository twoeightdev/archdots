return {
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = { "md", "markdown" },
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
            width = "full",
        },
        code = {
            sign = false,
            style = "language",
            width = "block",
            border = "thin",
        },
        bullet = {
            right_pad = 1,
        },
    },
}
