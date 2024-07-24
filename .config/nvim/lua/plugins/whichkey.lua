return {
    "folke/which-key.nvim",
    -- lazy = true,
    event = "VeryLazy",
    opts = {
        spec = {
            {
                mode = { "n", "v" },
                { "<leader>a", group = "action" },
                { "<leader>g", group = "git" },
                { "<leader>f", group = "find" },
                { "<leader><tab>", group = "buffers" },
                { "<leader>d", group = "diagnostics" },
            },
        },
        win = {
            no_overlap = true,
            border = "single",
            title = false,
        },
        layout = {
            spacing = 1,
            align = "center",
        },
        icons = {
            rules = false,
            breadcrumb = "»",
            -- separator = "▶",
            separator = "🌑",
            group = "+",
            keys = {
                Tab = "⭳",
            },
        },
        show_help = false,
        show_keys = false,
    },
}
