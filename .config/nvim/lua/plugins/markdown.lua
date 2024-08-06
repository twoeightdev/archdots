return {
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = { "md", "markdown" },
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
            width = "block",
        },
        code = {
            sign = false,
            style = "normal",
            width = "block",
            border = "thick",
        },
        bullet = {
            right_pad = 1,
        },
    },
}
